<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventory.aspx.cs" Inherits="burgerCOE125MP.inventory" %>

<!DOCTYPE HTML>
<!--
	Telephasic by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>EZ BURGER</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="assets/css/main.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<body class="homepage">
    <form runat="server">
        <div id="page-wrapper">

            <!-- Header -->
            <div id="header-wrapper">
                <div id="header" class="container">

                    <!-- Logo -->
                    <%--<h1 id="logo"><a href="index.aspx">EZ Burger</a></h1>--%>

                    <!-- Nav -->
                    <nav id="nav">
                        <ul>
                            <li><a href="inventory.aspx">Inventory</a></li>
                            <li><a href="contact.aspx">Messages</a></li>
                            <li><a href="manageorders.aspx">Orders</a></li>
                            <li><a href="managediscounts.aspx">Discounts</a></li>
                            <li><a href="login.aspx">
                                <asp:Label Text="Login" runat="server" ID="lblLogin"></asp:Label></a></li>
                        </ul>
                    </nav>

                </div>

                <!-- Hero -->
                <section id="hero" class="container">
                    <header>
                        <h2>Inventory
                        </h2>
                    </header>
                </section>

            </div>

            <!-- Features 1 -->

            <!-- Features 2 -->
            <div class="wrapper">
                <section class="container">

                    <asp:Panel runat="server" ID="pnlInventory">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name">
                                    <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price">
                                    <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="imgurl" HeaderText="Image Url" SortExpression="imgurl">
                                    <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="isfeatured" HeaderText="Featured" SortExpression="isfeatured">
                                    <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity">
                                    <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:CommandField ShowEditButton="True" />

                                <asp:CommandField ShowDeleteButton="True" />

                            </Columns>
                        </asp:GridView>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnlAdd" Visible="false">
                        <div class="row">
                            <section class="12u 12u feature">
                                <h2>Add Item</h2>
                                <br />
                                <asp:Label runat="server" ID="lblError" Text="ERROR: Please fill up all boxes <br/>" Visible="false"></asp:Label><br />
                                <asp:TextBox runat="server" ID="txtName" placeholder="Name"></asp:TextBox>
                                <br />
                                <asp:TextBox runat="server" ID="txtPrice" placeholder="Price"></asp:TextBox><br />
                                <asp:TextBox runat="server" ID="txtImage" placeholder="Image Url"></asp:TextBox><br />
                                <asp:TextBox runat="server" ID="txtFeature" placeholder="Featured (0 - no, 1 - yes)"></asp:TextBox><br />
                                <asp:Button runat="server" ID="btnAdd" Text="Add Item" OnClick="btnAdd_Click" /><br />
                                <br />
                                <br />
                            </section>
                        </div>
                    </asp:Panel>
                    <div class="row">
                        <section>
                            <asp:LinkButton runat="server" ID="lnkSwitch" Text="Add Item" OnClick="lnkSwitch_Click"></asp:LinkButton><br />
                            <br />
                            <asp:LinkButton runat="server" ID="lnkViewCustom" Text="Toggle to hide or view custom burgers" OnClick="lnkViewCustom_Click"></asp:LinkButton>
                        </section>
                    </div>
                    <asp:Panel runat="server" ID="pnlCustomBurgs" Visible="false">
                        <div class="row">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                                        <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name">
                                        <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="buns" HeaderText="buns" SortExpression="buns">
                                        <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="cheese" HeaderText="cheese" SortExpression="cheese">
                                        <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="patty" HeaderText="patty" SortExpression="patty">
                                        <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="sides" HeaderText="sides" SortExpression="sides">
                                        <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundField>
                                    <asp:CommandField ShowDeleteButton="True" />

                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:burgerDatabaseConnectionString %>" DeleteCommand="DeleteCustom" DeleteCommandType="StoredProcedure" SelectCommand="SelectCustom" SelectCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                            </asp:SqlDataSource>

                        </div>
                    </asp:Panel>
                </section>
            </div>

            <!-- Footer -->


        </div>

        <!-- Scripts -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:burgerDatabaseConnectionString %>" SelectCommand="SelectBurgers" SelectCommandType="StoredProcedure" UpdateCommand="UpdateBurger" UpdateCommandType="StoredProcedure" DeleteCommand="DeleteBurger" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="imgurl" Type="String" />
                <asp:Parameter Name="isfeatured" Type="Int32" />
                <asp:Parameter Name="quantity" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.dropotron.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>
    </form>
</body>
</html>
