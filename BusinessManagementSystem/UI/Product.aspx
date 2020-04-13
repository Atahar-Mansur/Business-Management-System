<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="BusinessManagementSystem.UI.Product" %>

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
                <li class="nav-item">
                    <a class="nav-link" href="#">Stock</a>
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
        <div class="card formCard">
            <form id="frmChallanIn" runat="server">
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h3 class="text-center text-primary">New Products Entry</h3>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Product Name"></asp:TextBox>
                    </div>
                    <div class="col-md-5">
                        <asp:TextBox ID="txtDetails" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Details"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtProductImageURL" runat="server" TextMode="Url" CssClass="form-control" placeholder="Image"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <h3 class="text-center">First Stock In :</h3>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control" placeholder="Quantity"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="drpUnit" runat="server" CssClass="form-control" placeholder="Unit"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtProductRemark" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Remark(Bundle/Cartoon)"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnAdd" runat="server" class="btn btn-info pr-5 pl-5 text-right" Text="ADD" OnClick="btnAdd_Click" />
                    </div>
                </div>

                <div class="row grdView">
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                        CellPadding="1" ForeColor="Black" GridLines="Vertical" OnRowDeleting="dgv_RowDeleting">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="SL.">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("strName") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Name" SortExpression="proName">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("strName") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="250px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Details" SortExpression="det">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductDetails" runat="server" Text='<%# Bind("strDetails") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="400px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Stock In" SortExpression="qnt">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductQuantity" runat="server" Text='<%# Bind("intQuantity") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Unit" SortExpression="unit">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductUnit" runat="server" Text='<%# Bind("strUnit") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Remark" SortExpression="remark">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductRemark" runat="server" Text='<%# Bind("strRemark") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="150px" />
                            </asp:TemplateField>

                            <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="Red" ControlStyle-Font-Bold="true" />
                        </Columns>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>

                <div class="row">
                    <div class="col-md-5"></div>
                    <div class="col-md-4">
                        <asp:Button ID="btnCreateChallan" runat="server" class="btn btn-success pr-4 pl-4 text-right" Visible="false" Text="Add Products" OnClick="btnCreateChallan_Click" OnClientClick="return confirm('Are you want to add this product ?');"/>
                    </div>
                </div>

            </form>
        </div>
    </div>

</body>
</html>
