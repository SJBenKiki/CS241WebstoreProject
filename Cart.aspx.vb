Imports System.Data

Partial Class Cart
    Inherits System.Web.UI.Page

    Private cart As CartItemList
    Dim dataTab As New DataTable
    Dim total As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cart = CartItemList.GetCart
        If Not IsPostBack Then
            Me.DisplayCart()
        End If
    End Sub


    Private Sub DisplayCart()
        Dim dataTab As New DataTable

        'dataTab.Columns.Add(New DataColumn("ImageFile"))
        dataTab.Columns.Add(New DataColumn("Name"))
        dataTab.Columns.Add(New DataColumn("Short Description"))
        dataTab.Columns.Add(New DataColumn("Long Description"))
        dataTab.Columns.Add(New DataColumn("Quantity"))
        dataTab.Columns.Add(New DataColumn("Price"))
        dataTab.Columns.Add(New DataColumn("ItemTotal"))


        Dim cartItem As CartItem
        For i = 0 To cart.Count - 1
            cartItem = cart(i)

            Dim row1 As DataRow = dataTab.NewRow
            Dim row2 As DataRow = dataTab.NewRow
            'row1("ImageFile") = cartItem.Product.ImageFile

            row1("Name") = cartItem.Product.Name
            row1("Short Description") = cartItem.Product.ShortDescription
            row1("Long Description") = cartItem.Product.LongDescription
            row1("Quantity") = cartItem.Quantity
            row1("Price") = cartItem.Product.UnitPrice
            row1("ItemTotal") = FormatCurrency(cartItem.Quantity * cartItem.Product.UnitPrice)

            dataTab.Rows.Add(row1)
        Next
        GridView1.DataSource = dataTab
        GridView1.DataBind()

    End Sub


    Protected Sub btnCheckOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckOut.Click
        Response.Redirect("CheckIn.aspx")
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        Response.Redirect("Home.aspx")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        If cart.Count > 0 Then
            If GridView1.SelectedIndex > -1 Then
                cart.RemoveAt(GridView1.SelectedIndex)
                Me.DisplayCart()
            Else
            End If
        End If
    End Sub

End Class

