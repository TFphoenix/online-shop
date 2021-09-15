Imports MagazinOnline.Classes

Public Class OrderPage
    Inherits System.Web.UI.Page
    Dim Products As New List(Of ProductDisplay)
    Public Shared IsReadyToReceive As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then Return

        'Limit page access
        If Not IsReadyToReceive Then
            Response.Redirect($"CartPage.aspx")
            Return
        Else
            IsReadyToReceive = False
        End If

        'Populate order data
        Try
            Products = CartPage.Products
            TotalPrice.Text = CartPage.TotalPriceReference

            For Each product In Products
                Dim li = New HtmlGenericControl("li")
                li.Attributes("class") = "list-group-item d-flex justify-content-between align-items-center"
                li.InnerText = $"{product.Name}"

                Dim span = New HtmlGenericControl("span")
                span.Attributes("class") = "badge badge-primary badge-pill"
                span.InnerText = $"{product.Quantity}"

                li.Controls.Add(span)
                ProductList.Controls.Add(li)
            Next
        Catch ex As Exception

        End Try

        'TODO: Populate personal data (if logged in as customer)
    End Sub

    Protected Sub PlaceOrder_OnClick(sender As Object, e As EventArgs)
        ActiveSession.Basket.Clear()
        ActiveSession.BasketQuantities.Clear()
        Response.Redirect("ProductsPage.aspx")
    End Sub

    Protected Sub Cancel_OnClick(sender As Object, e As EventArgs)
        Response.Redirect("CartPage.aspx")
    End Sub
End Class