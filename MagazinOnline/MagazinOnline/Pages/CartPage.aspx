<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CartPage.aspx.vb" Inherits="MagazinOnline.CartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Magazin Online - Cos de cumparaturi</title>

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
            margin: 5px;
        }

        .empty-basket {
            font-size: 2rem;
            color: #334349;
            text-align: center;
            display: block;
            position: absolute;
            overflow: hidden;
            width: 500px;
            height: 250px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

            .empty-basket img {
                width: 100px;
                height: 100px;
            }

        .invisible {
            display: none;
        }

        .cart-tools {
            margin: 10px 20px;
        }

        .total-price {
            font-size: 1.75rem;
            font-weight: bold;
            color: #334349;
        }

        .place-order-button {
            font-size: 1.75rem;
            margin-left: 20px;
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

    <%-- Empty Basket --%>
    <asp:Panel runat="server" ID="EmptyBasketPanel" CssClass="empty-basket invisible">
        <img src="../Resources/cart.svg" alt="Empty Cart" />
        <br>
        Coșul tău de cumpărături este gol
    </asp:Panel>

    <form id="form1" runat="server">

        <%-- Cart Tools --%>
        <div runat="server" id="CartTools" class="cart-tools d-flex justify-content-end align-items-center">
            <div class="total-price">
                <asp:Label runat="server">Total: </asp:Label>
                <asp:Label runat="server" ID="TotalPrice" />
                <asp:Label runat="server">Lei</asp:Label>
            </div>

            <asp:Button OnClick="PlaceOrderOnClick" Text="Plasează comanda" runat="server" CssClass="btn btn-outline-success place-order-button" />
        </div>


        <%-- Basket Products --%>
        <asp:GridView ID="BasketGridView" runat="server" OnRowCommand="ProductsGridView_OnRowCommand" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="product-table table table-striped table-dark table-borderless" AllowPaging="True">
            <Columns>
                <asp:ImageField DataImageUrlField="Image1" HeaderText="Imagini" ControlStyle-BackColor="white" ControlStyle-CssClass="product-image" HeaderStyle-Width="10%" ItemStyle-Width="10%" FooterStyle-Width="10%" />
                <asp:ImageField DataImageUrlField="Image2" ShowHeader="False" ControlStyle-BackColor="white" ControlStyle-CssClass="product-image" HeaderStyle-Width="10%" ItemStyle-Width="10%" FooterStyle-Width="10%" />
                <asp:BoundField DataField="Name" HeaderText="Denumire Produs" ControlStyle-CssClass="product-name" HeaderStyle-Width="30%" ItemStyle-Width="30%" FooterStyle-Width="30%" />
                <asp:BoundField DataField="CategoryName" HeaderText="Categorie Produs" HeaderStyle-Width="15%" ItemStyle-Width="15%" FooterStyle-Width="15%" />
                <asp:BoundField DataField="PricePerQuantity" HeaderText="Preț (Lei)" HeaderStyle-Width="7%" ItemStyle-Width="7%" FooterStyle-Width="7%" />
                <asp:BoundField DataField="Quantity" HeaderText="Cantitate (buc.)" HeaderStyle-Width="10%" ItemStyle-Width="10%" FooterStyle-Width="10%" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="DecrementButton" runat="server" CausesValidation="false" CommandName="Decrement"
                            ImageUrl="../Resources/minus.svg" Width="50" Height="50" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-primary product-button" />
                        <asp:ImageButton ID="IncrementButton" runat="server" CausesValidation="false" CommandName="Increment"
                            ImageUrl="../Resources/plus.svg" Width="50" Height="50" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-primary product-button" />
                        <asp:Button ID="StergeDinCosButton" runat="server" CausesValidation="false" CommandName="StergeDinCos"
                            Text="Șterge din coș" Height="50" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-danger product-button" />
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
