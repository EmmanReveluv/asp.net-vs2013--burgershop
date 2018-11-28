<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="managediscounts.aspx.cs" Inherits="burgerCOE125MP.managediscounts" %>

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
                        <h2>Manage Discounts
                        </h2>
                    </header>
                </section>

            </div>

            <!-- Features 1 -->

            <!-- Features 2 -->
            <div class="wrapper">
                <section class="container">

                    <asp:Panel runat="server" ID="pnlInventory">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="code" DataSourceID="SqlDataSource1">
                            <Columns>
                                
                                <asp:BoundField DataField="code" HeaderText="Discount Code" SortExpression="name">
                                    <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="percentage" HeaderText="Percent off" SortExpression="price">
                                    <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                </asp:BoundField>
                                
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
                                <asp:TextBox runat="server" ID="txtCode" placeholder="Discount Code"></asp:TextBox>
                                <br />
                                <asp:TextBox runat="server" ID="txtPercent" placeholder="Percent off (0-99)"></asp:TextBox><br />
                                <asp:Button runat="server" ID="btnAdd" Text="Add Item" OnClick="btnAdd_Click" /><br />
                                <br />
                                <br />
                            </section>
                        </div>
                    </asp:Panel>
                    <div class="row">
                        <section class="feature">
                            <asp:LinkButton runat="server" ID="lnkSwitch" Text="Add Item" OnClick="lnkSwitch_Click"></asp:LinkButton>
                        </section>
                    </div>
                </section>
            </div>

            <!-- Footer -->


        </div>

        <!-- Scripts -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:burgerDatabaseConnectionString %>" SelectCommand="SelectDiscounts" SelectCommandType="StoredProcedure" DeleteCommand="DeleteDiscounts" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="code" Type="String" />
            </DeleteParameters>
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
