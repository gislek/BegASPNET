<%@ Page Title="Log in to Plaget Wrox" Language="C#" MasterPageFile="~/MasterPages/Frontend.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="Server">
    <h1>Log in to Planet Wrox</h1>
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <asp:Login ID="Login1" runat="server" CreateUserText="Don't have an account? Sign Up" CreateUserUrl="~/SignUp.aspx" DestinationPageUrl="~/Default.aspx">
            </asp:Login>
            <br /><br />
            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
                <MailDefinition Subject="Your New Password for PlanetWrox.com" />
            </asp:PasswordRecovery>
        </AnonymousTemplate>
        <LoggedInTemplate>
            You are already logged in.<br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
            &nbsp;
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>

