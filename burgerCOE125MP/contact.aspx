<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="burgerCOE125MP.contact" %>

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
                        <h2>Messages
                        </h2>
                    </header>
                </section>

            </div>

            <!-- Features 1 -->

            <!-- Features 2 -->
            <div class="wrapper">
                <section class="container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="email" HeaderText="E-Mail" SortExpression="email">
                                <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="feedback" HeaderText="Message" SortExpression="feedback">
                                <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                <ItemStyle Width="60%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date">
                                <HeaderStyle BackColor="#CC3300" ForeColor="White" HorizontalAlign="Left" />
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" Visible="False" />

                            <asp:CommandField ShowDeleteButton="true" />

                        </Columns>
                    </asp:GridView>
                </section>
            </div>

            <!-- Footer -->


        </div>

        <!-- Scripts -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:burgerDatabaseConnectionString %>" SelectCommand="SelectContact" SelectCommandType="StoredProcedure" DeleteCommand="DeleteMessage" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
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
