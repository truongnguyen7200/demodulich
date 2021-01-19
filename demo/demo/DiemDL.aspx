<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DiemDL.aspx.cs" Inherits="demo.DiemDL" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
        <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <center>
                        <h3>
                        Danh sách tour du lịch</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
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
                                                   <asp:Label ID="Lb_Ten" runat="server" Text='<%# Eval("Tentour") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Miền - </span>
                                                   <asp:Label ID="Lb_Mien" runat="server" Font-Bold="True" Text='<%# Eval("Mien") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Khu Vực - </span>
                                                   <asp:Label ID="Lb_KV" runat="server" Font-Bold="True" Text='<%# Eval("KhuVuc") %>'></asp:Label>
                                                   &nbsp;| 
                                                   <span>
                                                      Phương Tiện -<span>&nbsp;</span>
                                                      <asp:Label ID="Lb_PT" runat="server" Font-Bold="True" Text='<%# Eval("PhuongTien") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Khách Sạn -
                                                   <asp:Label ID="Lb_Hotel" runat="server" Font-Bold="True" Text='<%# Eval("Hotel") %>'></asp:Label>
                                                   &nbsp;| Ngày Đi -
                                                   <asp:Label ID="Lb_NgayDi" runat="server" Font-Bold="True" Text='<%# Eval("NgayDi") %>'></asp:Label>
                                                   &nbsp;| Tối thiểu -
                                                   <asp:Label ID="Lb_Min" runat="server" Font-Bold="True" Text='<%# Eval("Min") %>'></asp:Label>
                                                   &nbsp;| Số Ngày -
                                                   <asp:Label ID="Lb_SoNgay" runat="server" Font-Bold="True" Text='<%# Eval("SoNgay") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Số Đêm -
                                                   <asp:Label ID="Lb_SoDem" runat="server" Font-Bold="True" Text='<%# Eval("SoDem") %>'></asp:Label>
                                                   &nbsp;| Tối Đa -
                                                   <asp:Label ID="Lb_Max" runat="server" Font-Bold="True" Text='<%# Eval("Max") %>'></asp:Label>
                                                   &nbsp;| Giảm Giá -
                                                   <asp:Label ID="Lb_GG" runat="server" Font-Bold="True" Text='<%# Eval("GiamGia") %>'></asp:Label>
                                                   &nbsp;| Giá Tour -
                                                   <asp:Label ID="Lb_GT" runat="server" Font-Bold="True" Text='<%# Eval("GiaTour") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Giới Thiệu -
                                                   <asp:Label ID="Lb_GC" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("GhiChu") %>'></asp:Label>
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
  </div>>
    </asp:Content>
