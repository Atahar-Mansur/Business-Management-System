<%@ Page Title="" MasterPageFile="~/MasterPage.Master" Language="C#" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="BusinessManagementSystem.UI.Client" %>


<asp:Content ID="clientHead" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>

<asp:Content ID="clientBody" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="card formCard">
            <form id="frmChallanIn" runat="server">
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h3 class="text-center text-primary">New Client Information</h3>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Client Name"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Phone" CssClass="form-control" placeholder="Mobile No."></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><br /></div>
                </div>
                <div class="row">
                    <div class="col-md-7">
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Address"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10"><br /></div>
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

                            <asp:TemplateField HeaderText="Client Name" SortExpression="clntName">
                                <ItemTemplate>
                                    <asp:Label ID="lblClientName" runat="server" Text='<%# Bind("strName") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="400px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email" SortExpression="email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("strEmail") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="300px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Mobile No" SortExpression="mblNo">
                                <ItemTemplate>
                                    <asp:Label ID="lblMobileNo" runat="server" Text='<%# Bind("strMobileNo") %>'></asp:Label></ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="300px" />
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
                        <asp:Button ID="btnCreateChallan" runat="server" class="btn btn-success pr-4 pl-4 text-right" Visible="false" Text="Enter Client" OnClick="btnCreateChallan_Click" OnClientClick="return confirm('Are you want to enter these Clients ?');"/>
                    </div>
                </div>

            </form>
        </div>
    </div>
</asp:Content>
