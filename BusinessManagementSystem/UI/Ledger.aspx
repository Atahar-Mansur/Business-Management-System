<%@ Page Title="" MasterPageFile="~/MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="Ledger.aspx.cs" Inherits="BusinessManagementSystem.UI.Ledger" %>


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
            <form id="frmStockRegister" runat="server">
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h3 class="text-center text-primary">Ledger Report</h3>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label class="text-success">Party Name</label>
                            <asp:DropDownList ID="drpPartyName" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="text-success">Report</label>
                            <asp:DropDownList ID="drpReport" runat="server" CssClass="form-control">
                                <asp:ListItem>Current Status</asp:ListItem>
                                <asp:ListItem>Bill</asp:ListItem>
                                <asp:ListItem>Cash Memo</asp:ListItem>
                                <asp:ListItem>Compare Bill and Cash Memo</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-2">
                        <br />
                        <asp:Button ID="btnShow" runat="server" class="btn btn-info pr-4 pl-4 text-right" Text="Show Report" OnClick="btnShow_Click"/>
                    </div>
                </div>

                <div id="divCurrentStatus" runat="server" visible="false">

                    <div class="row"><br /><br /></div>

                    <div class="row">
                        <div class="col-md-2"><h5 class="txt-dark font-weight-bold">Current Status</h5></div>
                        <div class="col-md-1"><h5 class="txt-dark font-weight-bold">:</h5></div>
                        <div class="col-md-9"><h5 id="txtCurrentStatus" runat="server" class="txt-secondery"></h5></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h5 class="txt-dark font-weight-bold">Due Balance</h5></div>
                        <div class="col-md-1"><h5 class="txt-dark font-weight-bold">:</h5></div>
                        <div class="col-md-9"><h5 id="txtDueBalance" runat="server" class="txt-secondery"></h5></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h5 class="txt-dark font-weight-bold">Due Bill's ID</h5></div>
                        <div class="col-md-1"><h5 class="txt-dark font-weight-bold">:</h5></div>
                        <div class="col-md-9"><h5 id="txtDueBills" runat="server" class="txt-secondery"></h5></div>
                    </div>

                </div>

                <div id="divBill" runat="server" visible="false">

                    <div class="row"><br /><br /></div>
                    <div class="row">
                        <div class="col-md-10">
                            <h4 id="headerBill" runat="server" class="text-info">Report</h4>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnBill" runat="server" class="btn btn-success pr-4 pl-4 text-right" Text="View More" OnClick="btnBill_Click"/>
                        </div>
                    </div>

                    <div class="row grdView">
                        <asp:GridView ID="dgvBill" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                            CellPadding="1" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="SL." HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("dteDateFor") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date" SortExpression="date" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("dteDateFor") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="200px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Bill ID" SortExpression="bill" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBillID" runat="server" Text='<%# Bind("intBillId") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Bill Amount" SortExpression="total" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotal" runat="server" Text='<%# Bind("monTotal") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="150px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Currency" SortExpression="carn" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCurrency" runat="server" Text='<%# Bind("strCurrency") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Status" SortExpression="sts" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("strStatus") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="200px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Due Amount" SortExpression="due" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDue" runat="server" Text='<%# Bind("monDue") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="150px" />
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>

                </div>

                <div id="divCashMemo" runat="server" visible="false">

                    <div class="row"><br /><br /></div>
                    <div class="row">
                        <div class="col-md-10">
                            <h4 id="headerCashMemo" runat="server" class="text-info">Report</h4>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnCashMemo" runat="server" class="btn btn-success pr-4 pl-4 text-right" Text="View More" OnClick="btnCashMemo_Click"/>
                        </div>
                    </div>

                    <div class="row grdView">
                        <asp:GridView ID="dgvCashMemo" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                            CellPadding="1" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="SL." HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("dteLedgerDateFor") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date" SortExpression="date" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("dteLedgerDateFor") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="200px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Cash Memo Id" SortExpression="cashM" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCashMemoId" runat="server" Text='<%# Bind("intCashMemoId") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Paid Amount" SortExpression="paid" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPaid" runat="server" Text='<%# Bind("monPaid") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="150px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Tax Amount" SortExpression="tax" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaxAmount" runat="server" Text='<%# Bind("monVat") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="150px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Discount" SortExpression="dsnt" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDiscount" runat="server" Text='<%# Bind("monDiscount") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="150px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total Amount" SortExpression="total" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("monTotal") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="150px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Cheque No" SortExpression="cNo" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblChequeNo" runat="server" Text='<%# Bind("strChequeNo") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="200px" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>

                </div>

                <div id="divLedger" runat="server" visible="false">

                    <div class="row"><br /><br /></div>
                    <div class="row">
                        <div class="col-md-10">
                            <h4 id="headerLedger" runat="server" class="text-info">Report</h4>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnLedger" runat="server" class="btn btn-success pr-4 pl-4 text-right" Text="View More" OnClick="btnLedger_Click"/>
                        </div>
                    </div>

                    <div class="row grdView">
                        <asp:GridView ID="dgvLedger" runat="server" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                            CellPadding="1" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="SL." HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %><asp:HiddenField ID="hdnitmid" runat="server" Value='<%# Bind("dteLedgerDateFor") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date" SortExpression="date" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("dteLedgerDateFor") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="250px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Bill Id" SortExpression="bill" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBillId" runat="server" Text='<%# Bind("intBillId") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="200px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Debit" SortExpression="dbt" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDebit" runat="server" Text='<%# Bind("Debit") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="200px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Cash Memo Id" SortExpression="cashM" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCashMemoId" runat="server" Text='<%# Bind("intCashMemoId") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="200px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Credit" SortExpression="qntS" HeaderStyle-CssClass="textAlignCenter">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCredit" runat="server" Text='<%# Bind("Credit") %>'></asp:Label></ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="200px" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>

                </div>

            </form>
        </div>
    </div>
</asp:Content>
