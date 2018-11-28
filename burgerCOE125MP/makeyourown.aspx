<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="makeyourown.aspx.cs" Inherits="burgerCOE125MP.makeyourown" ValidateRequest="false" %>

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
                        <h2>MAKE YOUR OWN BURGER!<br />
                        </h2>

                        <h8><i>
                        query source: https://www.dennys.com/food/burgers-sandwiches/build-your-own-burger/ <br />

                        </i>
                    </h8>

                    </header>
                </section>

            </div>

            <!-- Features 1 -->

            <!-- Features 2 -->
            <div class="wrapper">
                <section class="container">
                    <h2>Name your burger</h2>
                    <br />
                    <header class="major">
                        <asp:TextBox runat="server" ID="txtBurgerName"></asp:TextBox><br />
                        <br />

                    </header>
                    <div class="row">
                        <section class="6u 12u(narrower)">
                            <h2><i>Buns</i></h2>
                            <br />
                            <asp:DropDownList ID="ddlBuns" runat="server">
                                <asp:ListItem>Brioche Bun</asp:ListItem>
                                <asp:ListItem>Cheddar Bun</asp:ListItem>
                                <asp:ListItem>Whole Wheat Bun</asp:ListItem>
                            </asp:DropDownList><br />
                            <br />
                            <h2><i>Cheese</i></h2>
                            <br />
                            <asp:DropDownList ID="ddlCheese" runat="server">
                                <asp:ListItem>American Cheese</asp:ListItem>
                                <asp:ListItem>Cheddar Cheese</asp:ListItem>
                                <asp:ListItem>Swiss Cheese</asp:ListItem>
                            </asp:DropDownList><br />
                            <br />
                            <h2><i>Patty</i></h2>
                            <br />
                            <asp:DropDownList ID="ddlPatty" runat="server">
                                <asp:ListItem>100% Beef Patty</asp:ListItem>
                                <asp:ListItem>Grilled Seasoned Chicken Breast</asp:ListItem>
                                <asp:ListItem>Veggie Patty</asp:ListItem>
                            </asp:DropDownList><br />
                            <br />
                            <h2><i>Sides</i></h2>
                            <br />
                            <asp:DropDownList ID="ddlSides" runat="server">
                                <asp:ListItem>Bacon Cheddar Tots </asp:ListItem>
                                <asp:ListItem>Dippable Veggies w/ ranch dressing</asp:ListItem>
                                <asp:ListItem>French Fries</asp:ListItem>
                                <asp:ListItem>Hash Browns</asp:ListItem>
                                <asp:ListItem>Seasonal Fruit</asp:ListItem>
                                <asp:ListItem>Seasoned Fries</asp:ListItem>
                            </asp:DropDownList><br />
                            <br />

                            <asp:Label ID="lblLog" runat="server" Text="Login to add to tray" visible="true"/>
                            <asp:Button visible="false" runat="server" Text="Add to tray" ID="btnAddCustom" OnClick="btnAddCustom_Click" />
                            <br />
                            <br />
                            <i>*custom burgers have a fixed price of 220 PHP</i>
                        </section>

                        <section class="6u 12u(narrower) pull-right">
                            <img src="images/buns.jpg" height="200" />
                            <img src="images/cheese.jpg" height="200" />
                            <img src="images/patty.jpg" width="260" />
                            <img src="images/sides.jpg" width="300" />
                            <img src="images/burg.jpg" width="550" />
                        </section>

                    </div>






                </section>
            </div>

            <!-- Footer -->


        </div>

        <!-- Scripts -->

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.dropotron.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>
    </form>
</body>
</html>
