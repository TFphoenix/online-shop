<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetailsPage.aspx.vb" Inherits="MagazinOnline.DetailsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Magazin Online - Detalii Produs</title>

    <%-- CSS --%>
    <link rel="stylesheet" href="../External/bootstrap/dist/css/bootstrap.min.css" />
    <style>
        .content {
            margin-top: 40px;
        }

        .name-section {
            text-align: left;
            font-size: 1.75rem;
        }

        .price-section {
            text-align: right;
            font-size: 1.75rem;
        }

        .bordered-section {
            border: 1px solid gray;
            border-radius: 3px;
            padding: 10px;
        }

        .row {
            margin: 20px 0;
        }

        .description {
            word-wrap: break-word;
            overflow: hidden;
            resize: none;
            min-height: 75px;
        }

            .description:focus {
                outline: none;
            }

        .subtitle {
            font-weight: bold;
        }

        .invisible {
            display: none;
        }
    </style>
</head>
<body>
    <%-- Navbar --%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="./HomePage.aspx">
            <img src="../Resources/logo.svg" width="50" height="50" class="d-inline-block align-top" alt="Logo" />
            <span style="font-size: 2rem; color: #334349">Marina's Online Shop</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="./HomePage.aspx">
                        <img src="../Resources/home.svg" width="20" height="20">
                        Acasă
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./ProductsPage.aspx">
                        <img src="../Resources/grid.svg" width="20" height="20">
                        Listă Produse
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./CartPage.aspx">
                        <img src="../Resources/cart.svg" width="20" height="20">
                        Coș de cumpărături
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <form id="form1" runat="server">
        <div class="container content">
            <div class="row justify-content-md-center">
                <div class="col">
                    <asp:Image ID="Image1" runat="server" />
                </div>
                <div class="col">
                    <asp:Image ID="Image2" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col col-8 name-section">
                    <asp:Label ID="NameLabel" runat="server" Font-Bold="True" />
                </div>
                <div class="col col-4 price-section">
                    <asp:Label ID="PriceLabel" runat="server" />
                    <span>Lei</span>
                    <asp:Button ID="AdaugaInCosButton" runat="server" OnClick="AdaugaInCosButton_OnClick" CssClass="btn btn-primary" Text="Adaugă în coș" />
                </div>
            </div>
            <div class="row">
                <div class="col bordered-section">
                    <div>
                        <span class="subtitle">Categorie produs:</span>
                        <asp:Label ID="CategoryLabel" runat="server" CssClass="subtitle" />
                    </div>
                    <asp:TextBox ID="CategoryTextBox" runat="server" TextMode="MultiLine" ReadOnly="True" BorderStyle="None" CssClass="container-fluid description" />
                </div>
            </div>
            <div class="row">
                <div class="col bordered-section">
                    <div class="subtitle">Descriere produs:</div>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" TextMode="MultiLine" ReadOnly="True" BorderStyle="None" CssClass="container-fluid description" />
                </div>
            </div>
            <div class="row">
                <div class="col bordered-section">
                    <div class="subtitle">Specificații produs:</div>
                    <ul runat="server" id="SpecificationsList">
                    </ul>
                </div>
            </div>
        </div>
    </form>

    <%-- Scripts --%>
    <script src="../External/jquery/dist/jquery.min.js"></script>
    <script src="../External/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
