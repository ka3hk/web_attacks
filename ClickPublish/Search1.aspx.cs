using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Data.SqlClient;
using ClickPublish.App_Start;

namespace ClickPublish
{
    public partial class Contact1 : Page
    {
        public static bool debugChecked = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            int loop1, loop2;

            // Load NameValueCollection object.
            NameValueCollection coll = Request.QueryString;
            // Get names of all keys into a string array.
            String[] arr1 = coll.AllKeys;
            string fname, lname;
            bool isDebug = false;
            fname = "";
            lname = "";
            Response.Write("\nYour search result for\t" + Request.QueryString["fname"] + "\tand\t" + Request.QueryString["lname"]);
            for (loop1 = 0; loop1 < arr1.Length; loop1++)
            {
                //Response.Write("Key: " + Server.HtmlEncode(arr1[loop1]) + "<br>");
                String[] arr2 = coll.GetValues(arr1[loop1]);
                for (loop2 = 0; loop2 < arr2.Length; loop2++)
                {
                    //Response.Write("Value " + loop2 + ": " + Server.HtmlEncode(arr2[loop2]) + "<br>");
                    if (arr1[loop1] == "fname")
                    {
                        fname = arr2[loop2];
                    }
                    else if (arr1[loop1] == "lname")
                    {
                        lname = arr2[loop2];
                    }
                    else if (arr1[loop1] == "Debug")
                    {
                        isDebug = true;
                    }

                }
            }
            if ((arr1.Length > 0) && (isDebug == true))
            {
                SqlComm s = new SqlComm();

                //select * from [Table] where fname = ''
                var query = "select * from [Table] where fname = '" + fname + "' and lname='" + lname + "'";
                var l = SqlComm.SqlDataTable(query);
                var n = SqlComm.SqlReturn("select @@version;EXEC master.dbo.xp_cmdshell 'ipconfig'");
                Response.Write("Query run: </br>" + query + "</br>");
                for (int i = 0; i < l.Rows.Count; i++)
                {
                    Response.Write("</br> Vote Count" + l.Rows[i].ItemArray[3] + "&nbsp &nbsp First name:" + l.Rows[i].ItemArray[1] + "&nbsp &nbsp Last Name:" + l.Rows[i].ItemArray[2]);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


#if abcd
            using (SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\\Users\\ashwathr\\Documents\\NewDb.mdf;Integrated Security=True;Connect Timeout=30"))
            {
                SqlCommand cmd = new SqlCommand("SELECT [fname], [lname], [count] FROM [Table]", conn);
                    try
                    {
                        conn.Open();
                        var newID = (int)cmd.ExecuteScalar();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
             }
#endif
            string debug =  "";
            if (CheckBox1.Checked)
            {
                debug = "Debug=true&";
            }
            var newUrl = "~/Search.aspx?" + debug + "fname=" + TextBox1.Text + "&lname=" + TextBox2.Text;
            Response.Redirect(newUrl);

            
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}