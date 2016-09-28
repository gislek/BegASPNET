<%@ Page Title="Review Handler" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Management.master" CodeFile="AddEditReviewHandCoded.aspx.cs" Inherits="Management_AddEditReviewHandCoded" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="Server">

    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TitleText" runat="server" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Summary"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="SummaryText" runat="server" TextMode="MultiLine" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Body"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="BodyText" runat="server" TextMode="MultiLine" Width="450px" Height="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Genre"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="GenreList" runat="server" DataTextField="Name" DataValueField="Id" SelectMethod="GenreList_GetData">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Authorized"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="Authorized" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
