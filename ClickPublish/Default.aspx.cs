using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ClickPublish
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Combine fname & lname
            string fullName = TextBox1.Text + " "+ TextBox2.Text; 

            //Check if present in dictionary 
            var dataFile = Server.MapPath("~/App_Data/data.txt");
            string result;

            if (File.Exists(dataFile))
            {
                var userData = File.ReadAllLines(dataFile);
                if (userData == null)
                {
                    // Empty file.
                    result = "The file is empty.";
                }

                List<string> allUsers = userData.OfType<string>().ToList();
                if (!(allUsers.Contains(fullName)))
                {
                    var writeTe = "\n" + fullName;
                    File.AppendAllText(@dataFile, writeTe);
                    //Redirect to the voting page 
                    var myCookie = new HttpCookie("Authenticated");
                    myCookie.Value = "True";
                    myCookie.Expires = DateTime.Now.AddDays(1d);
                    Response.Cookies.Add(myCookie);

                    var newUrl = "~/Vote.aspx?" + "name=" + fullName;
                    Response.Redirect(newUrl);
                }
                else
                {
                    Response.Write("Fail");
                }

            }
            else
            {
                // File does not exist.
                result = "The file does not exist.";
            }

            //If yes, throw error. Else add in dictionary 

            

        }
    }
}