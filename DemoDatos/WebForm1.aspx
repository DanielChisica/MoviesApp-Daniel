<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DemoDatos.WebForm1" %>

<!DOCTYPE html>
<!doctype html>

<html lang="en">
    <head runat="server">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <title>Movies app</title>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#txtDate").datepicker({
                    appendText: 'mm/dd/aaaa',
                    showOn: 'both',
                    buttonText: 'Calendario',
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true,
                    minDate: new Date(1888,10,14)
                });

                $("#modalRegister").modal("show");
            });
        </script>
    </head>


    <body background="../imagenes/Funny-Movies-Backgrounds.jpg">
    <form id="form1" runat="server" visible="True">
    <div class="container separador" runat="server">
            <div class="row justify-content-center bg" runat="server">
                <div class="card" runat="server" style="width: 500px;">
                    <div class="card-body" runat="server">
                        <img src="https://image.freepik.com/free-vector/cinema-logo_23-2147503279.jpg?1" class="img-fluid" alt="Responsive image">                        
                        <center>
                        <h5 class="card-title">Registro de películas</h5>
                        </center>

                        <div runat="server">
                            <div class="form-group" runat="server">
                            <label for="exampleInputEmail1">Código</label>
                            <asp:TextBox ID="Code" runat="server" class="form-control" maxlength="6" placeholder="" required="true"></asp:TextBox>
                            

                            <label for="exampleInputEmail1">Nombre</label>
                            <asp:TextBox ID="Name" runat="server" class="form-control" maxlength="20" placeholder="" required="true"></asp:TextBox>
                           

                            <label for="exampleInputEmail1">Descripción</label>
                            <asp:TextBox ID="Descrip" runat="server" class="form-control" maxlength="120" placeholder="" required="true"></asp:TextBox>
                   

                            <label for="exampleInputEmail1">Fecha de estreno</label>
                            <br>
                            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                                    <br>
                                    <br>
                                    <div class="form-label-group" runat="server">
                                        <center>
                                        <asp:Button ID="btn_Insert" class="btn btn-danger" runat="server" Text="Registrar" OnClick="btn_insert_Click"/>
                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalRegister" >Insertar imagen</button>
                                        </center>
                                    </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--Modal de registro-->
        <div class="modal fade" id="modalRegister" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
                <div class="modal-dialog" role="document" runat="server">
                    <div class="modal-content" runat="server">
                        <div class="modal-header text-white bg-danger mb-3" runat="server">
                            <h5 class="modal-title" id="exampleModalLabel">Registro de Imágenes</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <asp:Label ID="Label1" class="label label-success" runat="server"></asp:Label>
                        <asp:PlaceHolder ID="imgPlaceHolder" runat="server"><asp:FileUpload ID="FileUpload1" runat="server" /></asp:PlaceHolder>
                        <div class="modal-footer" runat="server">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <asp:Button ID="anadir" class="btn btn-danger" runat="server" Text="Añadir" OnClick="btn_anadir_Click"/>
                            <asp:Button ID="save" class="btn btn-danger" runat="server" Text="Guardar"  OnClick="btn_save_Click"/>
                            <!--<button type="button" id="anadir" class="btn btn-danger">Añadir otra</button>-->
                            <!--<button type="button" id="save" class="btn btn-danger">Guardar</button>-->
                        </div>
                    </div>
                </div>
            </div>
    </form>        
    </body>
</html>