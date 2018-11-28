<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="burgerCOE125MP.login" %>

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
                        <h2>Login/Register<br />
                        </h2>
                    </header>

                </section>

            </div>

            <!-- Features 1 -->

            <!-- Features 2 -->
            <div class="wrapper">

                <asp:Panel runat="server" ID="panLogin" >

                    <section class="container">
                        <h3>Login</h3><i><asp:Label runat="server" ID="lblLogError" Text="Invalid Email/Password <br />" Visible="False" ForeColor="#CC3300"></asp:Label></i>
                        <br />
                        <asp:TextBox runat="server" ID="txtEmailLog" placeholder="E-Mail" TextMode="Email"></asp:TextBox>
                        <br />
                        <asp:TextBox runat="server" ID="txtPass" placeholder="Password" TextMode="Password"></asp:TextBox><br />
                        <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" /><br />
                        <br />
                        <asp:LinkButton runat="server" ID="lnkReg" Text="No account? Register here." OnClick="lnkReg_Click"></asp:LinkButton>
                    </section>
                </asp:Panel>
                <asp:Panel runat="server" ID="panReg" Visible="false">
                    <section class="container">
                        <h3>Register&nbsp</h3><i><asp:Label runat="server" ID="lblRegError" Text="Please fill up the required fields <br />" Visible="False" ForeColor="#CC3300"></asp:Label></i>
                        <br />
                        <asp:TextBox runat="server" ID="txtEmailReg" placeholder="E-Mail Address*" TextMode="Email"></asp:TextBox>
                        <br />
                        <asp:TextBox runat="server" ID="txtPassReg" placeholder="Password*" TextMode="Password"></asp:TextBox>
                        <br />
                        <asp:TextBox runat="server" ID="txtPassRegConfirm" placeholder="Confirm Password*" TextMode="Password"></asp:TextBox>
                        <br />
                        <asp:TextBox runat="server" ID="txtNameReg" placeholder="Full Name*"></asp:TextBox>
                        <br />
                        <asp:TextBox runat="server" ID="txtAddress1" placeholder="Address Line 1*"></asp:TextBox>
                        <br />
                        <asp:TextBox runat="server" ID="txtAddress2" placeholder="Address Line 2"></asp:TextBox>
                        <br />
                        <asp:TextBox runat="server" ID="txtContact" placeholder="Contact Number*" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                        <br />
                        <asp:Button runat="server" ID="btnRegister" Text="Register" OnClick="btnRegister_Click" /><br /><br />
                        <asp:LinkButton runat="server" ID="lnkLogin" Text="Already have an account? Login here" OnClick="lnkLogin_Click"></asp:LinkButton><br />
                        <br />
                    </section>

                </asp:Panel>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:burgerDatabaseConnectionString %>" SelectCommand="SelectBurgers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>
