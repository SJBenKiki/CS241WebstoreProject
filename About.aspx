<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="About.aspx.vb" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/ArtworkGalleryAboutStyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="table">
        <tr>
            <td id="td">
                <asp:Button ID="btnAboutArtist" runat="server" Text="About Artist" Height="163px"
                    Width="427px" CssClass="btnAboutArtist" />
            </td>
            <td id="td">
                <asp:Button ID="btnAboutUs" runat="server" Text="About Developers" Height="163px"
                    Width="427px" CssClass="btnAboutUs" />
            </td>
        </tr>
    </table>
    <br /><br />
</asp:Content>
