<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ErrorPage.aspx.vb" Inherits="ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Oh no!</h2>
            <p>Something unexpected happened, which caused us to drop what we were doing and come
            here. We're sorry for the inconvenience.</p>
            <p><asp:Button ID="btnReturn" runat="server" Text="Return to Order Page" PostBackUrl="~/Order.aspx" /></p>
</asp:Content>

