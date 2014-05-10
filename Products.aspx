<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Products.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3"
        Style="margin-top: 22px">
        <LayoutTemplate>
            <table id="Table1" runat="server" align="center">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" align="center">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td2" runat="server" align="center">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
                            <Fields>
                                <asp:NumericPagerField />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td id="Td3" runat="server">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#String.Format("ProductDetails.aspx?Prod=" & Eval("ProductID")) %>'>  <%# Eval("Name") %>
                <p class="image">
                    <asp:Image ID="ProductImage" runat="server" Height="300px" ImageUrl='<%#"~/Images/Products/" + Eval("ImageFile") %>'
                        Width="300px" />
                </p>
                </asp:HyperLink>
            </td>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingDbConnectionString5 %>"
        ProviderName="<%$ ConnectionStrings:ShoppingDbConnectionString5.ProviderName %>"
        SelectCommand="SELECT * FROM [Products] WHERE ([CategoryID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="3" Name="CategoryID" QueryStringField="cat"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
