<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Home.aspx.vb" Inherits="Main" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>
        Featured Art</h2>
    <h3>
        Winter Life</h3>
    <p class="label3">
        A piece of detail from the Winter Life piece of the deer standing alert."
    </p>
    <a href="Products.aspx" class="more">Learn More&#10152;</a>
    <img id="image" alt="Image1" src="Images/Products/winterlifedetail2.jpg" />
</asp:Content>
