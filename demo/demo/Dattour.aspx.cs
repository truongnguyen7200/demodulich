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
    public partial class Dattour : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        protected void dk_Click(object sender, EventArgs e)
        { 
            sign();
        }
        
        void sign()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Dattour(Matour,Hoten,Lon,Nho,sdt,date) values(@Matour,@Hoten,@Lon,@Nho,@sdt,@date)", con);
                cmd.Parameters.AddWithValue("@Matour", TextMT.Text.Trim());
                cmd.Parameters.AddWithValue("@Hoten", TextHT.Text.Trim());
                cmd.Parameters.AddWithValue("@Lon", TextNL.Text.Trim());
                cmd.Parameters.AddWithValue("@Nho", TextTEM.Text.Trim());
                cmd.Parameters.AddWithValue("@sdt", TextSDT.Text.Trim());
                cmd.Parameters.AddWithValue("@date", Textdate.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Đặt tour thành công');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}
