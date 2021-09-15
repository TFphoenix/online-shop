<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HomePage.aspx.vb" Inherits="MagazinOnline.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Magazin Online</title>

    <%-- CSS --%>
    <link rel="stylesheet" href="../External/bootstrap/dist/css/bootstrap.min.css" />
    <style>
        body {
            margin: 0;
            width: 100%;
            height: 100%;
        }

        #background {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: visible;
        }

        .homepage-panel {
            display: block;
            position: absolute;
            overflow: hidden;
            width: 900px;
            height: 500px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            backdrop-filter: blur(5px);
            box-shadow: 0px 10px 50px -15px black;
            background-color: rgba(255, 255, 255, 0.6);
            border: 0.3rem solid orange;
            border-radius: 10px;
            color: #334349;
            text-align: center;
            padding: 10px;
        }

            .homepage-panel img {
                width: 150px;
                margin: 5px;
            }

            .homepage-panel h1 {
                font-weight: bold;
                margin: 5px;
            }

            .homepage-panel h3 {
                font-weight: normal;
                margin: 5px;
            }

            .homepage-panel h4 {
                font-weight: normal;
                margin: 5px;
                padding: 5px;
            }

            .homepage-panel h5 {
                font-weight: normal;
                margin: 5px 10px;
                padding: 5px;
            }

            .homepage-panel a {
                font-size: 1.5rem;
                margin: 5px;
            }

        .pay-method {
            max-width: 50px;
            max-height: 50px;
        }
    </style>
</head>
<body>
    <img id="background" src="../Resources/background.svg" />
    <form id="form1" runat="server">
        <div class="homepage-panel">
            <div class="mb-4">
                <img src="../Resources/logo.svg" />
                <h1>Marina's Online Shop</h1>
                <h3>Totul dintr-o singură sursă</h3>
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <a href="./LoginPage.aspx" class="btn btn-outline-primary">Conectează-te</a>
                    <a href="./RegisterPage.aspx" class="btn btn-outline-primary">Creează un cont nou</a>
                    <a href="./ProductsPage.aspx" class="btn btn-outline-primary">Continuă fără cont</a>
                </div>
            </div>
            <div class="container">
                <div class="row justify-content-center mt-3">
                    <h4>Metode de plată:</h4>
                    <img src="../Resources/master.png" alt="master" class="pay-method" />
                    <img src="../Resources/visa.png" alt="visa" class="pay-method" />
                    <img src="../Resources/paypal.png" alt="paypal" class="pay-method" />
                </div>
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <h5>Contact:</h5>
                    <h5>marina@onlineshop.ro</h5>
                    <h5>+40745 678 902</h5>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
