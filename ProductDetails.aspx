<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="ProductDetails.aspx.vb" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DetailsView ID="ProductDeatils" runat="server" Height="50px" Width="125px" AutoGenerateRows="False"
        DataSourceID="SqlDataSource1" HorizontalAlign="Center" GridLines="Horizontal">
        <Fields>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="ProductImage" runat="server" Height="400px" ImageUrl='<%#"~/Images/Products/" + Eval("ImageFile") %>'
                        Width="450px" EnableViewState="True" ImageAlign="Middle" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" SortExpression="Name" ReadOnly="True" ShowHeader="False"
                ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="ShortDescription" SortExpression="ShortDescription" HeaderText="ShortDescription"
                ReadOnly="True" ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="LongDescription" SortExpression="LongDescription" ReadOnly="True"
                ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="UnitPrice" SortExpression="UnitPrice" ReadOnly="True"
                ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>


        </Fields>
    </asp:DetailsView>
    <div id="purchase">
        <p class="lblQuantity">
            Quantity:</p>
        <asp:TextBox ID="tbxQuantity" runat="server" ReadOnly="False" CssClass="tbxQuantity">1</asp:TextBox>
        <br />
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" 
            CssClass="btnAddToCart" />
            <asp:Button ID="btnGoToCart" runat="server" Text="Go to Cart" 
            CssClass="btnGoToCart" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingDbConnectionString5 %>"
        ProviderName="<%$ ConnectionStrings:ShoppingDbConnectionString5.ProviderName %>"
        SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="Prod" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
