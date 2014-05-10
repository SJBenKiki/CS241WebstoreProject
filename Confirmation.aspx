<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Confirmation.aspx.vb" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="table1">
        <tr>
            <td class="td3">
                <asp:Label ID="lblInvoice" runat="server" Text="Invoice:" CssClass="lblInvoice"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="td3">
                <asp:Label ID="lblConfirm" runat="server" CssClass="lblConfirm"></asp:Label>
            </td>
            <td>
                <asp:ListBox ID="lstCart" runat="server" Height="217px" Width="424px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td class="td3">
                <p>
                    <asp:Button ID="btnReturn" runat="server" Text="Return to home page" PostBackUrl="~/Home.aspx"
                        CssClass="btnReturn" />
                </p>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingDbConnectionString5 %>"
        ProviderName="<%$ ConnectionStrings:ShoppingDbConnectionString5.ProviderName %>"
        SelectCommand="SELECT LineItems.UnitPrice, LineItems.Quantity, Products.Name, Products.ShortDescription FROM (LineItems INNER JOIN Products ON LineItems.ProductID = Products.ProductID) WHERE (LineItems.InvoiceNumber = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="invoice" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
