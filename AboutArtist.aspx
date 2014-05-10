<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AboutArtist.aspx.vb" Inherits="AboutArtist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 292px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Bena.jpg" 
                    Height="289px" Width="288px" /></td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="About the Artist:"></asp:Label></td>
        </tr>
        <tr>
            <td class="style2">
                </td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Bena Salerno was born in South Windsor, Connecticut in 1987. From an early age she would draw whenever possible. Her parents would later encourage this by bringing her to courses at the Norwhich Free Academy while she was still in elementary school. In 2009, Bena graduated with a Bachelors of Fine Arts from Manhattanville College.
                Since then, Bena Salerno's paintings have been exhibited in the touring exhibit The Peace Project and in the Mills Pond House's annual Midnight Oils exhibit. In 2012 her art and animation was used in an independent film by Parted Sky Studios. She is now expanding into web design by volunteering to redo the website of the Connecticut charity Bikes for Kids."></asp:Label></td>
        </tr>
    </table>

</asp:Content>

