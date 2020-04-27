<%@ Page Title="" MasterPageFile="~/MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="StockRegister.aspx.cs" Inherits="BusinessManagementSystem.UI.StockRegister" %>

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
        .grdView{
            padding:20px;
        }
    </style>
</asp:Content>

<asp:Content ID="homeBody" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="card formCard backgroundPAD">
            <form id="frmStockRegister" runat="server">
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h3 class="text-center text-primary">Stock Register</h3>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-success">Product</label>
                            <asp:DropDownList ID="drpProducts" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="text-success">From Date</label>
                            <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="text-success">To Date</label>
                            <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5"></div>
                    <div class="col-md-2">
                        <asp:Button ID="btnShow" runat="server" class="btn btn-info pr-5 pl-5 text-right" Text="Show" OnClick="btnShow_Click"/>
                    </div>
                </div>

                <div class="row grdView">
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                        CellPadding="1" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="SL.">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("dteDate") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Date" SortExpression="date">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("dteDate") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="250px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Party Name" SortExpression="parN">
                                <ItemTemplate>
                                    <asp:Label ID="lblPartyName" runat="server" Text='<%# Bind("strPartyName") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="400px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Receipts" SortExpression="rec">
                                <ItemTemplate>
                                    <asp:Label ID="lblReceipts" runat="server" Text='<%# Bind("intReceipts") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Challan No" SortExpression="chalN">
                                <ItemTemplate>
                                    <asp:Label ID="lblChallanNoIn" runat="server" Text='<%# Bind("intChallanNoIn") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity Sold" SortExpression="qntS">
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("intQuantity") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Challan No" SortExpression="chalN">
                                <ItemTemplate>
                                    <asp:Label ID="lblChallanNoOut" runat="server" Text='<%# Bind("intChallanNoOut") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Balance" SortExpression="blnc">
                                <ItemTemplate>
                                    <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("intBalance") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Remarks" SortExpression="rem">
                                <ItemTemplate>
                                    <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("strRemarks") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="200px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>

            </form>
        </div>
    </div>
</asp:Content>