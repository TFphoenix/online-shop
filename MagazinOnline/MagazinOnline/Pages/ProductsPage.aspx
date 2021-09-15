<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProductsPage.aspx.vb" Inherits="MagazinOnline.ProductsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Magazin Online - Lista Produse</title>

    <%-- CSS --%>
    <link rel="stylesheet" href="../External/bootstrap/dist/css/bootstrap.min.css" />
    <style>
        .product-table {
            text-align: center;
        }

        .product-image {
            width: 150px;
            height: 150px;
            padding: 5px;
        }

        .product-button {
            margin: 10px 0;
        }

        a {
            color: white;
        }

            a:hover {
                color: #00CFC1;
                text-decoration: none;
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
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Caută..." aria-label="Search" />
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Caută</button>
            </form>
        </div>
    </nav>

    <%-- Products --%>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDProiectConnectionString %>" SelectCommand="SELECT * FROM [products_view]"></asp:SqlDataSource>
        <asp:GridView ID="ProduseGridView" runat="server" OnRowCommand="ProductsGridView_OnRowCommand" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="product-table table table-striped table-dark table-borderless" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:ImageField DataImageUrlField="Foto1" HeaderText="Imagini" ControlStyle-BackColor="white" ControlStyle-CssClass="product-image">
                    <ControlStyle BackColor="White" CssClass="product-image"></ControlStyle>
                </asp:ImageField>
                <asp:ImageField DataImageUrlField="Foto2" ShowHeader="False" ControlStyle-BackColor="white" ControlStyle-CssClass="product-image">
                    <ControlStyle BackColor="White" CssClass="product-image"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="DenumireProdus" HeaderText="Denumire Produs ⮃" SortExpression="DenumireProdus" ControlStyle-CssClass="product-name" HeaderStyle-Width="15%" ItemStyle-Width="15%" FooterStyle-Width="15%">
                    <ControlStyle CssClass="product-name"></ControlStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Descriere" HeaderText="Descriere ⮃" SortExpression="Descriere" />
                <asp:BoundField DataField="DenumireCategorie" HeaderText="Categorie Produs ⮃" SortExpression="DenumireCategorie" HeaderStyle-Width="15%" ItemStyle-Width="15%" FooterStyle-Width="15%" />
                <asp:BoundField DataField="Pret" HeaderText="Preț (Lei) ⮃" SortExpression="Pret" HeaderStyle-Width="7%" ItemStyle-Width="7%" FooterStyle-Width="7%" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="AdaugaInCosButton" runat="server" CausesValidation="false" CommandName="AdaugaInCos"
                            Text="Adaugă în coș" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-primary product-button" />
                        <asp:Button ID="DetailsButton" runat="server" CausesValidation="false" CommandName="DetailsProduct"
                            Text="Detalii produs" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-warning product-button" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>

    <%-- Scripts --%>
    <script src="../External/jquery/dist/jquery.min.js"></script>
    <script src="../External/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
