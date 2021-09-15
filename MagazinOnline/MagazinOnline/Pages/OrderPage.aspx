<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OrderPage.aspx.vb" Inherits="MagazinOnline.OrderPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Magazin online - Comandă</title>

    <%-- CSS --%>
    <link rel="stylesheet" href="../External/bootstrap/dist/css/bootstrap.min.css" />
    <style>
        .page-content {
            margin: 20px 20%;
        }

        .total-price {
            font-size: 1.75rem;
            font-weight: bold;
            color: #334349;
            margin-bottom: 40px;
            text-align: right
        }

        .form-buttons {
            margin-top: 40px;
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

    <div class="page-content">
        <%-- Order Info --%>
        <h2>Comanda ta</h2>
        <ul runat="server" id="ProductList" class="list-group order-products">
            <%-- Products... --%>
        </ul>
        <div class="total-price">
            <asp:Label runat="server">Total: </asp:Label>
            <asp:Label runat="server" ID="TotalPrice" />
            <asp:Label runat="server">Lei</asp:Label>
        </div>

        <%-- Personal Info --%>
        <h2>Informații personale</h2>
        <p>Completează câmpurile de mai jos pentru a ști unde să-ți livrăm produsele</p>
        <form id="form1" runat="server">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputNume">Nume</label>
                    <input type="text" class="form-control" id="inputNume" placeholder="Florescu">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPrenume">Prenume</label>
                    <input type="text" class="form-control" id="inputPrenume" placeholder="Maria">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputTelefon">Telefon</label>
                    <input type="text" class="form-control" id="inputTelefon" placeholder="0747096332">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputEmail">Email</label>
                    <input type="email" class="form-control" id="inputEmail" placeholder="exemplu@mail.ro">
                </div>
            </div>
            <div class="form-group">
                <label for="inputAddresa">Adresă</label>
                <input type="text" class="form-control" id="inputAddresa" placeholder="Mihai Viteazu, Nr. 35, Sc. A, Ap. 22">
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputCity">Localitate</label>
                    <input type="text" class="form-control" id="inputCity" placeholder="Alba Iulia">
                </div>
                <div class="form-group col-md-4">
                    <label for="inputJudet">Județ</label>
                    <select class="form-control" id="inputJudet">
                        <option value="1">Alba</option>
                        <option value="849">Arad</option>
                        <option value="1234">Argeș</option>
                        <option value="2110">Bacău</option>
                        <option value="2841">Bihor</option>
                        <option value="3522">Bistriţa-Năsăud</option>
                        <option value="3869">Botoşani</option>
                        <option value="4416">Brăila</option>
                        <option value="4678">Braşov</option>
                        <option value="4954">Bucureşti</option>
                        <option value="4967">Buzău</option>
                        <option value="5636">Călăraşi</option>
                        <option value="5971">Caraş-Severin</option>
                        <option value="6379">Cluj</option>
                        <option value="6977">Constanţa</option>
                        <option value="7368">Covasna</option>
                        <option value="7568">Dâmboviţa</option>
                        <option value="8223">Dolj</option>
                        <option value="8766">Galaţi</option>
                        <option value="9129">Giurgiu</option>
                        <option value="9458">Gorj</option>
                        <option value="10026">Harghita</option>
                        <option value="10465">Hunedoara</option>
                        <option value="11057">Ialomiţa</option>
                        <option value="11384">Iaşi</option>
                        <option value="12088">Ilfov</option>
                        <option value="12319">Maramureș</option>
                        <option value="12773">Mehedinţi</option>
                        <option value="13275">Mureș</option>
                        <option value="14019">Neamţ</option>
                        <option value="14579">Olt</option>
                        <option value="15263">Prahova</option>
                        <option value="15941">Sălaj</option>
                        <option value="16309">Satu Mare</option>
                        <option value="16629">Sibiu</option>
                        <option value="16910">Suceava</option>
                        <option value="17566">Teleorman</option>
                        <option value="18056">Timiş</option>
                        <option value="18552">Tulcea</option>
                        <option value="18793">Vâlcea</option>
                        <option value="19674">Vaslui</option>
                        <option value="20390">Vrancea</option>
                    </select>
                </div>
                <div class="form-group col-md-2">
                    <label for="inputZip">Cod poștal</label>
                    <input type="text" class="form-control" id="inputZip" placeholder="510005">
                </div>
            </div>
            <div class="form-buttons">
                <asp:Button OnClick="Cancel_OnClick" type="reset" class="btn btn-danger" runat="server" Text="Anulează" />
                <asp:Button OnClick="PlaceOrder_OnClick" type="submit" class="btn btn-primary" runat="server" Text="Plasează comanda" />
            </div>
        </form>
    </div>

    <%-- Scripts --%>
    <script src="../External/jquery/dist/jquery.min.js"></script>
    <script src="../External/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
