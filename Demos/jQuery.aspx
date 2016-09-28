<%@ Page Title="jQuery Demo" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="jQuery.aspx.cs" Inherits="Demos_jQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="Server">

    <input id="Button1" type="button" value="button" />
    <script>
        $(document).ready(function () {
            $('#Button1').click(function () {
                $('#Banner1_VerticalPanel').toggle()
            });
        });
    </script>

</asp:Content>

