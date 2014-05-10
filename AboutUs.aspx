<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AboutUs.aspx.vb" Inherits="About_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 216px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="style1" cellpadding="30" cellspacing="30">
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="Steven Hamilton (Project Manager):"></asp:Label></td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Steve was born in Huntington, NY. He moved to Medfield Massachusetts when he was turning 13. He is currently attending Massbay Community College for Engineering Design. He is nterested in cars and sports and knows how to use the following CAD programs: AutoCAD, SolidWorks, ProE, MasterCAM X7."></asp:Label></td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Miranda Lessard (Digital Imaging):"></asp:Label></td>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Miranda Lessard has always loved anything related to art and design; ask her to design you a logo, a banner, a flyer, or even a t-shirt and she'll jump at the opportunity. She has experience with many different areas of design, from 2-dimensional to 3-dimensional. Her favorite softwares to use are Adobe Photoshop and Solidworks. One of her favorite activities is drawing, and she loves to create interesting and abstract designs. "></asp:Label></td>

        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="Chester Moses (Site Designer):"></asp:Label></td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Chester Moses has a passion for computers, of all shapes and sizes. He has experience working in a variety of programming languages, from Python to assembly, with an emphasis on writing clean code. After years with a growing interest in typography and graphic design, he took several courses in web design to learn more about the premiere modern outlet for both. Outside of classes, he enjoys videogames, electronic music, and walks through the local botanical garden. His favorite font is Droid Serif."></asp:Label></td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Sarab Ben-Kiki (Site Developer):"></asp:Label></td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Sarah Ben-Kiki (formerly Sarah Salerno) is the sister of the artist. She is currently taking classes at MassBay in hopes to pursue a Master's degree in Computer Science at Umass Boston. She has been fascinated with computers ever since she was young yet wasn’t really interested in the programming aspect until her husband, who holds a bachelor’s degree in Computer Science and currently works in the field, convinced her to try a program and she feel instantly in love with the language of computers. She fell even more in love when she discovered the art of website design and hopes to put her new skills to good use. Currently Sarah knows Java, HTML, CSS, JavaScript, C, Python, git, Eclipse, VB.Net, and Visual Studio. "></asp:Label></td>
        </tr>
    </table>
    
</asp:Content>

