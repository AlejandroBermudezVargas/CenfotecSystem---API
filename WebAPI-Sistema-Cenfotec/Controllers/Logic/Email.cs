using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using WebAPI_Sistema_Cenfotec.Models;

namespace WebAPI_Sistema_Cenfotec.Controllers.Logic
{
    public class Email
    {
        private static MailMessage mail = new MailMessage();
        private static SmtpClient smtp = new SmtpClient();
        private static Email email;

        private Email() { }

        public static Email getInstance()
        {
            if (email == null) return new Email();
            return email;
        }

        public bool send(List<usuario> users, evaluacione evaluacion)
        {
            string from = System.Configuration.ConfigurationManager.AppSettings["email"];
            string password = System.Configuration.ConfigurationManager.AppSettings["password"];
            try
            {
                
                mail.To.Add(new MailAddress("alebv10@hotmail.com"));
                mail.Body = "<h4>Buenas puedes ingresar a realizar la evaluacion de "+evaluacion.+"</h4>";
                mail.Subject ="Evaluacion ";
                mail.From = new MailAddress(from);
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(from, password);
                mail.IsBodyHtml = true;
                smtp.Send(mail);

                //foreach (var user in users)
                //{
                
                
                
                
                //}
                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }
    }
}