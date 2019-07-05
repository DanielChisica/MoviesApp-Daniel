using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using DemoDatos.Modelo;

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

        private static ControladorDAORecord controladorAccesoDatos;

        static public void DisplayMessage(Control page, string msg)
        {
            string myScript = string.Format("alert('{0}')", msg);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
        }

        protected void btn_insert_Click(object sender, EventArgs e)
        {
            //Variables locales del método
            string code = "";
            string name = "";
            string descript = "";
            DateTime date = new DateTime();
            bool seInserto = false;

            try
            {
                //1.  Recuperamos la data de la vista
                code = this.Code.Text;
                name = this.Name.Text;
                descript = this.Descrip.Text;
                date =this.Date.SelectedDate;

                //System.Diagnostics.Debug.WriteLine("nombre de la persona: " + nombre);
                //System.Diagnostics.Debug.WriteLine("departamento seleccionado: " + idDepartamento);

                //2.  Llamar el modelo
                seInserto = controladorAccesoDatos.insertarRegistro(code, name,descript,date);

                //3.  Actualizamos la vista
                if (seInserto == true)
                {
                    
                }
                else
                {
                   
                }

                //Limpiamos los controles
                this.Code.Text="";
                this.Name.Text="";
                this.Descrip.Text="";
            }

            catch (Exception errorBotonAceptar)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + errorBotonAceptar.Message);
            }
        }
    }
}