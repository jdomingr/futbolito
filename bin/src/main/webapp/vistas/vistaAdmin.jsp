<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
					<h3>Administrador</h3>
					 <br>
					 <form action="crearequipo" method = "get" >
					     <input class="btn btn-info" value="Nuevo Equipo" type="submit">
					 </form>
					 <form action="listarequipos" method = "get" >
					 	<input class="btn btn-info" value="Listar Equipo" type="submit">
					 </form>
					 
			</center>

			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
 	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>