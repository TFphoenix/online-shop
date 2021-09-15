Imports System.Data.SqlClient
Imports MagazinOnline.Classes

Public Class CartPage
    Inherits System.Web.UI.Page
    Dim ConnString As String = ConfigurationManager.ConnectionStrings("BDProiectConnectionString").ConnectionString
    Dim Connection As New SqlConnection(ConnString)
    Dim spGetProductById As New SqlCommand()
    Public Shared Products As New List(Of ProductDisplay)
    Public Shared TotalPriceReference As Decimal

    Public Sub New()
        spGetProductById.CommandType = CommandType.StoredProcedure
        spGetProductById.CommandText = "spGetProductById"
        spGetProductById.Connection = Connection
        spGetProductById.Parameters.Add("@ProductId", SqlDbType.Int)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            PopulateBasket()
        End If
    End Sub

    Private Sub PopulateBasket()
        Try
            Connection.Open()

            'Populate basket products
            Products.Clear()
            For Each productId In ActiveSession.Basket
                spGetProductById.Parameters.Item("@ProductId").Value = productId
                Dim result = spGetProductById.ExecuteReader()
                Dim product = New ProductDisplay

                While (result.Read())
                    product.Id = result("Id")
                    product.Image1 = result("Foto1")
                    product.Image2 = result("Foto2")
                    product.Name = result("DenumireProdus")
                    product.CategoryName = result("DenumireCategorie")
                    product.Price = result("Pret")
                    product.Quantity = ActiveSession.BasketQuantities(productId)
                End While

                Products.Add(product)
                result.Close()
            Next

            RefreshBasket()

        Catch ex As Exception
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Eroare la încărcarea detaliilor despre produs')", True)

        Finally
            Connection.Close()
            Connection.Dispose()
        End Try
    End Sub

    Private Sub RefreshBasket()
        'Bind Products
        BasketGridView.DataSource = Products
        BasketGridView.DataBind()

        'Total Price
        TotalPrice.Text = Products.Sum(Function(p) p.PricePerQuantity)

        'If Empty
        If ActiveSession.Basket.Count = 0 Then
            EmptyBasketPanel.CssClass = EmptyBasketPanel.CssClass.Replace("invisible", "")
            CartTools.Attributes.Add("class", "invisible")
        End If
    End Sub

    Protected Sub ProductsGridView_OnRowCommand(sender As Object, e As GridViewCommandEventArgs)
        Try
            ID = Convert.ToInt32(e.CommandArgument)
            If String.Compare(e.CommandName, "StergeDinCos") = 0 Then
                ActiveSession.RemoveProductIdFromBasket(ID)
                Products.Remove(Products.First(Function(p) p.Id = ID))
                RefreshBasket()
            ElseIf String.Compare(e.CommandName, "Increment") = 0 Then
                Dim product = Products.First(Function(p) p.Id = ID)
                product.Quantity += 1
                ActiveSession.BasketQuantities(ID) += 1
                RefreshBasket()
            ElseIf String.Compare(e.CommandName, "Decrement") = 0 Then
                Dim product = Products.First(Function(p) p.Id = ID)
                If product.Quantity <= 1 Then Return
                product.Quantity -= 1
                ActiveSession.BasketQuantities(ID) -= 1
                RefreshBasket()
            End If
        Catch ex As Exception
            Return
        End Try
    End Sub

    Protected Sub PlaceOrderOnClick(sender As Object, e As EventArgs)
        TotalPriceReference = Decimal.Parse(TotalPrice.Text)
        OrderPage.IsReadyToReceive = True
        Response.Redirect($"OrderPage.aspx")
    End Sub
End Class