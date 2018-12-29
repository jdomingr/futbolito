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
<title>Torneos</title>
</head>
<body>
	<div class="color-fondo-login">
	    <div class="imagen-fondo"></div>
	</div>
	 <jsp:include page="headerUsuario.jsp" /> 
	
	<div  class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="container contenedor">
					<h1>Torneos</h1>
					<table class="table table-hover">
			            <thead>
			            <tr>
			                <th>Nombre Torneo</th>
			                <th>Fecha Inicio</th>
			                <th>Número de Equipos participantes</th>
			                <th>Agregar Equipos</th>
			                
			            </tr>
			            </thead>
			           <c:forEach var="torneos" items="${listarMisTorneos}">
			            <tr>
			                <td><c:out value="${torneos.nombreTorneo}"/></td>
			                <td><c:out value="${torneos.fechaInicio}"/></td> 
			                <td><c:out value="${torneos.numeroParticipantes}"/></td> 
			                <td><form  class="form-horizontal span4 " action="agregarEquipo" method = "post">
			            	<input type="text"  size="1" id="id" name="idtorneo" value="${torneos.idTorneo}" required  style="visibility:hidden" />
			           			<button class="btn btn-success" type="submit"><Span class = "glyphicon glyphicon-plus"></span> Agregar Equipo</button>
			            		</form>
			            	</td>
				           
			            </tr>
			          </c:forEach>     
			        </table>
				</div>
			</div>
		</div>
	</div>
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    </body>
    
</html>