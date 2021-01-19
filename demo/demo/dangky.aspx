<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dangky.aspx.cs" Inherits="demo.dangky" %>
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
                           <img width="150px" src="imgs/263-2636557_icon-admin-cartoon.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>Đăng Ký</h3>
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
                           <asp:TextBox CssClass="form-control" ID="TextTK" runat="server" placeholder="Tài khoản"></asp:TextBox>
                        </div>
                        <label>Mật khẩu</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextMK" runat="server" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="ButDK" runat="server" OnClick="ButDK_Click" Text="Đăng ký" BackColor="#3366ff" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="User.aspx"><< Quay về</a><br><br>
         </div>
      </div>
   </div>
</asp:Content>
