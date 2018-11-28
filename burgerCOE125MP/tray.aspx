<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tray.aspx.cs" Inherits="burgerCOE125MP.tray" %>

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
                        <h2>
                            <asp:Label runat="server" Text="Your tray" ID="lblTray"></asp:Label></h2>

                    </header>

                </section>

            </div>

            <!-- Features 1 -->

            <!-- Features 2 -->
            <div class="wrapper">
                <div class="container" id="main">
                  <asp:Label ID="lblLog" Text="You must be logged in to add or view your tray" runat="server"></asp:Label>

                    <asp:Panel runat="server" ID="pnlTray" Visible="false">
                        <div class="row 150%">
                            <div class="1u 12u(center)">
                            </div>
                            <div class="11u 12u(narrower)">
                                <!-- Content -->
                                <article id="content">
                                    <table style="width: 100%;">
                                        <tr>
                                            <th style="width: 70%; text-align: left">
                                                <h2>Burger</h2>
                                            </th>
                                            <th style="width: 30%; text-align: left">
                                                <h2>Price</h2>
                                            </th>
                                        </tr>

                                        <asp:Repeater runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="width: 70%; text-align: left">
                                                        <br />
                                                        <asp:HyperLink runat="server" Text="X" NavigateUrl='<%# Eval("id", "~/tray.aspx?remove={0}") %>' Font-Italic="True" ForeColor="#CC3300" Font-Size="Medium"></asp:HyperLink>
                                                        <asp:Label runat="server" Text='<%# Eval("burgName") %>' Visible="true" />
                                                    </td>
                                                    <td style="width: 30%; text-align: left">
                                                        <br />
                                                        <asp:Label runat="server" Text='<%# Eval("BurgPrice", "₱ {0}") %>' Visible="true" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                    <br />
                                    
                                    <asp:Label ID="lblDiscount" Text="Discount: " runat="server" Visible="False" ForeColor="#006600"></asp:Label><br />

                                    <br />
                                    <asp:Label ID="lblTotal" Text="Total Price: ₱ " runat="server" Visible="true"></asp:Label><br />

                                    <br />
                                    <asp:Button ID="btnDeliver" Text="Proceed to delivery" runat="server" Visible="true" OnClick="btnDeliver_Click" />
                                    <br />
                                </article>

                            </div>
                        </div>
                            <div class="row 150%">
                                <div class="1u 12u(center)">
                                </div>
                                <div class="7u 12u(narrower)">
                                    <asp:TextBox runat="server" id="txtDiscount"></asp:TextBox>
                                </div>
                                <div class="4u 12u(narrower)">
                                    <asp:Button runat="server" Text="Apply Discount Code" ID="btnDiscount" OnClick="btnDiscount_Click" />
                                </div>
                            </div>

                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlDelivery" Visible="false">

                        <div class="row 150%">
                            <div class="7u 12u(narrower)">
                                <!-- Content -->
                                <asp:TextBox runat="server" ID="txtName" placeholder="Name"></asp:TextBox><br />
                                <asp:TextBox runat="server" ID="txtAddress1" placeholder="Address Line 1"></asp:TextBox><br />
                                <asp:TextBox runat="server" ID="txtAddress2" placeholder="Address Line 2"></asp:TextBox><br />
                                <asp:TextBox runat="server" ID="txtContact" placeholder="Contact Number" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox><br />
                                <asp:Button runat="server" ID="btnProceed" Text="Procced with order" OnClick="btnProceed_Click" /><br />
                                <br />
                                <asp:LinkButton runat="server" ID="lnkBack" Text="Back to tray" OnClick="lnkBack_Click"></asp:LinkButton>
                            </div>
                            <div class="5u 12u(center)">
                                <h2>Order Summary</h2>
                                <asp:Label runat="server" ID="lblSummary"></asp:Label>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlComplete" Visible="false">
                        <div class="row 150%">
                            <div class="12u 12u(narrower)">
                                <h2>Order complete!</h2>
                                <br />
                                <asp:Label runat="server" ID="lblTrackingNum"></asp:Label>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>


            <!-- Footer -->


        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:burgerDatabaseConnectionString %>" SelectCommand="SelectUserCart" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
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
