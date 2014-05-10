
Partial Class CheckIn
    Inherits System.Web.UI.Page

    Protected Sub returning_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles returning.Click
        emailLabel.Visible = True
        txtEmailCheckin.Visible = True
        checkout.Text = "Sign in"
        returning.Visible = False
    End Sub

    Protected Sub checkout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles checkout.Click
        Dim email As String = txtEmailCheckin.Text
        If String.IsNullOrEmpty(email) Then
            Response.Redirect("CheckOut1.aspx")
        Else
            Response.Redirect("CheckOut1.aspx?email=" & txtEmailCheckin.Text)
            'find user in database
            'show error if not found
            'if found, send user to a prepopulated checkout
        End If
    End Sub
End Class
