<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dattour.aspx.cs" Inherits="demo.Dattour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Đặt Tour</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/rocket-book.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Mã Tour</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="!" ControlToValidate="TextMT"  ForeColor="Red"></asp:RequiredFieldValidator>
                        <div class="form-group">
                            
                           <asp:TextBox CssClass="form-control" ID="TextMT" runat="server" placeholder="Mã Tour"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Họ tên</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="!" ControlToValidate="TextHT"  ForeColor="Red"></asp:RequiredFieldValidator>
                         <div class="form-group">
                           <div class="input-group">
                       
                              <asp:TextBox CssClass="form-control" ID="TextHT" runat="server" placeholder="Họ tên"></asp:TextBox>
                       
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Số người lớn</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="!" ControlToValidate="TextNL"  ForeColor="Red"></asp:RequiredFieldValidator>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextNL" runat="server" placeholder="Nhập" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Số trẻ em</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="!" ControlToValidate="TextTEM"  ForeColor="Red"></asp:RequiredFieldValidator>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextTEM" runat="server" placeholder="Nhập" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Số điện thoại</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="!" ControlToValidate="TextSDT"  ForeColor="Red"></asp:RequiredFieldValidator>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextSDT" runat="server" placeholder="Nhập" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Ngày đặt</label>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="!" ControlToValidate="Textdate"  ForeColor="Red"></asp:RequiredFieldValidator>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Textdate" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
          
                     <div class="col-12">
                        <asp:Button ID="dk" class="btn btn-lg btn-block btn-success" runat="server" OnClick="dk_Click" Text="Đặt ngay" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Quay về trang chủ</a><br>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dulichConnectionString6 %>" SelectCommand="SELECT * FROM [Dattour]"></asp:SqlDataSource>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Lịch Sử Đặt Tour</h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Matour" HeaderText="Mã tour" SortExpression="Matour" />
                                <asp:BoundField DataField="Hoten" HeaderText="Họ tên khách hàng" SortExpression="Hoten" />
                                <asp:BoundField DataField="Lon" HeaderText="Số người lớn" SortExpression="Lon" />
                                <asp:BoundField DataField="Nho" HeaderText="Số trẻ em" SortExpression="Nho" />
                                <asp:BoundField DataField="sdt" HeaderText="Liên hệ" SortExpression="sdt" />
                                <asp:BoundField DataField="date" HeaderText="Ngày đặt" SortExpression="date" />
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
