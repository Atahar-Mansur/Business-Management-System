<%@ Page Title="" MasterPageFile="~/MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="Production.aspx.cs" Inherits="BusinessManagementSystem.UI.Production" %>

<asp:Content ID="homeHead" ContentPlaceHolderID="head" runat="server">
    <style>
        .formCard{
            padding:20px;
        }
        .formMargin{
            margin-top:40px;
        }
        .backgroundPAD{
            width:1100px;
        }
        .textAlignCenter{
            text-align:center;
        }
        .grdView{
            padding:20px;
        }
    </style>
</asp:Content>

<asp:Content ID="homeBody" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="card formCard backgroundPAD">
            <form id="frmChallanIn" runat="server">
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h3 class="text-center text-primary">Production</h3>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-9"></div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Date:</label>
                            <asp:TextBox ID="txtProductionDate" runat="server" TextMode="Date">****</asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="form-check-label">Enter Row Metarial :</label>
                            <asp:DropDownList ID="drpRowPro" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Item Name"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="form-check-label">Remark :</label>
                            <asp:TextBox ID="txtRowRemark" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-check-label">Add Manufactured Products :</label>
                            <asp:DropDownList ID="drpDetails" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="form-check-label">Quantity :</label>
                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label class="form-check-label">Remark :</label>
                            <asp:TextBox ID="txtRemark" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <br />
                        <asp:Button ID="btnAdd" runat="server" class="btn btn-info pr-5 pl-5 text-right" Text="ADD" OnClick="btnAdd_Click" />
                    </div>
                </div>

                <div class="row grdView">
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                        CellPadding="1" ForeColor="Black" GridLines="Vertical" OnRowDeleting="dgv_RowDeleting">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="SL." HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("strDetails") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Details" SortExpression="dtls">
                                <ItemTemplate>
                                    <asp:Label ID="lblDetails" runat="server" Text='<%# Bind("strDetails") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="300px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity" SortExpression="qnt" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("intQuantity") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Unit/KG" SortExpression="UpK" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblUnitPerKG" runat="server" Text='<%# Bind("decUnitPerKG") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Total(in KG)" SortExpression="total" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("decTotal") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Remarks" SortExpression="remark" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("strRemark") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="200px" />
                            </asp:TemplateField>

                            <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="Red" ControlStyle-Font-Bold="true" />
                        </Columns>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>

                <div class="row" id="divTotal" runat="server" visible="false">
                    <div class="col-md-12">
                        <h4 id="lblTotal" runat="server" class="font-weight-bold text-dark float-left">00</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5"></div>
                    <div class="col-md-4">
                        <asp:Button ID="btnCreateChallan" runat="server" class="btn btn-success pr-4 pl-4 text-right" Visible="false" Text="Enter Productions" OnClick="btnCreateChallan_Click" OnClientClick="return confirm('Are you want to stock in this Challan');"/>
                    </div>
                </div>

            </form>
        </div>
    </div>
</asp:Content>
