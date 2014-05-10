Imports Microsoft.VisualBasic

Public Class Product
    Public Property ProductID As String
    Public Property Name As String
    Public Property ShortDescription As String
    Public Property LongDescription As String
    Public Property UnitPrice As Decimal
    Public Property ImageFile As String

    Public Function Display() As String
        Return ProductID & Name & " " & UnitPrice & " each)" & ImageFile
    End Function
End Class
