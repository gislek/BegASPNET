<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="Controls_ContactForm" %>
<style type="text/css">
    .auto-style1 {
        width: inherit;
    }
</style>

<script>
    function validatePhoneNumbers(source, args) {
        var phoneHome = document.getElementById('<%=PhoneHome.ClientID %>');
        var phoneBusiness = document.getElementById('<%=PhoneBusiness.ClientID %>');
        if (phoneHome.value != '' || phoneBusiness.value != '') {
            args.isValid = true;
        }
        else {
            args.isValid = false;
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <div id="TableWrapper">
        <table runat="server" id="FormTable" class="auto-style1">
            <tr>
                <td colspan="3">Use the form below to get in touch with us</td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" CssClass="ErrorMessage" ErrorMessage="Enter your name">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>E-mail address</td>
                <td>
                    <asp:TextBox ID="EmailAddress" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter an e-mail address" ControlToValidate="EmailAddress">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter a valid e-mail address" ControlToValidate="EmailAddress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Repeat e-mail address</td>
                <td>
                    <asp:TextBox ID="ConfirmEmailAddress" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Confirm the e-mail address" ControlToValidate="ConfirmEmailAddress">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="The e-mail addresses don't match" ControlToCompare="EmailAddress" ControlToValidate="ConfirmEmailAddress">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>Home phone number</td>
                <td>
                    <asp:TextBox ID="PhoneHome" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePhoneNumbers" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter your home or business phone number" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Business phone number</td>
                <td>
                    <asp:TextBox ID="PhoneBusiness" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="Comments" runat="server" Height="100px" TextMode="MultiLine" Width="250px" CssClass="auto-style5"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter a comment" ControlToValidate="Comments">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="SendButton" runat="server" Text="Send" OnClick="SendButton_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage" HeaderText="Please correct the following errors:" EnableClientScript="true" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>

        <asp:Label ID="Message" Text="Message Sent" runat="server" Visible="false" CssClass="Attention"/>
        <p runat="server" id="MessageSentPara" visible="false">Thank you for your message. We will get back to you as soon as possible.</p>
    
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        <div class="PleaseWait">
            Please Wait...
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>

<script>
    $(function () {
        $('form').bind('submit', function () {
            if (Page_IsValid) {
                $('#TableWrapper').hide();
            }
        });
    });

    function pageLoad() {
        $('.Attention').animate({ width: '600px' }, 3000).animate({ width: '100px' }, 3000).fadeOut('slow');
    }
</script>