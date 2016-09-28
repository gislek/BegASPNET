<%@ Page Title="Events Demo" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Demos_Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <table>
        <tr>
            <td><h1>No PostBack</h1><asp:Label ID="NoPostBack" runat="server" /></td>
            <td><h1>PostBack</h1><asp:Label ID="PostBack" runat="server" /></td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnDataBinding="GridView1_DataBinding" OnDataBound="GridView1_DataBound" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" OnSorted="GridView1_Sorted" OnSorting="GridView1_Sorting">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="SortOrder" HeaderText="SortOrder" SortExpression="SortOrder" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PlanetWroxConnectionString1 %>" SelectCommand="SELECT * FROM [Genre]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
</asp:Content>

