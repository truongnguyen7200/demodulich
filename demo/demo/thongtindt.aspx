<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="thongtindt.aspx.cs" Inherits="demo.thongtindt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dulichConnectionString7 %>" SelectCommand="SELECT * FROM [Dattour]"></asp:SqlDataSource>
    <div class="col-md-12">
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
                                <asp:BoundField DataField="Nho" HeaderText="Số người nhỏ" SortExpression="Nho" />
                                <asp:BoundField DataField="sdt" HeaderText="Liên lạc" SortExpression="sdt" />
                                <asp:BoundField DataField="date" HeaderText="Ngày Đặt" SortExpression="date" />
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
 </div>


</asp:Content>
