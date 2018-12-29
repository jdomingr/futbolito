<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/ionicons.min.css" rel="stylesheet">
		<link href="css/estilo.css" rel="stylesheet">
        <title>futbolito</title>
    </head>
    <body>
    	<div class="color-fondo-login">
		    <div class="imagen-fondo"></div>
		</div>
		<div  class="container-fluid">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4" id="login" >
				<center>
					<h3>Registrar Usuario</h3>
			        <br>
			        
			        <form class="form-horizontal span4 " action="ingresar" method = "POST" onSubmit="return enviar()" >
			            <div class="control-group">
			                <label class="control-label" >Nombre</label>
			                <div class="controls">
			                    <input class="form-control" type="text" name="nombre" required style="width: 300px"/>
			                </div>
			            </div>
			             <div class="control-group">
			                <label class="control-label" >Apellido</label>
			                <div class="controls">
			                    <input class="form-control" type="text" name="apellido" required style="width: 300px"/>
			
			                </div>
			            </div>
			            <div class="control-group">
			                <label class="control-label" >Email</label>
			                <div class="controls">
			                    <input class="form-control" type="email" name="email" required style="width: 300px"/>
			                </div>
			            </div>
			            <div class="control-group">
			                <label class="control-label" >Teléfono</label>
			                <div class="controls">
			                    <input class="form-control" type="tel" name="telefono" required style="width: 300px" maxlength="12"/>
			                </div>
			            </div>
			            <div class="control-group">
			                <label class="control-label" >Contraseña</label>
			                <div class="controls">
			                    <input class="form-control" type="password" name="pass" required style="width: 300px" maxlength="8"/>
			                </div>
			            </div>
			            <br>
			            <br>
			            <input class="btn btn-success" value="Registrar" type="submit">
			        </form>
			        <br>
			            <form action="volverlogin" method = "get" >
					 	<input class="btn btn-info" value="Volver" type="submit">
					 </form>
				</center>
	
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
			<script type="text/javascript"> 
			function enviar(){
				alert("Registro Exitoso");
				return true;
			}
	</script>
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    </body>
</html>
