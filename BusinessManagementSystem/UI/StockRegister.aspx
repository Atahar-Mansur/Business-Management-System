<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockRegister.aspx.cs" Inherits="BusinessManagementSystem.UI.StockRegister" %>

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
                                <ItemStyle HorizontalAlign="Left" Width="200px" />
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
</body>
</html>
