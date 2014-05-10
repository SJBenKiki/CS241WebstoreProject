<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="CheckIn.aspx.vb" Inherits="CheckIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 167px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>
        Have you been here before?</h2>
    <asp:Button ID="returning" runat="server" Text="Been here before" CssClass="returning" />
    <table class="table2">
        <tr>
            <td class="style4">
                <asp:Label ID="emailLabel" runat="server" Text="Email:" Visible="False" 
                    CssClass="emailLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailCheckin" runat="server" Width="403px" Visible="False" 
                    CssClass="txtEmailCheckin"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Button ID="checkout" runat="server" Text="I'm a new customer" CssClass="checkout" />
    <br /><br />
</asp:Content>
