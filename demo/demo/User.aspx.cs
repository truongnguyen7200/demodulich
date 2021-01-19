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
    public partial class User : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        // Đặt chuỗi kết nối trong webconfig là con--Và sau đó tham chiếu nó với tên trong mã
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnDN_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed) //Kiểm tra xem SQL Connection là mở hoặc đóng

                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from Taikhoan where Tentaikhoan='" + TextTK.Text.Trim() + "' AND Matkhau='" + TextMK.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader(); //Đọc dữ liệu từ SQL
                if (dr.HasRows) //nếu nó không có hàng nó sẽ không đọc
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Đăng nhập thành công');</script>"); // trả về kết quả
                        Session["Tentaikhoan"] = dr.GetValue(0).ToString();//lưu và đọc dữ liệu
                        Session["Matkhau"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Thất bại');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}

    