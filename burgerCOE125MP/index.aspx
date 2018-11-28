<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="burgerCOE125MP.index" ValidateRequest="false" %>

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
                        <h2>EZ BURGER<br />
                        </h2>
                    </header>
                    <p>
                        Browse our featured burgers or <strong>make your own!</strong>
                    </p>

                </section>

            </div>

            <!-- Features 1 -->

            <!-- Features 2 -->
            <div class="wrapper">
                <section class="container">
                    <header class="major">
                        <asp:TextBox runat="server" ID="txtSearch" Width="100%" />
                        <br />
                        <asp:Button runat="server" ID="btnSearch" Text="Search" Width="40%" OnClick="btnSearch_Click1" />
                        <br />
                        <br />
                        <h2>Featured</h2>
                    </header>
                    <div class="row features">
                        <asp:ListView DataSourceID="SqlDataSource1" runat="server">
                            <ItemTemplate>
                                <section class="4u 12u(narrower) feature">
                                    <div class="image-wrapper">
                                        <a href="#" class="image featured">
                                            <asp:ImageButton runat="server" ImageUrl='<%# Eval("imgurl") %>' Height="250" /></a>
                                    </div>
                                    <p>
                                        <asp:Label runat="server" Text='<%# Eval("name") %>' Font-Bold="True"></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Text='<%# Eval("price", "₱ {0}") %>'></asp:Label><br />
                                        <asp:HyperLink runat="server" Text="Add to tray" NavigateUrl='<%# Eval("id", "~/tray.aspx?premade=1&id={0}") %>'></asp:HyperLink>
                                    </p>
                                </section>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
                </section>
            </div>

            <!-- Footer -->
            <div id="footer-wrapper">
                <div id="footer" class="container">
                    <header class="major">
                        <h2>EZ Organization - About Us</h2>
                    </header>
                    
                    <div class="row features">
                        <section class="4u 12u(narrower) feature">
                            <h2>Our goal is to..</h2>
                            <p>
                               - Become the best online food chain<br />
                               - Become the fastest online delivery chain<br />
                               - Deliver the best burger eating experience to customers<br />
                            </p>
                        </section>
                        <section class="4u 12u(narrower) feature">
                            <h2>Core Values</h2>
                            <p>
                               1. DISCIPLINE.<br />
                               2. EXCELLENCE.<br />
                               3. COMMITMENT.<br />
                               4. INTEGRITY.<br />
                               5. RELEVANCE.<br />
                            </p>
                        </section>
                        <section class="4u 12u(narrower) feature">
                            <h2>Accomplishments</h2>
                            <p>
                               - Voted #1 on asdf Survey 2016<br />
                               - asdf Award for best delivery service<br />
                               - qwer Award for most unique food chain<br />
                               - Awarded "Most Good-Looking Web Developers"<br />
                            </p>
                        </section>
                    </div>
                    <div class="row">
                        <section class="6u 12u(narrower) feature">
                            <h3>COE125 Machine Problem</h3>
                            <p>
                                <i>Group Members</i><br />
                                Calimag, Alyanna Denise R.<br />
                                Catli, Ariel D.<br />
                                De Leon, Renz Jerome E.
                            </p>
                        </section>
                        <section class="6u 12u(narrower) feature">
                            <h3>Website Main Features:
                            </h3>
                            <p>
                                1 - Select various burgers made by us<br />
                                2 - Make your own burger<br />
                                3 - Cash on delivery<br />
                                4 - Order tracking<br />
                            </p>
                        </section>                        
                    </div>
                    <div class="row">
                        <section class="12u 12u(center) feature">
                            <i>
                                Sources:
                                HTML5 Template w/ jquery: https://html5up.net/telephasic <br />
                                core values source: http://www.mapua.edu.ph/About/Vision-Mission.aspx <br />
                                burger source: http://www.bk.com/menu/burgers <br />
                                custom burger: https://www.dennys.com/food/burgers-sandwiches/build-your-own-burger/  <br />
                            </i>
                        </section>
                    </div>
                    <div class="row">
                        <section class="12u 12u(center)">
                            <a name="#message">
                                <h2>Contact Us</h2>
                            </a>
                            <br />
                            <asp:TextBox runat="server" placeholder="E-Mail Address" ID="txtContactEmail"></asp:TextBox><br />

                            <asp:TextBox runat="server" ID="txtMessage" TextMode="MultiLine" placeholder="Feedback/Concern" Style="resize: none;">
                            </asp:TextBox><br />
                            <asp:Button runat="server" Text="Send" Width="30%" ID="btnContact" OnClick="btnContact_Click" /><br />
                            <br />
                            <asp:Label runat="server" Text="Message Sent!" ID="lblMessage" Visible="false"></asp:Label>
                        </section>
                    </div>

                </div>
                <div id="copyright" class="container">
                    <ul class="menu">
                        <li>&copy; Untitled. All rights reserved.</li>
                        <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                    </ul>
                </div>
            </div>

        </div>

        <!-- Scripts -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:burgerDatabaseConnectionString %>" SelectCommand="SelectFeatured" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.dropotron.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>
    </form>
</body>
</html>
