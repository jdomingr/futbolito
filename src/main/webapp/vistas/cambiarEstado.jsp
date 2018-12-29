<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.LinkedList"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/ionicons.min.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet">
<title>Futbolito</title>
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
				<h2>Actualizar Estado</h2>
		<form class="form-horizontal span4 " action="actualizarEstado" method = "POST" onSubmit="return enviar()">
			             <div class="control-group">
			                <label class="control-label" >Seleccione Estado</label>
			                <div class="controls">
			                    <select class="form-control" name="state" required style="width: 300px">
			                      <option value=""></option> 
								  <option value="pendiente">Pendiente</option> 
								  <option value="realizado">Realizado</option>
								</select>
			                </div>
			            </div>
			            <br>
			            <br>
			            <button class="btn btn-warning" type="submit">Actualizar</button>
			            <input type="hidden" name="idSolicitud" value="${idSolicitud}" />
			        </form>
			        
			        <br>
			            <form action="verSolicitudes" method = "get" >
					 	<input class="btn btn-info" value="Volver" type="submit">
					 </form>
			        </center>
			        
		        
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	<script type="text/javascript"> 
	function enviar(){
		//Ingresamos un mensaje a mostrar
		
		var mensaje = confirm("¿Está seguro?");
		//var dato = formulario[0];
		//Detectamos si el usuario acepto el mensaje
		if (mensaje) {	
		//formulario.submit();
		alert("Estado Actualizado")
		return true;
		}		
		
		else {
			return false;
		exit()
		}
		}
	</script>
	
    <script src="js/jquery.js"></script>
	
    </body>
    
</html>