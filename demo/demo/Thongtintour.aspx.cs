using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo
{
    public partial class Thongtintour : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string Img;
        static int Max, GG, TT;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill();
            }

            GridView1.DataBind();
        }

        // go button click
        protected void Btntim_Click(object sender, EventArgs e)
        {
            get();
        }


        // update button click
        protected void Btnup_Click(object sender, EventArgs e)
        {
            update();
        }
        // delete button click
        protected void Btndelete_Click(object sender, EventArgs e)
        {
            delete();
        }
        // add button click
        protected void Btnadd_Click(object sender, EventArgs e)
        {
            if (check())
            {
                Response.Write("<script>alert('Không tìm thấy mã tour');</script>");
            }
            else
            {
                add();
            }
        }



        // user defined functions

        void delete()
        {
            if (check())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon); //kết nối cơ sở dữ liệu sql
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Tour WHERE Matour='" + TxtMT.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Xóa thành công');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Không tìm thấy mã');</script>");
            }
        }

        void update()
        {

            if (check())
            {

               try
                {
 
                    string kv = "";
                    foreach (int i in ListKV.GetSelectedIndices())
                    {
                        kv = kv + ListKV.Items[i] + ",";
                    }
                    kv = kv.Remove(kv.Length - 1);

                    //Dùng để lưu hình ảnh
                    string filepath = "~/hinh/";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("hinh/" + filename));
                    filepath = "~/hinh/" + filename;

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update  Tour set Tentour=@Tentour, KhuVuc=@KhuVuc, Mien=@Mien, Hotel=@Hotel, NgayDi=@NgayDi, PhuongTien=@PhuongTien, SoNgay=@SoNgay, SoDem=@SoDem, Min=@Min, GhiChu=@GhiChu, Max=@Max, GiamGia=@GiamGia, GiaTour=@GiaTour, Hinh=@Hinh where Matour='" + TxtMT.Text.Trim() + "'", con);
                
                    cmd.Parameters.AddWithValue("@Tentour", Txtten.Text.Trim());
                    cmd.Parameters.AddWithValue("@KhuVuc", kv);
                    cmd.Parameters.AddWithValue("@Mien", DropMien.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Hotel", DropKS.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@NgayDi", Txtdate.Text.Trim());
                    cmd.Parameters.AddWithValue("@PhuongTien", DropPT.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@SoNgay", TextSN.Text.Trim());
                    cmd.Parameters.AddWithValue("@SoDem", TextDem.Text.Trim());
                    cmd.Parameters.AddWithValue("@Min", Textmin.Text.Trim());
                    cmd.Parameters.AddWithValue("@GhiChu", TextGC.Text.Trim());
                    cmd.Parameters.AddWithValue("@Max", Textmax.Text.Trim());
                    cmd.Parameters.AddWithValue("@GiamGia", Textgiamgia.Text.Trim());
                    cmd.Parameters.AddWithValue("@GiaTour", TextTT.Text.Trim());
                    cmd.Parameters.AddWithValue("@Hinh", filepath);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Cập nhập thành công');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Thất bại');</script>");
                }
            }
           
        }


        void get()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //truy vấn và cập nhật dữ liệu
                SqlCommand cmd = new SqlCommand("SELECT * from Tour WHERE Matour='" + TxtMT.Text.Trim() + "';", con);
                // SqlDataAdapte sử dụng để điền vào DataSet và cập nhật cơ sở dữ liệu SQL Server
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                // Hỗ trợ tạo bảng có phân trang sắp xếp nhiều cột
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    Txtten.Text = dt.Rows[0]["Tentour"].ToString();
                    Txtdate.Text = dt.Rows[0]["NgayDI"].ToString();
                    TextSN.Text = dt.Rows[0]["SoNgay"].ToString();
                    TextDem.Text = dt.Rows[0]["SoDem"].ToString().Trim();
                    Textmin.Text = dt.Rows[0]["Min"].ToString().Trim();
                    Textmax.Text = dt.Rows[0]["Max"].ToString().Trim();
                    Textgiamgia.Text = dt.Rows[0]["GiamGia"].ToString().Trim();
                    TextGC.Text = dt.Rows[0]["GhiChu"].ToString();
                    TextTT.Text = dt.Rows[0]["GiaTour"].ToString();
                    DropPT.SelectedValue = dt.Rows[0]["PhuongTien"].ToString().Trim();
                    DropKS.SelectedValue = dt.Rows[0]["Hotel"].ToString().Trim();
                    DropMien.SelectedValue = dt.Rows[0]["Mien"].ToString().Trim();

                    ListKV.ClearSelection();
                    string[] genre = dt.Rows[0]["KhuVuc"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListKV.Items.Count; j++)
                        {
                            if (ListKV.Items[j].ToString() == genre[i])
                            {
                                ListKV.Items[j].Selected = true;

                            }
                        }
                    }

                    Max= Convert.ToInt32(dt.Rows[0]["Max"].ToString().Trim());
                    GG = Convert.ToInt32(dt.Rows[0]["GiamGia"].ToString().Trim());
                    TT = Max - GG;
                    Img= dt.Rows[0]["Hinh"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Không tìm thấy mã');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        void fill()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Mien from TinhTP;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropMien.DataSource = dt;
                DropMien.DataValueField = "Mien";
                DropMien.DataBind();

                cmd = new SqlCommand("SELECT Hotel from TinhTP;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropKS.DataSource = dt;
                DropKS.DataValueField = "Hotel";
                DropKS.DataBind();

            }
            catch (Exception ex)
            {

            }
        }

        bool check()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Tour where Matour='" + TxtMT.Text.Trim() + "' OR Tentour='" + Txtten.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void add()
        {
            try
            {
                // Khai báo khu vực
                string kv = "";
                foreach (int i in ListKV.GetSelectedIndices())
                {
                    kv = kv + ListKV.Items[i] + ",";
                }
                kv = kv.Remove(kv.Length - 1);
                //Khai báo hình
                string filepath = "~/hinh/";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("hinh/" + filename));
                filepath = "~/hinh/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //Thực thi truy vấn
                SqlCommand cmd = new SqlCommand("INSERT INTO Tour(Matour,Tentour,KhuVuc,Mien,Hotel,NgayDi,PhuongTien,SoNgay,SoDem,Min,GhiChu,Max,GiamGia,GiaTour,Hinh) values(@Matour,@Tentour,@KhuVuc,@Mien,@Hotel,@NgayDi,@PhuongTien,@SoNgay,@SoDem,@Min,@GhiChu,@Max,@GiamGia,@GiaTour,@Hinh)", con);

                cmd.Parameters.AddWithValue("@Matour", TxtMT.Text.Trim());
                cmd.Parameters.AddWithValue("@Tentour", Txtten.Text.Trim());
                cmd.Parameters.AddWithValue("@KhuVuc", kv);
                cmd.Parameters.AddWithValue("@Mien", DropMien.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Hotel", DropKS.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@NgayDi", Txtdate.Text.Trim());
                cmd.Parameters.AddWithValue("@PhuongTien", DropPT.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SoNgay", TextSN.Text.Trim());
                cmd.Parameters.AddWithValue("@SoDem", TextDem.Text.Trim());
                cmd.Parameters.AddWithValue("@Min", Textmin.Text.Trim());
                cmd.Parameters.AddWithValue("@GhiChu", TextGC.Text.Trim());
                cmd.Parameters.AddWithValue("@Max", Textmax.Text.Trim());
                cmd.Parameters.AddWithValue("@GiamGia", Textgiamgia.Text.Trim());
                cmd.Parameters.AddWithValue("@GiaTour", TextTT.Text.Trim());
                cmd.Parameters.AddWithValue("@Hinh", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Thêm thành công.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}