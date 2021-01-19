using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo
{
    public partial class TaiKhoan : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        // add publisher
        protected void Btnadd_Click(object sender, EventArgs e)
        {
            if (check())
            {
                Response.Write("<script>alert('Không tìm thấy tên tài khoản.');</script>");
            }
            else
            {
                them();
            }
        }
        // update publisher
        protected void Btnup_Click(object sender, EventArgs e)
        {
            if (check())
            {
                update();
            }
            else
            {
                Response.Write("<script>alert('Không tìm thấy tên tài khoản');</script>");
            }
        }
        // delete publisher
        protected void Btndelete_Click(object sender, EventArgs e)
        {
            if (check())
            {
                xoa();
            }
            else
            {
                Response.Write("<script>alert('Không tìm thấy tên tài khoản');</script>");
            }
        }
        protected void BtnTim_Click(object sender, EventArgs e)
        {
            get();
        }




        // user defined functions

        void get()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Taikhoan where Tentaikhoan='" + TxtTK.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TxtMK.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Không tìm thấy tên tài khoản.');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

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

                SqlCommand cmd = new SqlCommand("SELECT * from Taikhoan where Tentaikhoan='" + TxtTK.Text.Trim() + "';", con);
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

        void them()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Taikhoan(Tentaikhoan,Matkhau) values(@Tentaikhoan,@Matkhau)", con);

                cmd.Parameters.AddWithValue("@Tentaikhoan", TxtTK.Text.Trim());
                cmd.Parameters.AddWithValue("@Matkhau", TxtMK.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert(' Thêm thành công.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        public void update()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update Taikhoan set Matkhau=@Matkhau WHERE Tentaikhoan='" + TxtTK.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@Matkhau", TxtMK.Text.Trim());
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Cập thành công');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Không tìm thấy tên tài khoản');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        public void xoa()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("Delete from Taikhoan WHERE Tentaikhoan='" + TxtTK.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Xóa thành công');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Không tìm thấy tên tài khoản');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}


