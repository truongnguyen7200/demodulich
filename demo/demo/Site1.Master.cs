using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                    LinkAdmin.Visible = true; // nút admin
                    LinkDN.Visible = true; // nút đăng nhập
                    LinkDT.Visible = false; // nút đặt tour
                    LinkTT.Visible = false; // nút thông tin
                    LinkQL.Visible = false; // nút quản lý
                    LinkST.Visible = false; // nút sửa tour
                    LinkDX.Visible = false; // nút đăng xuất
                    LinkXC.Visible = false; // nút xin chào

                
                 if (Session["role"].Equals("user"))
                {
                    LinkAdmin.Visible = false; // nút admin
                    LinkDN.Visible = false; // nút đăng nhập
                    LinkDT.Visible = true; // nút đặt tour
                    LinkTT.Visible = false; // nút thông tin
                    LinkQL.Visible = false; // nút quản lý
                    LinkST.Visible = false; // nút sửa tour
                    LinkDX.Visible = true; // nút đăng xuất
                    LinkXC.Visible = true; // nút xin chào
                    LinkXC.Text = "Hello " + Session["Tentaikhoan"].ToString();

                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkAdmin.Visible = false; // admin login link button
                    LinkDN.Visible = false; // sign up link button
                    LinkDT.Visible = false;
                    LinkTT.Visible = true; // nút thông tin
                    LinkQL.Visible = true;
                    LinkST.Visible = true;
                    LinkDX.Visible = true; // logout link button
                    LinkXC.Visible = true; // hello user link button
                    LinkXC.Text = "Hello Admin";


                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkDN_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkDT_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dattour.aspx");
        }
        protected void LinkQL_Click(object sender, EventArgs e)
        {
            Response.Redirect("TaiKhoanAdmin.aspx");
        }
        protected void LinkST_Click(object sender, EventArgs e)
        {
            Response.Redirect("Thongtintour.aspx");
        }
        protected void LinkTT_Click(object sender, EventArgs e)
        {
            Response.Redirect("thongtindt.aspx");
        }


        protected void LinkDX_Click(object sender, EventArgs e)
        {
            Session["Tentaikhoan"] = "";
            Session["Matkhau"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkAdmin.Visible = true; // admin login link button
            LinkDN.Visible = true; // sign up link button
            LinkDT.Visible = false ;
            LinkTT.Visible = false; // nút thông tin
            LinkQL.Visible = false;
            LinkST.Visible = false;
            LinkDX.Visible = false; // logout link button
            LinkXC.Visible = false; // hello user link button


        }

       
    }
}