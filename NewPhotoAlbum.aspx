<%@ Page Title="Create New Photo Album" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="NewPhotoAlbum.aspx.cs" Inherits="_NewPhotoAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:DetailsView ID="DetailsView1" AutoGenerateRows="False" DefaultMode="Insert" runat="server" InsertMethod="DetailsView1_InsertItem">
        <Fields>
            <asp:TemplateField HeaderText="Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Required" ControlToValidate="TextBox1" CssClass="ErrorMessage" Text="*"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="true" ShowCancelButton="false" />
        </Fields>
    </asp:DetailsView>
</asp:Content>

