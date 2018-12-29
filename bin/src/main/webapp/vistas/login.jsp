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
			<div class="col-md-4" id="login" >
				<center>
					<h1>Futbolito</h1>
					<br/>
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
			            <div class="form-group">
			            	<input class="btn btn-success btn-lg" value="Ingresar" type="submit">
			            </div>
			        </form>
			        <div class="col-md-4"></div>
	    <div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 col-md-offset-4">
				<form action="registrarse" method="get">
		      		<input type="submit" class="btn btn-success btn-lg"  value="Registro"/>
		     	</form>	
	     	</div>
			<div class="col-md-4"></div>
 		</div>
				</center>

			</div>
			
		</div>
		
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>