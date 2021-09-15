Namespace Classes
    Public Class User
        Public Property ID As Integer
        Public Property Name As String
        Public Property IsBlocked As Boolean


        Sub New(id As Object, name As String, isBlocked As Boolean)
            Me.ID = id
            Me.Name = name
            Me.IsBlocked = isBlocked
        End Sub
    End Class
End Namespace