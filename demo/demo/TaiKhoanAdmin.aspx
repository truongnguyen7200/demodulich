<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TaiKhoanAdmin.aspx.cs" Inherits="demo.TaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Tài khoản</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/search-icon-large.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-8">
                        <label>Tên tài khoản</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TxtTK" runat="server" placeholder="TK"></asp:TextBox>
                              <asp:Button class="btn btn-primary" ID="BtnTim" runat="server" Text="Go" OnClick="BtnTim_Click" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Mật khẩu</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtMK" runat="server" placeholder="Mật khẩu"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Btnadd" class="btn btn-lg btn-block btn-success" OnClick="Btnadd_Click" runat="server" Text="Thêm" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Btnup" class="btn btn-lg btn-block btn-warning" OnClick="Btnup_Click" runat="server" Text="Cập nhật" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Btndelete" class="btn btn-lg btn-block btn-danger" OnClick="Btndelete_Click" runat="server" Text="Xóa" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Lịch sử</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dulichConnectionString %>" SelectCommand="SELECT * FROM [Taikhoan]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
