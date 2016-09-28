using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;            //File class
using System.Net.Mail;

public partial class Controls_ContactForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!string.IsNullOrEmpty(PhoneHome.Text) || !string.IsNullOrEmpty(PhoneBusiness.Text))
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }

    protected void SendButton_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            string fileName = Server.MapPath("~/App_Data/ContactForm.txt");
            string mailBody = File.ReadAllText(fileName);

            mailBody = mailBody.Replace("##Name##", Name.Text);
            mailBody = mailBody.Replace("##Email##", EmailAddress.Text);
            mailBody = mailBody.Replace("##HomePhone##", PhoneHome.Text);
            mailBody = mailBody.Replace("##BusinessPhone##", PhoneBusiness.Text);
            mailBody = mailBody.Replace("##Comments##", Comments.Text);

            MailMessage myMessage = new MailMessage();
            myMessage.Subject = "Response from " + PageDescription + ":";
            myMessage.Body = mailBody;

            myMessage.From = new MailAddress("sender@example.com", "Sender Name");
            myMessage.To.Add(new MailAddress("receiver@example.com", "Receiver Name"));
            myMessage.ReplyToList.Add(new MailAddress(EmailAddress.Text));

            SmtpClient mySmtpClient = new SmtpClient();
            mySmtpClient.Send(myMessage);

            Message.Visible = true;
            MessageSentPara.Visible = true;
            FormTable.Visible = false;

            System.Threading.Thread.Sleep(5000);
        }
    }

    public string PageDescription { get; set; }
}