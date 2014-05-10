<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="SiteMap.aspx.vb" Inherits="SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <asp:TreeView ID="siteTree" runat="server" DataSourceID="SiteMapDataSource1" ShowLines="True"
             CssClass="siteTree">
        </asp:TreeView>
    </p>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="False" />
</asp:Content>
