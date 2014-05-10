<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Cart.aspx.vb" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/Main.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>
        Your shopping cart:</h2>

    <asp:GridView ID="GridView1" runat="server">
        <Columns>
            <asp:CommandField SelectText="Delete" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>


    <!---<asp:ListView ID="ListView1" runat="server" GroupItemCount="1">
            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="0">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                </table>
            </LayoutTemplate>

            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceHolder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>

            <ItemTemplate>
                <td id="Td3" runat="server">
                    <p class="name" style="position:relative">
                        <asp:RadioButton ID="rbtn"  style="position:relative; top:-23px;" runat="server" />         
                        <asp:Image ID="image" runat="server" Height="60px" ImageUrl='<%#"~/Images/Products/" + Eval("ImageFile") %>' />
                        <asp:Label ID="HyperLink1" runat="server" style="position:absolute; top:0; left:80px; white-space:nowrap;" Text='<%# "Product: " + Eval("Name") %>' />
                        <asp:Label ID="priceLabel" runat="server" style="position:absolute; top:18px; left:80px; white-space:nowrap;" Text='<%# "Price: " + String.Format("{0:c}", Eval("Price") )%>' />
                        <asp:Label ID="qty" runat="server" style="position:absolute; top:34px; left:80px; white-space:nowrap;" Text='<%# "Quantity: " + Eval("Quantity")     %>' />
                        
                    </p>
                </td>
            </ItemTemplate>
        </asp:ListView>---->


    <p id="shopbuttons">
        <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping"
            Width="227px" CssClass="btnContinue" />
        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" Width="152px" 
            CssClass="btnCheckOut" />
        <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" 
            CssClass="btnEmpty" />
    </p>

</asp:Content>
