Imports System.Data

Partial Class ProductDetails
    Inherits System.Web.UI.Page

    Private selectedProduct As Product
    Dim imageFile As String

    Private Function GetSelectedProduct(ByVal e) As Product
        Dim product As New Product
        Dim pid = Request.QueryString("Prod")
        Dim img As Image = ProductDeatils.Rows(0).Cells(0).FindControl("ProductImage")
        Dim price As Label = ProductDeatils.Rows(4).Cells(0).FindControl("lblPrice")
        product.ImageFile = img.ImageUrl
        product.ProductID = pid
        product.Name = ProductDeatils.Rows(1).Cells(0).Text()
        product.ShortDescription = ProductDeatils.Rows(2).Cells(0).Text()
        product.LongDescription = ProductDeatils.Rows(3).Cells(0).Text()
        product.UnitPrice = ProductDeatils.Rows(4).Cells(0).Text()
        Return (product)
    End Function

    Protected Sub btnGoToCart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGoToCart.Click
        Response.Redirect("Cart.aspx")
    End Sub

    Protected Sub btnAddToCart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddToCart.Click
        selectedProduct = Me.GetSelectedProduct(e)
        Dim quan = tbxQuantity.Text
        Dim prod = Request.QueryString("prod")

        Dim cart As CartItemList = CartItemList.GetCart
        Dim cartItem As CartItem = cart(selectedProduct.ProductID)
        If cartItem Is Nothing Then
            cart.AddItem(selectedProduct, quan)
        Else
            cartItem.AddQuantity(quan)
        End If
        Response.Redirect("Cart.aspx")
    End Sub

End Class

