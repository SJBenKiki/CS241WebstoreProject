<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="CheckOut1.aspx.vb" Inherits="CheckOut1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .validator
        {
            font-size: medium;
            color: #FF0000;
        }
        .style1
        {
            font-size: medium;
            color: #FF0000;
        }
    </style>
    <link href="Styles/CheckOutStyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <th>
            </th>
            <th>
                <asp:Label ID="Label1" runat="server" Text="Personal Information:"></asp:Label>
            </th>
            <th>
                <asp:Label ID="Label2" runat="server" Text="Shipping Options:"></asp:Label>
            </th>
        </tr>
        <tr>
            <th class="th1">
                <p class="label">
                    Email:</p>
            </th>
            <td>
                <p class="entry" dir="ltr">
                    <asp:TextBox ID="txtEmail" runat="server" Width="150px" MaxLength="25"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is a required field." CssClass="style1" Style="font-size: medium"></asp:RequiredFieldValidator>
                </p>
            </td>
            <td>
                <asp:RadioButton ID="rdoGround" runat="server" Checked="True" Text="UPS Ground" GroupName="Shipping"
                    CssClass="RdbShippingOptions" /><br />
                <asp:RadioButton ID="rdo2Day" runat="server" Text="UPS Second Day" GroupName="Shipping"
                    CssClass="RdbShippingOptions" /><br />
                <asp:RadioButton ID="rdoFedEx" runat="server" Text="Federal Express Overnight" GroupName="Shipping"
                    CssClass="RdbShippingOptions" />
            </td>
        </tr>
        <tr>
            <th class="th1">
                <p class="label">
                    First name:</p>
            </th>
            <td>
                <p class="entry">
                    <asp:TextBox ID="txtFirstName" runat="server" Width="150px" MaxLength="20" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirstName"
                        ErrorMessage="First name is a required field." CssClass="style1" Style="font-size: medium"></asp:RequiredFieldValidator>
                </p>
            </td>
            <td>
                <p class="lblBackBill">
                    Packing Materials:
                </p>
                <asp:DropDownList ID="ddPackingMaterials" runat="server" Height="16px" Width="152px"
                    CssClass="ddPackingMaterials">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th class="th1">
                <p class="label">
                    Last Name:</p>
            </th>
            <td>
                <p class="entry">
                    <asp:TextBox ID="txtLastName" runat="server" Width="150px" MaxLength="20" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLastName"
                        ErrorMessage="Last name is a required field." CssClass="style1" Style="font-size: medium"></asp:RequiredFieldValidator>
                </p>
            </td>
            <td>
                <p class="lblBackBill">
                    Billing Information:
                </p>
            </td>
        </tr>
        <tr>
            <th class="th1">
                <p class="label">
                    Address:</p>
            </th>
            <td>
                <p class="entry">
                    <asp:TextBox ID="txtAddress" runat="server" Width="250px" MaxLength="40" TabIndex="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress"
                        ErrorMessage="Address is a required field." CssClass="style1" Style="font-size: medium"></asp:RequiredFieldValidator>
                </p>
            </td>
            <td>
                <asp:ListBox ID="lstCardType" runat="server" Width="150px" CssClass="lstCartType">
                    <asp:ListItem Selected="True" Value="None">--Select a credit card--</asp:ListItem>
                    <asp:ListItem>VISA</asp:ListItem>
                    <asp:ListItem Value="MC">MasterCard</asp:ListItem>
                    <asp:ListItem Value="AMEX">American Express</asp:ListItem>
                </asp:ListBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="lstCardType"
                    Display="None" ErrorMessage="You must select a credit card." InitialValue="None"
                    CssClass="validator">*
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th class="th1">
                <p class="label">
                    City:</p>
            </th>
            <td>
                <p class="entry">
                    <asp:TextBox ID="txtCity" runat="server" Width="180px" MaxLength="30" TabIndex="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCity"
                        ErrorMessage="City is a required field." CssClass="style1" Style="font-size: medium"></asp:RequiredFieldValidator>
                </p>
            </td>
            <td>
                <p class="lblpayment">
                    Number on the card:</p>
                <p class="entry">
                    <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="20" Width="243px" CssClass="txtCardNumber"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCardNumber"
                        ErrorMessage="Credit card number is required." Display="None" CssClass="validator">*</asp:RequiredFieldValidator>
                </p>
            </td>
        </tr>
        <tr>
            <th class="th1">
                <p class="label">
                    State:</p>
            </th>
            <td>
                <p class="entry">
                    <asp:TextBox ID="txtState" runat="server" Width="25px" MaxLength="2" TabIndex="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtState"
                        ErrorMessage="State is a required field." CssClass="style1" Style="font-size: medium"></asp:RequiredFieldValidator>
                </p>
            </td>
            <td>
                <p class="lblpayment">
                    Experation Date:</p>
                <p class="entry">
                    <asp:DropDownList ID="ddlMonth" runat="server" Width="88px" CssClass="ddlMonth">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="1">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp&nbsp&nbsp
                    <asp:DropDownList ID="ddlYear" runat="server" Width="58px">
                    </asp:DropDownList>
                </p>
            </td>
        </tr>
        <tr>
            <th class="th1">
                <p class="label">
                    Zip Code:</p>
            </th>
            <td>
                <p class="entry">
                    <asp:TextBox ID="txtZipCode" runat="server" Width="75px" MaxLength="9" TabIndex="6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtZipCode"
                        ErrorMessage="Zip code is a required field." CssClass="style1" Style="font-size: medium"></asp:RequiredFieldValidator>
                </p>
            </td>
        </tr>
        <tr>
            <th class="th1">
                <p class="label">
                    Phone:</p>
            </th>
            <td>
                <p class="entry">
                    <asp:TextBox ID="txtPhone" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhone"
                        Display="Dynamic" ErrorMessage="Phone is a required field." CssClass="style1"
                        Style="font-size: medium"></asp:RequiredFieldValidator>
                </p>
            </td>
        </tr>
    </table>
    <center>
        <asp:Label ID="validatorQuantity" runat="server" Display="Dynamic" CssClass="validator"
            Style="font-size: medium" ForeColor="Red" Visible="False" Text="Sorry, your cart is empty.">
        </asp:Label>
    </center>
    <br />
    <p id="buttons">
        <asp:Button ID="btnAccept" runat="server" Text="Accept Order" CssClass="btnAccept" />&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CausesValidation="False"
            CssClass="btnCancel" />&nbsp;&nbsp&nbsp&nbsp
        <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" CausesValidation="False"
            CssClass="btnContinue" />
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingDbConnectionString5 %>"
        ProviderName="<%$ ConnectionStrings:ShoppingDbConnectionString5.ProviderName %>"
        DeleteCommand="DELETE FROM [Customers] WHERE [Email] = @original_Email" InsertCommand="INSERT INTO [Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (@Email, @LastName, @FirstName, @Address, @City, @State, @ZipCode, @PhoneNumber)"
        SelectCommand="SELECT * FROM [Customers] WHERE ([Email] = @Email)" UpdateCommand="UPDATE [Customers] SET [LastName] = @LastName, [FirstName] = @FirstName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [PhoneNumber] = @PhoneNumber WHERE [Email] = @original_Email">
        <SelectParameters>
            <asp:Parameter Name="Email" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_Email" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingDbConnectionString5 %>"
        ProviderName="<%$ ConnectionStrings:ShoppingDbConnectionString5.ProviderName %>"
        InsertCommand="INSERT INTO Invoices (CustEmail, OrderDate, Subtotal, ShipMethod,PackingMaterial, Shipping, SalesTax, Total, CreditCardType, CardNumber, ExpirationMonth, ExpirationYear) VALUES (@CustEmail, @OrderDate, @Subtotal, @ShipMethod,@PackingMaterial, @Shipping, @SalesTax, @Total, @CreditCardType, @CardNumber, @ExpirationMonth, @ExpirationYear)">
        <InsertParameters>
            <asp:Parameter Name="CustEmail" />
            <asp:Parameter Name="OrderDate" />
            <asp:Parameter Name="Subtotal" Type="Decimal" />
            <asp:Parameter Name="ShipMethod" />
            <asp:Parameter Name="PackingMaterial" />
            <asp:Parameter Name="Shipping" Type="Decimal" />
            <asp:Parameter Name="SalesTax" Type="Decimal" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="CreditCardType" />
            <asp:Parameter Name="CardNumber" />
            <asp:Parameter Name="ExpirationMonth" Type="Int16" />
            <asp:Parameter Name="ExpirationYear" Type="Int16" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingDbConnectionString5 %>"
        ProviderName="<%$ ConnectionStrings:ShoppingDbConnectionString5.ProviderName %>"
        InsertCommand="INSERT INTO LineItems (InvoiceNumber, ProductID, UnitPrice, Quantity)
                           VALUES (@InvoiceNumber, @ProductID, @UnitPrice, @Quantity)">
        <InsertParameters>
            <asp:Parameter Name="InvoiceNumber" />
            <asp:Parameter Name="ProductID" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
