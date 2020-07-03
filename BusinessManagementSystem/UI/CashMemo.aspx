<%@ Page Title="" MasterPageFile="~/MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="CashMemo.aspx.cs" Inherits="BusinessManagementSystem.UI.CashMemo" %>

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
        .textAlignCenter{
            text-align:center;
        }
        .textSize{
            font-size:25px;
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
                        <h3 class="text-center text-primary">Cash Memo</h3>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-9">
                        <div class="form-group">
                            <label>Receipt No:</label>
                            <asp:TextBox ID="txtReceiptNo" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Date:</label>
                            <asp:TextBox ID="txtCashMemoDate" runat="server" TextMode="Date">****</asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:DropDownList ID="drpPartyName" runat="server" CssClass="form-control" AutoPostBack = "true" OnSelectedIndexChanged="drpDetails_SelectedIndexChanged"></asp:DropDownList>
                        <asp:TextBox ID="txtPartyAddress" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Address"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="form-text">Payment By</label>
                            <asp:DropDownList ID="drpPayType" runat="server" TextMode="SingleLine" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="drpPayType_SelectedIndexChanged">
                                <asp:ListItem>Cash</asp:ListItem>
                                <asp:ListItem>Check</asp:ListItem>
                                <asp:ListItem>Order</asp:ListItem>
                                <asp:ListItem>D.D.</asp:ListItem>
                                <asp:ListItem>T.T.</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div id="divCheckNo" runat="server" class="form-group" visible="false">
                            <label  ID="lblCheckNo" runat="server" class="form-text">Check No</label>
                            <asp:TextBox ID="txtCheckNo" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div id="divCheckDate" runat="server" class="form-group" visible="false">
                            <label class="form-text">Date</label>
                            <asp:TextBox ID="txtCheckDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <asp:DropDownList ID="drpBill" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Item Name" AutoPostBack="true" OnSelectedIndexChanged="drpBill_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="text-info textSize">Bill Due : </label>
                        <asp:Label  ID="lblDueBalance" runat="server" CssClass="text-success textSize">00</asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <asp:TextBox ID="txtPaidAmount" runat="server" TextMode="Number" CssClass="form-control" placeholder="Paid Amount"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtTAX" runat="server" TextMode="Number" CssClass="form-control" placeholder="TAX"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="drpDiscount" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Discount">
                            <asp:ListItem>Rest is Due</asp:ListItem>
                            <asp:ListItem>Rest is Discount</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="btnAdd" runat="server" class="btn btn-info pr-5 pl-5 text-right" Text="ADD" OnClick="btnAdd_Click" />
                    </div>
                </div>

                <div class="row grdView">
                    <asp:GridView ID="dgv" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                        CellPadding="1" ForeColor="Black" GridLines="Vertical" OnRowDeleting="dgv_RowDeleting">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="SL." HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("intBillId") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Bill No" SortExpression="bill" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblBill" runat="server" Text='<%# Bind("intBillId") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Bill Value" SortExpression="billV" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblBillValue" runat="server" Text='<%# Bind("monTotal") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Paid" SortExpression="paid" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblPaid" runat="server" Text='<%# Bind("monPaid") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="TAX" SortExpression="tax" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblTAX" runat="server" Text='<%# Bind("monTAX") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Discount" SortExpression="dsc" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblDiscount" runat="server" Text='<%# Bind("monDiscount") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Due" SortExpression="due" HeaderStyle-CssClass="textAlignCenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblDue" runat="server" Text='<%# Bind("monDue") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="150px" />
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
                        <asp:Button ID="btnCreateCashMemo" runat="server" class="btn btn-success pr-4 pl-4 text-right" Visible="false" Text="Create Cash Memo" OnClick="btnCreateChallan_Click" OnClientClick="return confirm('Are you want to Create this Cash Memo');"/>
                    </div>
                </div>

            </form>
        </div>
    </div>
</asp:Content>
