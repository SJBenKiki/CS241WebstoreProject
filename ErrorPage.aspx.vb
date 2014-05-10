Imports System.Web.Mail
Imports System.Net.Mail

Partial Class ErrorPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object,
            ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.SendEmail(Session("Exception"))
            Session.Remove("Exception")
        End If
    End Sub

    Private Sub SendEmail(ByVal ex As Exception)
        Dim body As String
        body = "An exception occurred at " & Now.ToLongTimeString &
               " on " & Now.ToLongDateString & "<br />" & ex.Message
        Response.Write(body)
        'Dim msg As New System.Web.Mail.MailMessage("halloween@murach.com", "support@murach.com")
        'msg.Subject = "Exception in Halloween application"
        'msg.Body = body
        'msg.IsBodyHtml = True
        'Dim client As New SmtpClient("localhost")
        'client.Send(msg)
    End Sub

End Class
