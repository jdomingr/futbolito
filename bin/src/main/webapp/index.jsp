<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/ionicons.min.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Futbolito</title>
</head>
<body>
	<div class="color-fondo-login">
	    <div class="imagen-fondo"></div>
	</div>
		<!-- titulo -->
	<div  class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div id="autenticacion" class="col-md-4">
			    <div class="text-center">
			        <h2 id="tituloLogin">Futbolito</h2>
			        <hr>
			    </div>
		        <form class="form-horizontal " action="login" method = "POST" >
		            <div class="form-group">
		                <div class="input-group">
		                    <div class="input-group-addon"><i class="ion-android-person"></i></div>
		                    <input type="email" class="form-control input-lg" placeholder="Email" name="usuario" required autofocus>
		                </div>
		            </div>
		            <div class="form-group">
		                <div class="input-group">
		                    <div class="input-group-addon"><i class="ion-android-lock"></i></div>
		                    <input type="password" class="form-control input-lg" placeholder="Contraseña" name="password" required autofocus>
		                </div>
		            </div>
		            <h4>${mensaje}</h4>
		            <br>
		            <input class="btn btn-md btn-success btn-block btn-lg" value="Ingresar" type="submit" id="ingresarSesion">
		            
		        </form> 
		        <!-- 
				<form action="registrarse" method="get">
		      		<input type="submit" class="btn btn-md btn-success btn-block btn-lg"  value="Registro"/>
		     	</form>
		     	 -->	
		     	<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-md btn-danger btn-block btn-lg" data-toggle="modal" data-target="#myModal">Registro</button>

			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h3 class="modal-title">Registro</h3>
	      </div>
	      <div class="modal-body">
	      	<form class="form-horizontal" action="ingresar" method = "POST" onSubmit="return enviar()" >
	            <div class="form-group">
	                <label class="col-sm-2 control-label" >Nombre</label>
	                <div class="col-sm-10">
	                    <input class="form-control" type="text" name="nombre" required/>
	                </div>
	            </div>
	             <div class="form-group">
	                <label class="col-sm-2 control-label" >Apellido</label>
	                <div class="col-sm-10">
	                    <input class="form-control" type="text" name="apellido" required/>
	
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label" >Email</label>
	                <div class="col-sm-10">
	                    <input class="form-control" type="email" name="email" required/>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label" >Teléfono</label>
	                <div class="col-sm-10">
	                    <input class="form-control" type="tel" name="telefono" required maxlength="12"/>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label" >Contraseña</label>
	                <div class="col-sm-10">
	                    <input class="form-control" type="password" name="pass" required maxlength="8"/>
	                </div>
	            </div>
	            <input id="ingresarSesion" class="btn btn-md btn-success btn-block btn-lg" value="Registrar" type="submit">
	        </form>
	        <button type="button" class="btn btn-md btn-danger btn-block btn-lg" data-dismiss="modal">Cerrar</button>
	      </div>
	    </div>
	
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