<%@ Page Title="All Reviews" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="All.aspx.cs" Inherits="Reviews_All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" ItemType="Review">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ViewDetails?ReviewId=" + Item.Id.ToString() %>' Text='<%# Item.Title %>' />
        </ItemTemplate>
        <SeparatorTemplate><br /></SeparatorTemplate>
    </asp:Repeater>
</asp:Content>

