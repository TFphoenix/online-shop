Public Class ProductsPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub

    Protected Sub ProductsGridView_OnRowCommand(sender As Object, e As GridViewCommandEventArgs)
        Try
            ID = Convert.ToInt32(e.CommandArgument)
            If String.Compare(e.CommandName, "AdaugaInCos") = 0 Then
                ActiveSession.AddProductIdToBasket(ID)
            ElseIf String.Compare(e.CommandName, "DetailsProduct") = 0 Then
                Response.Redirect($"DetailsPage.aspx?id={ID}")
            End If
        Catch ex As Exception
            Return
        End Try
    End Sub
End Class