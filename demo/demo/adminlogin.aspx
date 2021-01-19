<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="demo.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="imgs/admin-settings-male.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>ADMIN</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Tên tài khoản</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtTK" runat="server" placeholder="Tài khoản"></asp:TextBox>
                        </div>
                        <label>Mật khẩu</label>
  
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TxtMK" runat="server" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="BtnDN" runat="server" Text="Đăng nhập" OnClick="BtnDN_Click" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Quay về trang chủ<br><br>
         </div>
      </div>
   </div>
</asp:Content>