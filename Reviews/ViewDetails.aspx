<%@ Page Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="ViewDetails.aspx.cs" Inherits="Reviews_ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>
        <asp:Label ID="TitleLabel" runat="server" ></asp:Label>
    </h1>
    <asp:Label ID="SummaryLabel" CssClass="Summary" runat="server"></asp:Label>
    <asp:Label ID="BodyLabel" runat="server" ></asp:Label>
</asp:Content>

