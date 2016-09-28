<%@ Page Title="Manage Photo Album" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="ManagePhotoAlbum.aspx.cs" Inherits="_ManagePhotoAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" ItemType="Picture" InsertItemPosition="LastItem" SelectMethod="ListView1_GetData" InsertMethod="ListView1_InsertItem" DeleteMethod="ListView1_DeleteItem">
        <InsertItemTemplate>
            <li>
                Description: <asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Text='<%# BindItem.Description %>' />
                <asp:RequiredFieldValidator ID="ReqDesc" runat="server" ControlToValidate="Description" ErrorMessage="Enter a description."></asp:RequiredFieldValidator>
                <br />
                ToolTip: <asp:TextBox ID="ToolTip" runat="server" Text='<%# BindItem.ToolTip %>' />
                <asp:RequiredFieldValidator ID="ReqToolTip" runat="server" ControlToValidate="ToolTip" ErrorMessage="Enter a tool tip."></asp:RequiredFieldValidator>
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:CustomValidator ID="CustomValImage" runat="server" ErrorMessage="Select a valid .jpg file."></asp:CustomValidator>
                <br /><br />
                <asp:Button ID="InsertButton" runat="server" Text="Insert" CommandName="Insert" />
            </li>
        </InsertItemTemplate>
        <ItemTemplate>
            <li>
                Description: <asp:Label ID="Description" runat="server" TextMode="MultiLine" Text='<%# Item.Description %>' />
                <br />
                ToolTip: <asp:Label ID="ToolTip" runat="server" Text='<%# Item.ToolTip %>' />
                <br />
                <asp:Image ID="ImageUrl" runat="server" ImageUrl='<%# Item.ImageUrl %>' />
                <br />
                <asp:Button ID="DeleteButton" runat="server" Text="Delete" CommandName="Delete" CausesValidation="false" />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul class="ItemContainer">
                <li runat="server" id="itemPlaceholder" />
            </ul>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>

