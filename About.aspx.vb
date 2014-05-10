
Partial Class About
    Inherits System.Web.UI.Page

    Protected Sub btnAboutArtist_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAboutArtist.Click
        Response.Redirect("AboutArtist.aspx")
    End Sub

    Protected Sub btnAboutUs_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAboutUs.Click
        Response.Redirect("AboutUs.aspx")
    End Sub
End Class
