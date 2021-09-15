Namespace Classes
    Public Class ProductDisplay
        Public Property Id() As Integer
        Public Property Image1() As String
        Public Property Image2() As String
        Public Property Name() As String
        Public Property CategoryName() As String
        Public Property Price() As Decimal
        Public Property Quantity() As Integer
        Public ReadOnly Property PricePerQuantity() As Decimal
            Get
                Return Price * Quantity
            End Get
        End Property
    End Class
End Namespace