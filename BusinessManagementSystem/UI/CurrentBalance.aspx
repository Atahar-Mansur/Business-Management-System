<%@ Page Title="" MasterPageFile="~/MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="CurrentBalance.aspx.cs" Inherits="BusinessManagementSystem.UI.CurrentBalance" %>

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
                        <h3 class="text-center text-primary">Current Balance in Stock</h3>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>

                <div class="row grdView">
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                        CellPadding="1" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="SL.">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("strDetails") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Name" SortExpression="prdt">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("strDetails") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="250px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Current Balance" SortExpression="crnBal">
                                <ItemTemplate>
                                    <asp:Label ID="lblCurrentBalance" runat="server" Text='<%# Bind("intBalance") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="125px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText=" " SortExpression=" ">
                                <ItemTemplate>
                                    <asp:Label ID="lblGap" runat="server" Text=' '></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="5px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Last Challan No" SortExpression="lastCN">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastChallanNo" runat="server" Text='<%# Bind("intChallanId") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Party Name" SortExpression="parN">
                                <ItemTemplate>
                                    <asp:Label ID="lblPartyName" runat="server" Text='<%# Bind("strPartyName") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="200px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action" SortExpression="act">
                                <ItemTemplate>
                                    <asp:Label ID="lblAction" runat="server" Text='<%# Bind("strAction") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="75px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Date" SortExpression="dte">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("dteChallanDate") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity" SortExpression="qunt">
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("intQuantity") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="125px" />
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