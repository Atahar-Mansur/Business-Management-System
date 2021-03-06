﻿<%@ Page Title="Bill" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PrintBill.aspx.cs" Inherits="BusinessManagementSystem.UI.PrintBill" %>

<asp:Content ID="printChallanHead" ContentPlaceHolderID="head" runat="server">
    <style id="style" runat="server">
        .formCard{
            padding:20px;
        }
        .containerCard{
            padding:20px;
            padding-top:300px;
        }
        .formMargin{
            margin-top:40px;
        }
        .backgroundPAD{
            background-image:url("/ContentImages/PadBillWithSignature.jpg");
            height:1557px; 
            width:1110px;
        }
        .grdSize{
            height:780px;
            width:1065px;
        }
        .textAlignCenter{
            text-align:center;
        }
        .grdView{
            padding:20px;
        }
    </style>

    <script>
        function printPage() {
            var getpanel = document.getElementById("<%= panelPDF.ClientID%>");
            var getstyle = document.getElementById("<%= style.ClientID%>");
            var getbootstrap = document.getElementById("<%= bootstrap.ClientID%>");
            var getBillNo = document.getElementById("<%= lblBillNo.ClientID%>");

            var MainWindow = window.open('', '', 'height=500,width=750');
            MainWindow.document.write('<html><head><title>Bill_');
            MainWindow.document.write(getBillNo.innerHTML);
            MainWindow.document.write('</title>');
            MainWindow.document.write(getbootstrap.innerHTML);
            MainWindow.document.write('<style>');
            MainWindow.document.write(getstyle.innerHTML);
            MainWindow.document.write('</style></head><body>');
            MainWindow.document.write(getpanel.innerHTML);
            MainWindow.document.write('</body></html>');
            MainWindow.document.close();
            setTimeout(function () {
                MainWindow.print();
                MainWindow.close();
            }, 500);
            return false;
        }
    </script>

</asp:Content>
<asp:Content ID="printChallanBody" ContentPlaceHolderID="body" runat="server">
<form id="frmPrintChallan" runat="server">
    <div class="container" id="inputContainer" runat="server">
        <div class="card formCard">
            <div class="row">
                <div class="col-md-12"><br /></div>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <h3 class="text-center text-primary">Bill Print or Remove</h3>
                </div>
                <div class="col-md-4"></div>
            </div>
            <div class="row">
                <div class="col-md-12"><br /></div>
            </div>
            <div class="row" id="infoDiv" runat="server">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="text-success">Party Name</label>
                        <asp:DropDownList ID="drpPartyName" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-success">Bill No</label>
                        <asp:TextBox ID="txtBillNo" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-success">Bill of Exchange No</label>
                        <asp:TextBox ID="txtBOENo" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-2">
                    <asp:Button ID="btnShow" runat="server" class="btn btn-info pr-5 pl-5 text-right" Text="Search" OnClick="btnShow_Click"/>
                </div>
            </div>

            <div class="row grdView">
                <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                    CellPadding="1" ForeColor="Black" GridLines="Vertical" OnRowDeleting="dgv_RowDeleting" Visible="true">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL.">
                            <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("intBillId") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Bill No" SortExpression="billNo">
                            <ItemTemplate>
                                <asp:Label ID="lblBillNo" runat="server" Text='<%# Bind("intBillId") %>'></asp:Label></ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="125px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Party Name" SortExpression="prtN">
                            <ItemTemplate>
                                <asp:Label ID="lblPartyName" runat="server" Text='<%# Bind("strPartyName") %>'></asp:Label></ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="475px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date" SortExpression="date">
                            <ItemTemplate>
                                <asp:Label ID="lblDate" runat="server" Text='<%# Bind("dteBillDate") %>'></asp:Label></ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Bill of Exchange No" SortExpression="BoENo">
                            <ItemTemplate>
                                <asp:Label ID="lblBoENo" runat="server" Text='<%# Bind("strBOE") %>'></asp:Label></ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="300px" />
                        </asp:TemplateField>

                        <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="Green" ControlStyle-Font-Bold="true" DeleteText="Show"/>
                    </Columns>
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            
            <div class="row">
                <div class="col-md-10"></div>
                <div class="col-md-1">
                    <asp:Button ID="btnPrint" runat="server" class="btn btn-success pr-4 pl-4 text-right" Text="Print" Visible="false" OnClientClick="return printPage();"/>
                </div>
                <div class="col-md-1">
                    <asp:Button ID="btnDelete" runat="server" class="btn btn-danger pr-3 pl-3 text-right" Text="Delete" OnClick="btnDelete_Click" Visible="false"/>
                </div>
            </div>
            <div class="row"><br /></div>
            <div class="row">
                <div class="col-md-10">
                    <asp:TextBox ID="txtDeleteReason" runat="server" CssClass="form-control" placeholder="Reason" Visible="false"></asp:TextBox>
                </div>
                <div class="col-md-2">
                     <asp:Button ID="btnConfirm" runat="server" class="btn btn-danger pr-3 pl-3 text-right" Text="Confirm Delete" Visible="false" OnClick="btnConfirm_Click" OnClientClick="return confirm('Are you sure to delete this bill ?');"/>
                </div>
            </div>
        </div>
    </div>

    <asp:Panel ID="panelPDF" runat="server" CssClass="container">
        <div id="containerPrint" runat="server" visible="false">
            <div class="card containerCard backgroundPAD">

                <div class="row">
                    <div class="col-md-9">
                        <div class="form-group">
                            <label>Bill No:</label>
                            <asp:Label ID="lblBillNo" runat="server" CssClass="btn btn-light"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Date:</label>
                            <asp:label ID="lblBillDate" runat="server" CssClass="text-dark"></asp:label>
                        </div>
                    </div>
                </div>
                <div class="row"><br></div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Bill of Exchange No:</label>
                            <asp:label ID="lblBOENo" runat="server" CssClass="text-dark"></asp:label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <label class="text-dark">Name:</label>
                    </div>
                    <div class="col-md-11">
                        <asp:label ID="lblPartyName" runat="server" CssClass="text-dark"></asp:label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <label class="text-dark">Address:</label>
                    </div>
                    <div class="col-md-11">
                        <asp:label ID="lblPartyAddress" runat="server" CssClass="text-dark"></asp:label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>

                <div>
                    <div class="card formCard grdSize">
                        <div class="row grdView">
                            <asp:GridView ID="dgv2" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                CellPadding="1" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SL.">
                                        <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("strDetails") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Challan No" SortExpression="chlnNo" HeaderStyle-CssClass="textAlignCenter">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChallanNo" runat="server" Text='<%# Bind("intChallanId") %>'></asp:Label></ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Product Name and Details" SortExpression="dtls">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDetails" runat="server" Text='<%# Bind("strDetails") %>'></asp:Label></ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="700px" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Quantity" SortExpression="qnt" HeaderStyle-CssClass="textAlignCenter">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("intQuantity") %>'></asp:Label></ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Unit Price" SortExpression="uPrice" HeaderStyle-CssClass="textAlignCenter">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Bind("monPrice") %>'></asp:Label></ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="120px" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price" SortExpression="Price" HeaderStyle-CssClass="textAlignCenter">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("monTotalPrice") %>'></asp:Label></ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                                    </asp:TemplateField>

                                </Columns>
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>

                        <div class="row" id="divTotal" runat="server">
                            <div class="col-md-8"></div>
                            <div class="col-md-1">
                                <h5 class="font-weight-bold text-info">Total :</h5>
                            </div>
                            <div class="col-md-2">
                                <h5 id="lblTotal" runat="server" class="font-weight-bold text-dark float-right">00</h5>
                            </div>
                            <div class="col-md-1">
                                <h5 id="lblCurrency" runat="server" class="font-weight-bold text-dark"></h5>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row"><br /></div>
                <div class="row">
                    <div class="col-md-2">
                        <h5 class="text-dark font-weight-bold">Price in Word:</h5>
                    </div>
                    <div class="col-md-10">
                        <h5 ID="lblPiW" runat="server" Class="text-dark font-weight-bold"></h5>
                    </div>
                </div>

                <div class="row"><br></div>
                <div class="row">
                    <div class="col-md-2">
                        <label class="text-dark">Our Challan(s) No:</label>
                    </div>
                    <div class="col-md-10">
                        <asp:label ID="lblChallans" runat="server" CssClass="text-dark"></asp:label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label class="text-dark">Challan(s) Date:</label>
                    </div>
                    <div class="col-md-10">
                        <asp:label ID="lblChallansDate" runat="server" CssClass="text-dark"></asp:label>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    
    <asp:Panel ID="bootstrap" runat="server">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </asp:Panel>
</form>
</asp:Content>
