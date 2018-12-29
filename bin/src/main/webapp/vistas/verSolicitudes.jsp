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
<link href="css/estiloAdmin.css" rel="stylesheet">
<title>Futbolito</title>
</head>
<body>
	<div class="color-fondo-login">
	    <div class="imagen-fondo"></div>
	</div>
	<jsp:include page="headerAdministrador.jsp" /> 
	<div  class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="container contenedor">
					<h2>Solicitudes Pendientes</h2>
			        <table class="table table-hover">
			            <thead>
			            <tr>
			                <th>Nombre Equipo</th>
			                <th>Acción</th>
			                <th>Descripción</th>
			                <th>Estado</th>
			                <th>Actualizar</th>
			            </tr>
			            </thead>
			            <c:forEach var="sol" items="${listarSolicitud}">
			            <tr>
			                <td><c:out value="${sol.nombre_equipo}"/></td>
			                <td><c:out value="${sol.accion}"/></td> 
			                <td><c:out value="${sol.descripcion}"/></td>
			                <td><c:out value="${sol.estado}"/></td>
			                <td>
			                <form  class="form-horizontal span4 " action="actualizarEstado" method = "post" onSubmit="return enviar()">
				                <input type="text"  size="1" id="id" name="idSolicitud" value="${sol.id_solicitud}" required="required"  style="visibility:hidden" />
				                <button class="btn btn-info" type="submit">Realizado</button>
				            </form>
				            </td>
			            </tr>
			          </c:forEach>     
			        </table>
		            <form action="volver2" method = "get" >
				 		<input class="btn btn-warning" value="Volver" type="submit">
					</form>
					<br/>
				</div>
			</div>
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