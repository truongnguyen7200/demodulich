<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Thongtintour.aspx.cs" Inherits="demo.Thongtintour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
 
       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();
 
               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };
 
               reader.readAsDataURL(input.files[0]);
           }
       }
 
   </script>
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
                           <h4>Quản Lý Tour</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="imgview" Height="150px" Width="100px"  />
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
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Mã tour</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TxtMT" runat="server" placeholder="Mã tour"></asp:TextBox>
                              <asp:Button class="form-control btn btn-primary" ID="Btntim" runat="server" Text="Go" OnClick="Btntim_Click" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Tên tour</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Txtten" runat="server" placeholder="Tên tour"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Phương Tiện</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropPT" runat="server">
                              <asp:ListItem Text="Xe Máy" Value="Xe Máy" />
                              <asp:ListItem Text="Xe Ô Tô" Value="Xe Ô Tô" />
                              <asp:ListItem Text="Tàu hỏa" Value="Tàu Hỏa" />
                              <asp:ListItem Text="Máy bay" Value="Máy Bay" />
                              <asp:ListItem Text="Thuyền" Value="Thuyền" />
                              <asp:ListItem Text="Ca nô" Value="Ca nô" />
                           </asp:DropDownList>
                        </div>
                        <label>Tên khách sạn</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropKS" runat="server">
                              <asp:ListItem Text="Hoàng Hôn" Value="Hoàng Hôn" />
                              <asp:ListItem Text="Bình Minh" Value="Bình Minh" />
                               <asp:ListItem Text="Hoa Biển" Value="Hoa Biển" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Miền</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropMien" runat="server">
                              <asp:ListItem Text="Bắc" Value="Bắc" />
                              <asp:ListItem Text="Nam" Value="Nam" />
                               <asp:ListItem Text="Trung" Value="Trung" />
                           </asp:DropDownList>
                        </div>
                        <label>Ngày khởi hành</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Txtdate" runat="server" placeholder="Ngày" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Khu Vực</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="ListKV" runat="server" SelectionMode="Multiple" Rows="5">
                              <asp:ListItem Text="Quy Nhơn" Value="Quy Nhơn" />
                              <asp:ListItem Text="Lâm Đồng" Value="Lâm Đồng" />
                              <asp:ListItem Text="Bắc Ninh" Value="Bắc Ninh" />
                              <asp:ListItem Text="Gia Lai" Value="Gia Lai" />
                              <asp:ListItem Text="Bến Tre" Value="Bến Tre" />
                              <asp:ListItem Text="Cam Ranh" Value="Cam Ranh" />
                              <asp:ListItem Text="Phù Mỹ" Value="Phù Mỹ" />
                              <asp:ListItem Text="Nha Trang" Value="Nha Trang" />
                              <asp:ListItem Text="Quy Hòa" Value="Quy Hòa" />
                              <asp:ListItem Text="Phú Yên" Value="Phú Yên" />
                              <asp:ListItem Text="Thanh Xuân" Value="Thanh Xuân" />
                              <asp:ListItem Text="Cà Mau" Value="Cà Mau" />
                              <asp:ListItem Text="Châu Đốc" Value="Châu Đốc" />
                              <asp:ListItem Text="Phù Cát" Value="Phù Cát" />
                              <asp:ListItem Text="Cát Khánh" Value="Cát Khánh" />
                              <asp:ListItem Text="Cát Nhơn" Value="Cát Nhơn" />
                              <asp:ListItem Text="Cát Hải" Value="Cát Hải" />
                              <asp:ListItem Text="Pleiku" Value="Pleiku" />
                              <asp:ListItem Text="Mỹ Hòa" Value="Mỹ Hòa" />
                              <asp:ListItem Text="Mỹ Tài" Value="Mỹ Tài" />
                              <asp:ListItem Text="Mỹ Hiệp" Value="Mỹ Hiệp" />
                              <asp:ListItem Text="Ngô Mây" Value="Ngô Mây" />
                              <asp:ListItem Text="Lý Thường KIệt" Value="Lý Thường KIệt" />
                              <asp:ListItem Text="Cát Tiến" Value="Cát Tiến" />
                              <asp:ListItem Text="Hoài Thanh" Value="Hoài Thanh" />
                              <asp:ListItem Text="Hoài Bão" Value="Hoài Bão" />
                           </asp:ListBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Số ngày</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextSN" runat="server" placeholder="Số ngày"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Số đêm</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextDem" runat="server" placeholder="Số đêm" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Min</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Textmin" runat="server" placeholder="Min" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Max</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Textmax" runat="server" placeholder="Max" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Giảm Giá</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Textgiamgia" runat="server" placeholder="Giảm Giá"  ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Thành Tiền</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextTT" runat="server" placeholder="Thành Tiền"  ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Ghi chú</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextGC" runat="server" placeholder="Ghi Chú" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Btnadd" class="btn btn-lg btn-block btn-success" runat="server" Text="Thêm" OnClick="Btnadd_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Btnup" class="btn btn-lg btn-block btn-warning" runat="server" Text="Cập nhật" OnClick="Btnup_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Btndelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Xóa" OnClick="Btndelete_Click" />
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
                           <h4>Thông tin tour</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dulichConnectionString4 %>" SelectCommand="SELECT * FROM [Tour]" ></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Matour" DataSourceID="SqlDataSource1" >
                            <Columns>
                              <asp:BoundField DataField="Matour" HeaderText="ID" ReadOnly="True" SortExpression="Matour" >
                                 <ControlStyle Font-Bold="True" />
                                 <ItemStyle Font-Bold="True" />
                              </asp:BoundField>
                              <asp:TemplateField>
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">
                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("Tentour") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Miền - </span>
                                                   <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Mien") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Khu Vực - </span>
                                                   <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("KhuVuc") %>'></asp:Label>
                                                   &nbsp;| 
                                                   <span>
                                                      Phương Tiện -<span>&nbsp;</span>
                                                      <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("PhuongTien") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Khách Sạn -
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Hotel") %>'></asp:Label>
                                                   &nbsp;| Ngày Đi -
                                                   <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("NgayDi") %>'></asp:Label>
                                                   &nbsp;| Tối thiểu -
                                                   <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("Min") %>'></asp:Label>
                                                   &nbsp;| Số Ngày -
                                                   <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("SoNgay") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Số Đêm -
                                                   <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("SoDem") %>'></asp:Label>
                                                   &nbsp;| Tối Đa -
                                                   <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Max") %>'></asp:Label>
                                                   &nbsp;| Giảm Giá -
                                                   <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("GiamGia") %>'></asp:Label>
                                                   &nbsp;| Giá Tour -
                                                   <asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("GiaTour") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Giới Thiệu -
                                                   <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("GhiChu") %>'></asp:Label>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Hinh") %>' />
                                          </div>
                                       </div>
                                    </div>
                                 </ItemTemplate>
                              </asp:TemplateField>
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