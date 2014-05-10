Imports System.Data

Partial Class Confirmation
    Inherits System.Web.UI.Page

    Private cart As CartItemList
    Dim customerDataView As DataView
    Dim qty As String
    Dim price As String
    Dim itemName As String

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        cart = CartItemList.GetCart
        If Not IsPostBack Then
            Me.DisplayCart()
            lblConfirm.Text = "Thank you for your order. It will be shipped on " &
          Today.AddDays(1) & "."
        End If
    End Sub

    Private Sub DisplayCart()
        Dim pid = Request.QueryString("invoice")
        customerDataView = CType(SqlDataSource1.Select(
                    DataSourceSelectArguments.Empty), DataView)
        Session("CustomerView") = customerDataView
        For i As Int32 = 0 To customerDataView.Count - 1
            itemName = customerDataView(i)("name").ToString()
            qty = customerDataView(i)("quantity").ToString()
            price = customerDataView(i)("UnitPrice").ToString()
            lstCart.Items.Add(qty & " of " & itemName & " for $" & price & " each")
        Next


    End Sub
    Protected Sub btnReturn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReturn.Click
        Response.Redirect("Home.aspx")
    End Sub

End Class
