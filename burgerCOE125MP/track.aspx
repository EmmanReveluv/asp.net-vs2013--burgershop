<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="track.aspx.cs" Inherits="burgerCOE125MP.track" %>

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
                    <h1 id="logo"><a href="index.aspx">EZ Burger</a></h1>

                    <!-- Nav -->
                    <nav id="nav">
                        <ul>
                            <li>
                                <a href="#">Choices</a>
                                <ul>
                                    <li><a href="premade.aspx">Pre-made</a></li>
                                    <li><a href="makeyourown.aspx">Make your own</a></li>
                                </ul>
                            </li>
                            <li><a href="tray.aspx">Tray</a></li>
                            <li class="break"><a href="track.aspx">Track</a></li>
                            <li><a href="login.aspx">
                                <asp:Label Text="Login" runat="server" ID="lblLogin"></asp:Label></a></li>
                        </ul>
                    </nav>

                </div>

                <!-- Hero -->
                <section id="hero" class="container">
                    <header>
                        <h2>Track your order<br />
                        </h2>
                    </header>
                </section>

            </div>

            <!-- Features 1 -->

            <!-- Features 2 -->
            <div class="wrapper">
                <section class="container">
                    <header class="major">
                        <asp:TextBox runat="server" ID="txtTrack" Width="100%" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" />
                        <br />
                        <asp:Button runat="server" ID="btnTrack" Text="Track" Width="40%" OnClick="btnTrack_Click" />
                    </header>
                    <br /><br />
                    <asp:Panel runat="server" ID="pnlTrack" Visible="false">
                        <div class="row">
                            <asp:ListView DataSourceID="SqlDataSource1" runat="server">
                                <ItemTemplate>
                                    <section class="4u 12u(narrower)">
                                        <p>
                                            <asp:Label runat="server" Text='<%# Eval("id", "Tracking ID: {0}") %>' Font-Bold="True"></asp:Label><br />
                                            <asp:Label runat="server" Text='<%# Eval("custname", "Name: {0}") %>'></asp:Label><br />
                                            <asp:Label runat="server" Text='<%# Eval("contactnum", "Contact #:{0}") %>'></asp:Label><br />
                                            <asp:Label runat="server" Text='<%# Eval("address", "Address: {0}") %>'></asp:Label><br />
                                            <asp:Label runat="server" Text='<%# Eval("status", "Status: {0}") %>' Font-Bold="True"></asp:Label><br />
                                        </p>
                                    </section>
                                    <section class="8u 12u(narrower)">
                                        <p>
                                            <asp:Label runat="server" Text='<%# Eval("orderlist", "Order: <br /> {0}") %>' Font-Bold="True"></asp:Label>
                                        </p>
                                    </section>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>

                    </asp:Panel>
                </section>
            </div>

            <!-- Footer -->
            

        </div>

        <!-- Scripts -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:burgerDatabaseConnectionString %>" SelectCommand="SelectDelivery" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </SelectParameters>
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
