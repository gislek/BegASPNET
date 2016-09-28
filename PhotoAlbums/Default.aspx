<%@ Page Title="All Photo Albums" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="PhotoAlbums_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DropDownList ID="photoAlbumList" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="photoAlbumList_SelectedIndexChanged" SelectMethod="PhotoAlbumList_GetData">
            </asp:DropDownList>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" ItemType="Picture" SelectMethod="ListView1_GetData">
                <EmptyDataTemplate>
                    No pictures found for this photo album
                </EmptyDataTemplate>
                <ItemTemplate>
                    <li>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "PhotoView?Id=" + Item.Id.ToString() %>'>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Item.ImageUrl %>' ToolTip='<%# Item.ToolTip %>' />
                        </asp:HyperLink>
                        <asp:Label ID="Description" runat="server" Text='<%# Item.Description %>' />
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul class="ItemContainer">
                        <li id="itemPlaceholder" runat="server" />
                    </ul>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                        <Fields>
                            <asp:NumericPagerField />
                        </Fields>
                    </asp:DataPager>

                </LayoutTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

