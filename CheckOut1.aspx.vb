Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb

Partial Class CheckOut1
    Inherits System.Web.UI.Page

    Dim cookieExists As Boolean
    Dim customerDataView As DataView
    Dim cart As CartItemList
    Dim email As String
    Dim invoiceNumber As String

    Protected Sub Page_Load(ByVal sender As Object,
            ByVal e As System.EventArgs) Handles Me.Load
        cart = CType(Session("Cart"), CartItemList)
        If String.IsNullOrEmpty(Request.QueryString("Email")) Then
            cookieExists = False
        Else
            cookieExists = True
        End If
        If Not IsPostBack Then
            Me.LoadYears()
            Me.ddPackingMaterials.Items.Add("Bubble Wrap")
            Me.ddPackingMaterials.Items.Add("Newspaper")
            Me.ddPackingMaterials.Items.Add("Packing Peanuts")
            Me.ddPackingMaterials.Items.Add("Real Peanuts")
            Me.ddPackingMaterials.Items.Add("Paper Cranes")
            If cookieExists Then
                SqlDataSource1.SelectParameters("Email").DefaultValue =
                    Request.QueryString("Email")
                customerDataView = CType(SqlDataSource1.Select(
                    DataSourceSelectArguments.Empty), DataView)
                Session("CustomerView") = customerDataView
                If customerDataView.Count <> 0 Then
                    Me.DisplayCustomerData()
                Else
                    txtEmail.Enabled = True
                    txtEmail.Text = Request.QueryString("Email")
                End If
            Else
                txtEmail.Enabled = True
            End If
        End If
    End Sub

    Private Sub DisplayCustomerData()
        txtEmail.Text = customerDataView(0)("Email").ToString
        txtFirstName.Text = customerDataView(0)("FirstName").ToString
        txtLastName.Text = customerDataView(0)("LastName").ToString
        txtAddress.Text = customerDataView(0)("Address").ToString
        txtCity.Text = customerDataView(0)("City").ToString
        txtState.Text = customerDataView(0)("State").ToString
        txtZipCode.Text = customerDataView(0)("ZipCode").ToString
        txtPhone.Text = customerDataView(0)("PhoneNumber").ToString
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object,
            ByVal e As System.EventArgs) Handles btnCancel.Click
        Session.Remove("Cart")
        Response.Redirect("Home.aspx")
    End Sub

    Protected Sub btnAccept_Click(ByVal sender As Object,
            ByVal e As System.EventArgs) Handles btnAccept.Click
        If cart Is Nothing Then
            validatorQuantity.Visible = True
            Return
        End If
        If Page.IsValid Then
            If Not cookieExists Then
                Me.AddCookie()
            End If
            If Session("CustomerView") Is Nothing Then
                SqlDataSource1.SelectParameters("Email").DefaultValue =
                    txtEmail.Text
                customerDataView = CType(SqlDataSource1.Select(
                    DataSourceSelectArguments.Empty), DataView)
            Else
                customerDataView = CType(Session("CustomerView"), DataView)
            End If
            If customerDataView.Count = 0 Then
                Me.AddCustomer()
            Else
                If CustomerModified() Then
                    Me.UpdateCustomer()
                End If
            End If
            Me.PutInvoice()
            Me.GetInvoiceNumber()
            Me.PutLineItems()
            Session.Remove("Cart")

            Session("Email") = txtEmail.Text
            Response.Redirect("Confirmation.aspx?invoice=" & invoiceNumber)
        End If
    End Sub

    Private Sub PutLineItems()
        For i = 0 To cart.Count - 1
            Dim cartItem As CartItem = cart(i)
            SqlDataSource3.InsertParameters("InvoiceNumber").DefaultValue = invoiceNumber
            SqlDataSource3.InsertParameters("ProductID").DefaultValue = cartItem.Product.ProductID
            SqlDataSource3.InsertParameters("UnitPrice").DefaultValue = cartItem.Product.UnitPrice
            SqlDataSource3.InsertParameters("Quantity").DefaultValue = cartItem.Quantity
            SqlDataSource3.Insert()
        Next
    End Sub

    Private Sub LoadYears()
        Dim count As Integer
        Dim year As Integer = Now.Year
        Do Until count = 6
            ddlYear.Items.Add(year)
            count += 1
            year += 1
        Loop
    End Sub

    Private Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings("ShoppingDbConnectionString5").ConnectionString
    End Function

    Private Sub GetInvoiceNumber()
        Dim conShoppingDB As New OleDbConnection(ConfigurationManager.ConnectionStrings("ShoppingDbConnectionString5").ConnectionString)
        Dim invoiceNoCommand As New OleDbCommand(
           "Select LAST(InvoiceNumber) From Invoices", conShoppingDB)
        conShoppingDB.Open()
        invoiceNumber = invoiceNoCommand.ExecuteScalar
        conShoppingDB.Close()
    End Sub

    Private Sub PutInvoice()
        SqlDataSource2.InsertParameters("CustEmail").DefaultValue = txtEmail.Text
        SqlDataSource2.InsertParameters("OrderDate").DefaultValue = Today
        Dim quantity As Integer = Me.Quantity
        If rdoGround.Checked Then
            SqlDataSource2.InsertParameters("ShipMethod").DefaultValue =
                "UPS Ground"
            SqlDataSource2.InsertParameters("Shipping").DefaultValue =
                3.95 + (quantity - 1) * 1.25
        ElseIf rdo2Day.Checked Then
            SqlDataSource2.InsertParameters("ShipMethod").DefaultValue =
                "UPS Second Day"
            SqlDataSource2.InsertParameters("Shipping").DefaultValue =
                7.95 + (quantity - 1) * 2.5
        ElseIf rdoFedEx.Checked Then
            SqlDataSource2.InsertParameters("ShipMethod").DefaultValue =
                "Federal Express"
            SqlDataSource2.InsertParameters("Shipping").DefaultValue =
                19.95 + (quantity - 1) * 4.95
        End If
        If ddPackingMaterials.SelectedValue = "bubble" Then
            SqlDataSource2.InsertParameters("PackingMaterial").DefaultValue = "Bubbles"
        ElseIf ddPackingMaterials.SelectedValue = "newspaper" Then
            SqlDataSource2.InsertParameters("PackingMaterial").DefaultValue = "Newspaper"
        ElseIf ddPackingMaterials.SelectedValue = "packingpeanuts" Then
            SqlDataSource2.InsertParameters("PackingMaterial").DefaultValue = "Packingpeanuts"
        ElseIf ddPackingMaterials.SelectedValue = "realpeanuts" Then
            SqlDataSource2.InsertParameters("PackingMaterial").DefaultValue = "Real Peanuts"
        ElseIf ddPackingMaterials.SelectedValue = "cranes" Then
            SqlDataSource2.InsertParameters("PackingMaterial").DefaultValue = "Cranes"
        End If
        Dim subtotal As Decimal = Me.SubTotal
        SqlDataSource2.InsertParameters("Subtotal").DefaultValue = subtotal
        Dim salesTax As Decimal = subtotal * 0.075
        SqlDataSource2.InsertParameters("SalesTax").DefaultValue = salesTax
        SqlDataSource2.InsertParameters("Total").DefaultValue = subtotal + salesTax
        SqlDataSource2.InsertParameters("CreditCardType").DefaultValue = lstCardType.SelectedValue
        SqlDataSource2.InsertParameters("CardNumber").DefaultValue = txtCardNumber.Text
        SqlDataSource2.InsertParameters("ExpirationMonth").DefaultValue = ddlMonth.SelectedValue
        SqlDataSource2.InsertParameters("ExpirationYear").DefaultValue = ddlYear.SelectedValue
        Try
            SqlDataSource2.Insert()
            'Throw New Exception("An SQL exception occurred.")
        Catch ex As Exception
            Session("Exception") = ex
            Response.Redirect("ErrorPage.aspx")
            'Server.ClearError()
            'Response.Write(ex.Message & "<br />" & ex.Source)
        End Try
    End Sub

    Private Function Quantity() As Integer
        If cart IsNot Nothing Then
            Dim qty As Integer
            For i = 0 To cart.Count - 1
                qty += cart(i).Quantity
            Next
            Return qty
        End If

    End Function

    Private Function SubTotal() As Decimal
        Dim subtot As Decimal
        For i = 0 To cart.Count - 1
            subtot += cart(i).Quantity * cart(i).Product.UnitPrice
        Next
        Return subtot
    End Function

    Private Sub AddCookie()
        Dim emailCookie As New HttpCookie("Email", txtEmail.Text)
        emailCookie.Expires = Now.AddYears(1)
        Response.Cookies.Add(emailCookie)
    End Sub

    Private Sub AddCustomer()
        SqlDataSource1.InsertParameters("Email").DefaultValue =
            txtEmail.Text
        SqlDataSource1.InsertParameters("FirstName").DefaultValue =
            txtFirstName.Text
        SqlDataSource1.InsertParameters("LastName").DefaultValue =
            txtLastName.Text
        SqlDataSource1.InsertParameters("Address").DefaultValue =
            txtAddress.Text
        SqlDataSource1.InsertParameters("City").DefaultValue =
            txtCity.Text
        SqlDataSource1.InsertParameters("State").DefaultValue =
            txtState.Text
        SqlDataSource1.InsertParameters("ZipCode").DefaultValue =
            txtZipCode.Text
        SqlDataSource1.InsertParameters("PhoneNumber").DefaultValue =
            txtPhone.Text
        SqlDataSource1.Insert()
    End Sub

    Private Function CustomerModified() As Boolean
        Dim modified As Boolean
        If customerDataView(0)("FirstName").ToString <> txtFirstName.Text Then
            modified = True
        ElseIf customerDataView(0)("LastName").ToString <> txtLastName.Text Then
            modified = True
        ElseIf customerDataView(0)("Address").ToString <> txtAddress.Text Then
            modified = True
        ElseIf customerDataView(0)("City").ToString <> txtCity.Text Then
            modified = True
        ElseIf customerDataView(0)("State").ToString <> txtState.Text Then
            modified = True
        ElseIf customerDataView(0)("ZipCode").ToString <> txtZipCode.Text Then
            modified = True
        ElseIf customerDataView(0)("PhoneNumber").ToString <> txtPhone.Text Then
            modified = True
        End If
        Return modified
    End Function

    Private Sub UpdateCustomer()
        SqlDataSource1.UpdateParameters("FirstName").DefaultValue =
            txtFirstName.Text
        SqlDataSource1.UpdateParameters("LastName").DefaultValue =
            txtLastName.Text
        SqlDataSource1.UpdateParameters("Address").DefaultValue =
            txtAddress.Text
        SqlDataSource1.UpdateParameters("City").DefaultValue =
            txtCity.Text
        SqlDataSource1.UpdateParameters("State").DefaultValue =
            txtState.Text
        SqlDataSource1.UpdateParameters("ZipCode").DefaultValue =
            txtZipCode.Text
        SqlDataSource1.UpdateParameters("PhoneNumber").DefaultValue =
            txtPhone.Text
        SqlDataSource1.UpdateParameters("original_Email").DefaultValue =
            txtEmail.Text
        SqlDataSource1.Update()
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        Response.Redirect("Home.aspx")
    End Sub
End Class
