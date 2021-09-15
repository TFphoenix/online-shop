Imports System.Data.SqlClient

Public Class DetailsPage
    Inherits System.Web.UI.Page

    Dim ConnString As String = ConfigurationManager.ConnectionStrings("BDProiectConnectionString").ConnectionString
    Dim Connection As New SqlConnection(ConnString)
    Dim spGetProductById As New SqlCommand()
    Dim spGetProductSpecifications As New SqlCommand()
    Dim ProductId As Integer

    Public Sub New()
        spGetProductById.CommandType = CommandType.StoredProcedure
        spGetProductById.CommandText = "spGetProductById"
        spGetProductById.Connection = Connection

        spGetProductSpecifications.CommandType = CommandType.StoredProcedure
        spGetProductSpecifications.CommandText = "spGetProductSpecifications"
        spGetProductSpecifications.Connection = Connection
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            ProductId = Request.QueryString("id")
            spGetProductById.Parameters.Add("@ProductId", SqlDbType.Int).Value = ProductId
            spGetProductSpecifications.Parameters.Add("@ProductId", SqlDbType.Int).Value = ProductId
            Connection.Open()
            Dim results As SqlDataReader

            'Populate primary data
            results = spGetProductById.ExecuteReader()
            If Not results.HasRows Then Throw New Exception
            While (results.Read())
                Image1.ImageUrl = results("Foto1").ToString()
                Image2.ImageUrl = results("Foto2").ToString()
                NameLabel.Text = results("DenumireProdus").ToString()
                CategoryLabel.Text = results("DenumireCategorie").ToString()
                CategoryTextBox.Text = results("DescriereCategorie").ToString()
                PriceLabel.Text = results("Pret").ToString()
                DescriptionTextBox.Text = results("Descriere").ToString()
            End While
            results.Close()

            'Populate specifications data
            results = spGetProductSpecifications.ExecuteReader()
            While (results.Read())
                Dim name = results("DenumireCaracteristica").ToString()
                Dim value = results("Valoare").ToString()

                Dim li = New HtmlGenericControl("li")
                li.InnerText = $"{name}: {value}"
                SpecificationsList.Controls.Add(li)
            End While

        Catch ex As Exception
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Eroare la încărcarea detaliilor despre produs')", True)
            form1.Attributes.Add("class", "invisible")

        Finally
            Connection.Close()
            Connection.Dispose()
        End Try
    End Sub

    Protected Sub AdaugaInCosButton_OnClick(sender As Object, e As EventArgs)
        ActiveSession.AddProductIdToBasket(ProductId)
    End Sub
End Class