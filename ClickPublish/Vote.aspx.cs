using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;

namespace ClickPublish
{
    public partial class _Default : Page
    {
        public static string searchUrl = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("Page Load");
            bool val = false;
            
            if (Request.Cookies["Authenticated"] != null)
            {
                if (Request.Cookies["Authenticated"].Value == "True")
                {
                    val = true;
                }
            }

            if (searchUrl != null)
            {
                //Response.Redirect(searchUrl);
                searchUrl = null;
            }

            if (!val)
            {
                var newUrl = "~/Error.aspx";
                Response.Redirect(newUrl);
            }
        }

        protected override void SavePageStateToPersistenceMedium(object state)
        {
            //base.SavePageStateToPersistenceMedium(state);
        }

        protected override object LoadPageStateFromPersistenceMedium()
        {
            return null; //return base.LoadPageStateFromPersistenceMedium();
        }

        protected override object SaveViewState()
        {
            return null;// base.SaveViewState();
        }

        [ValidateInput(false)]
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            //Change the cookie 
            /*
            var myCookie = new HttpCookie("Authenticated");
            myCookie.Value = "False";
            myCookie.Expires = DateTime.Now.AddDays(1d);
            Response.Cookies.Add(myCookie);
            */
            Response.Cookies["Authenticated"].Value = "False";
            //Redirect to the search page
            TextBox tx1 = (TextBox)FormView1.FindControl("fnameTextBox");
            TextBox tx2 = (TextBox)FormView1.FindControl("lnameTextBox");
            

            searchUrl = "~/Search.aspx?" + "fname=" + tx1.Text + "&lname=" + tx2.Text;

            //Response.Redirect(searchUrl);
        }

        protected void Cancel_Button_Click(object sender, EventArgs e)
        {
            //Redirect to the hall of fame page
            var newUrl = "~/HallofFame.aspx";
            Response.Redirect(newUrl);
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {

        }
    }


}