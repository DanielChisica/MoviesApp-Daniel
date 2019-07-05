<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DemoDatos.WebForm1" %>

<!DOCTYPE html>
<!doctype html>

<html lang="en">
    <head runat="server">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Movies app</title>
    </head>


    <body background=https://www.freepptbackgrounds.net/wp-content/uploads/2019/04/Funny-Movies-Backgrounds.jpg>
        <form id="form1" runat="server">
            
        <div>
        </div>
        <div class="container separador">
            <div class="row justify-content-center bg">
                <div class="card" style="width: 500px;">
                    <div class="card-body">
                        <img src="https://image.freepik.com/free-vector/cinema-logo_23-2147503279.jpg?1" class="img-fluid" alt="Responsive image">                        
                        <center>
                        <h5 class="card-title">Registro de películas</h5>
                        </center>

                        <div >
                            <div class="form-group" >
                            <label for="exampleInputEmail1">Código</label>
                            <asp:TextBox ID="Code" runat="server" class="form-control" maxlength="6" placeholder="" required="true"></asp:TextBox>
                            

                            <label for="exampleInputEmail1">Nombre</label>
                            <asp:TextBox ID="Name" runat="server" class="form-control" maxlength="20" placeholder="" required="true"></asp:TextBox>
                           

                            <label for="exampleInputEmail1">Descripción</label>
                            <asp:TextBox ID="Descrip" runat="server" class="form-control" maxlength="120" placeholder="" required="true"></asp:TextBox>
                   

                            <label for="exampleInputEmail1">Fecha de estreno</label>
                            <asp:Calendar ID="Date" runat="server"></asp:Calendar>
                                    <br>
                                    <br>
                                    <div class="form-label-group">
                                        <center>
                                        <button type="submit" class="btn btn-danger"  >Registrar</button>
                                         <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalRegister" >Insertar imagen</button>
                                        </center>
                                    </div>
                                <br>
                                <div class="form-label-group">
                                 <!--   <button type="submit" class="btn btn-danger" data-toggle="modal" data-target="#modalRegister" >Insertar imagen</button>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--Modal de registro-->
            <div class="modal fade" id="modalRegister" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-white bg-danger mb-3">
                            <h5 class="modal-title" id="exampleModalLabel">Registro</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="img-body">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Añadir</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>