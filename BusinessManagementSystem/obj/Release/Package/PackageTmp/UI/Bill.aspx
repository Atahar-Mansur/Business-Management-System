<%@ Page Title="" MasterPageFile="~/MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="BusinessManagementSystem.UI.Bill" %>

<asp:Content ID="homeHead" ContentPlaceHolderID="head" runat="server">
    <style>
        .formCard{
            padding:20px;
            padding-top:300px;
        }
        .formMargin{
            margin-top:40px;
        }
        .backgroundPAD{
            background-image:url("/ContentImages/PadBill.jpg");
            height:1555px; 
            width:1100px;
        }
        .grdView{
            padding:20px;
        }
        .textSize{
            font-size:30px;
        }
        .textAlignCenter{
            text-align:center;
        }
        .textBoxAlign{
            text-align:right;
            width:100px;
        }
    </style>
</asp:Content>

<asp:Content ID="homeBody" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="card formCard backgroundPAD">
            <form id="frmChallanIn" runat="server">
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
                            <asp:TextBox ID="txtBillDate" runat="server" TextMode="Date">****</asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <asp:TextBox ID="txtBOE" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Bill of Exchange No."></asp:TextBox>
                    </div>
                </div>
                <div class="row"><br /></div>
                <div class="row">
                    <div class="col-md-1">
                        <label class="text-dark">Name:</label>
                    </div>
                    <div class="col-md-11">
                        <asp:DropDownList ID="drpChallanInName" runat="server" CssClass="form-control" AutoPostBack = "true" OnSelectedIndexChanged="drpDetails_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <label class="text-dark">Address:</label>
                    </div>
                    <div class="col-md-11">
                        <asp:TextBox ID="txtChallanInAddress" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label class="text-dark">Add Challan:</label>
                    </div>
                    <div class="col-md-9">
                        <asp:DropDownList ID="drpChallanNo" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:Button ID="btnAdd" runat="server" class="btn btn-info" Text="ADD" OnClick="btnAdd_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                    <asp:Label ID="hdnChallanNo" runat="server" Text="" Visible="false"></asp:Label>
                </div>

                <div class="row grdView">
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                        CellPadding="1" ForeColor="Black" GridLines="Vertical" OnRowCommand="dgv_RowCommand">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="SL." HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("strDetails") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Challan No" SortExpression="chlnNo" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblChallanNo" runat="server" Text='<%# Bind("intChallanId") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Name and Details" SortExpression="dtls">
                                <ItemTemplate>
                                    <asp:Label ID="lblDetails" runat="server" Text='<%# Bind("strDetails") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="600px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity" SortExpression="qnt" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("intQuantity") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="100px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Unit Price" SortExpression="unitPrc" HeaderStyle-CssClass="textAlignCenter">
                                 <EditItemTemplate>
                                    <asp:TextBox ID="txtUnitPrice" runat="server" Text='<%# Bind("monPrice") %>' TextMode="Number" CssClass="textBoxAlign"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Bind("monPrice") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="100px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Price" SortExpression="price" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("monTotalPrice") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="100px" />
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblEdit" CommandArgument='<%# Eval("strDetails") %>' CommandName="EditRow" ForeColor="Blue" runat="server" Font-Bold="true">  Edit</asp:LinkButton>
                                    <asp:LinkButton ID="lblDelete" CommandArgument='<%# Eval("strDetails") %>' CommandName="DeleteRow" ForeColor="Red" runat="server" CausesValidation="false" Font-Bold="true">Remove</asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lblUpdate" CommandArgument='<%# Eval("strDetails") %>' CommandName="UpdateRow" ForeColor="Green" runat="server" Font-Bold="true">Update</asp:LinkButton>
                                    <asp:LinkButton ID="lblCancel" CommandArgument='<%# Eval("strDetails") %>' CommandName="CancelUpdate" ForeColor="Red" runat="server" CausesValidation="false" Font-Bold="true">Cancel</asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>

                <div class="row" id="divTotal" runat="server" visible="false">
                    <div class="col-md-7"></div>
                    <div class="col-md-2">
                        <h5 class="font-weight-bold text-info">Total :</h5>
                    </div>
                    <div class="col-md-1">
                        <h4 id="lblTotal" runat="server" class="font-weight-bold text-dark float-right">00</h4>
                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="drpCurrency" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <asp:TextBox ID="txtRemark" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Remark"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5"></div>
                    <div class="col-md-2">
                        <asp:Button ID="btnCreateChallan" runat="server" class="btn btn-success pr-5 pl-5 text-right" Visible="false" Text="Create Bill" OnClick="btnCreateChallan_Click" OnClientClick="return confirm('Are you want to create this Bill');"/>
                    </div>
                </div>

            </form>
        </div>
    </div>
</asp:Content>
