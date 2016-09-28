<%@ Page Title="Demo Database List" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="DemoDBList.aspx.cs" Inherits="Demos_DemoDBList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

        <ItemTemplate>
            <ul>
                <li>
                    <asp:Label runat="server" ID="Label1" 
                    text='<%# Eval("Name") %>' />
                </li>
            </ul>
        </ItemTemplate>

    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PlanetWroxConnectionString1 %>" SelectCommand="SELECT [Name] FROM [Genre]"></asp:SqlDataSource>
</asp:Content>

