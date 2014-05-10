<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="table1">
            <td class="td2">
                <h4>
                    Email:</h4>
            </td>
            <td>
                <asp:TextBox ID="txtBEmail" runat="server" Width="255px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                <h4>
                    Name:</h4>
            </td>
            <td>
                <asp:TextBox ID="txtBName" runat="server" Width="256px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td2">
                <h4>
                    Comments/Concerns:</h4>
            </td>
            <td>
                <asp:TextBox ID="txtBComment" runat="server" Height="170px" Width="495px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
            </td>
            <td>
                <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btnSend" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirm2" runat="server"></asp:Label>
</asp:Content>
