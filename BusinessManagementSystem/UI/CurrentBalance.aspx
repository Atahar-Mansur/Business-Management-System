<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentBalance.aspx.cs" Inherits="BusinessManagementSystem.UI.CurrentBalance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Perfect Point BMS</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>

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

<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a href="http://localhost:53979/HomePage.aspx" class="navbar-brand">Perfect Point</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownProduct" role="button" data-toggle="dropdown">Product</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownProduct">
                        <a class="dropdown-item" href="#">Products Details</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="http://localhost:53979/UI/Product.aspx">Add New Product</a>
                    </div>
                </li>
                <li class="nav-item active dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownStock" role="button" data-toggle="dropdown">Stock</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownStock">
                        <a class="dropdown-item" href="http://localhost:53979/UI/StockRegister.aspx">Stock Register</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="http://localhost:53979/UI/CurrentBalance.aspx">Current Balance</a>
                    </div>
                </li>
                <li class="nav-item active dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownChallan" role="button" data-toggle="dropdown">Challan</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownChallan">
                        <a class="dropdown-item" href="http://localhost:53979/UI/InChallan.aspx">Stock In</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="http://localhost:53979/UI/OutChallan.aspx">Challan/Stock Out</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Bill</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Ladger</a>
                </li>
            </ul>
        </div>
    </nav>

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
</body>
</html>
