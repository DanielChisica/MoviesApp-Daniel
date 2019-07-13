using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using DemoDatos.Modelo;
using System.IO;
using System.Reflection;

namespace DemoDatos
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static ControladorDAORecord controladorAccesoDatos;

        public static int numImages;
        public static List<string> listofpaths;
        public static List<string> listofimgs;
        public static PlaceHolder imgPlaceHolder1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack && !Page.IsCallback)
            {
                ConnectDB();
                string cadenaConexion = "";
                numImages = 0;
                listofpaths = new List<string>();
                listofimgs = new List<string>();
                imgPlaceHolder1 = new PlaceHolder();
                cadenaConexion = System.Configuration.ConfigurationManager.ConnectionStrings["MoviesConnectionString"].ConnectionString;
                System.Diagnostics.Debug.WriteLine("Estado cadena conexion: " + cadenaConexion);
                controladorAccesoDatos = new ControladorDAORecord(cadenaConexion);
                System.Diagnostics.Debug.WriteLine("**************************************");
                System.Diagnostics.Debug.WriteLine("Controlador de acceso datos ADO.NET: " + controladorAccesoDatos.ToString());
                System.Diagnostics.Debug.WriteLine("**************************************");
            }
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
                date = (Convert.ToDateTime(this.txtDate.Text)).Date;

                //System.Diagnostics.Debug.WriteLine("nombre de la persona: " + nombre);
                //System.Diagnostics.Debug.WriteLine("departamento seleccionado: " + idDepartamento);

                //2.  Llamar el modelo
                seInserto = controladorAccesoDatos.insertarRegistro(code, name,descript,date);

                //3.  Actualizamos la vista
                if (seInserto == true)
                {
                    DisplayMessage(this, "Película añadida");
                }
                else
                {
                    DisplayMessage(this, "No se pudo añadir la película");
                }

                //Limpiamos los controles
                this.Code.Text="";
                this.Name.Text="";
                this.Descrip.Text="";
                this.txtDate.Text = "";
            }

            catch (Exception errorBotonAceptar)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + errorBotonAceptar.Message);
            }
        }

        //[System.Web.Services.WebMethod]
        protected void btn_anadir_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("entro");
            
            var upload = new FileUpload { ID = "FileImgsave" + numImages };
            imgPlaceHolder1.Controls.Add(upload);
            this.imgPlaceHolder.Controls.Add(imgPlaceHolder1);
        }

        //[System.Web.Services.WebMethod]
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (numImages > 0)
            {
                string message = "";
                for (int i = 0; i < listofimgs.Count; i++)
                {
                    message = message + listofimgs[i] + "\n";
                }
                Label1.Text = message + Path.GetFileName(((FileUpload)(FindControl("FileUpload1"))).PostedFile.FileName);
            }
            
            FileUpload archivo = (FileUpload)(FindControl("FileUpload1"));
            string filename = Path.GetFileName(archivo.PostedFile.FileName);
            string ext = (Path.GetExtension(filename)).ToLower();
            string folder = Server.MapPath("~/pics/");
            Directory.CreateDirectory(folder);
            if (archivo.PostedFile != null)
            {
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".bmp")
                {
                    archivo.PostedFile.SaveAs(Path.Combine(folder, filename));
                    listofpaths.Add(Path.Combine(folder, filename));
                    listofimgs.Add(filename);
                    System.Diagnostics.Debug.WriteLine(Path.Combine(folder, filename));
                    if (numImages == 0)
                    {
                        Label1.Text = filename;
                    }
                    numImages = numImages + 1;
                }
            }
        }
    }
}