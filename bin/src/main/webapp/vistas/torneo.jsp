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
					<br>
					
			         <table class="table table-hover">
			            <thead>
			            <tr>
			                
			                <th>Nombre Torneo</th>
			                <th>Fecha Inicio</th>
			                <th>Equipos Participantes</th>
			                <th>Acci�n</th>
			                
			            </tr>
			            </thead>
			            <c:forEach var="torneo" items="${torneos}">
			            <tr>
			                <td><c:out value="${torneo.nombreTorneo}"/></td>
			                <td><c:out value="${torneo.fechaInicio}"/></td> 
			                <td><c:out value="${torneo.numeroParticipantes}"/></td>
			                
			                <td> 
			           		   <form  class="form-horizontal" action="verTorneo" method = "get">
			                     <button class="btn btn-info" type="submit"><Span class = "glyphicon glyphicon-eye-open"></Span> Ver</button>
				                 <input type="hidden" name="idTorneo" value="${torneo.idTorneo}">
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