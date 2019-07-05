using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace DemoDatos
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectDB();
        }

        public void ConnectDB()
        {
            SqlConnection con = new SqlConnection(
                WebConfigurationManager.ConnectionStrings["MoviesConnectionString"].ConnectionString);
            con.Open();
            if(con.State == System.Data.ConnectionState.Open)
            {
                DisplayMessage(this, "Connection to the database succesful");
            }

            else
            {
                DisplayMessage(this, "Connection to the database unsuccesful");
            }
        }

        static public void DisplayMessage(Control page, string msg)
        {
            string myScript = string.Format("alert('{0}')", msg);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
        }
    }
}