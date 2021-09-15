Imports MagazinOnline.Classes

Public Module ActiveSession
    Public ConnectedUser As User
    Public Basket As HashSet(Of Integer) = New HashSet(Of Integer)
    Public BasketQuantities As Dictionary(Of Integer, Integer) = New Dictionary(Of Integer, Integer)()

    Public Sub AddProductIdToBasket(productId As Integer)
        Basket.Add(productId)
        If BasketQuantities.ContainsKey(productId) Then Return
        BasketQuantities.Add(productId, 1)
    End Sub

    Public Sub RemoveProductIdFromBasket(productId As Integer)
        Basket.Remove(productId)
        If BasketQuantities.ContainsKey(productId) Then
            BasketQuantities.Remove(productId)
        End If
    End Sub
End Module
