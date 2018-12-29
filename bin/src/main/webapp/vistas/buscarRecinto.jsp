<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.LinkedList"%>
<%@ include file="/vistas/include.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/ionicons.min.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet">
<title>Recintos</title>
</head>
<body>
	<div class="color-fondo-login">
	    <div class="imagen-fondo"></div>
	</div>
	 <jsp:include page="headerUsuario.jsp" /> 
	 
	<div  class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="container contenedor" >
				<h1>Recintos</h1>
		        <table class="table table-hover">
		            <thead>
		            <tr>
		                <th>Nombre</th>
		                <th>Dirección</th>
		                
		                <th>Accion</th>
		                
		                
		            </tr>
		            </thead>
		           <c:forEach var="recintos" items="${listaRecintos}">
		            <tr>
		                <td><c:out value="${recintos.nombre}"/></td>
		                <td><c:out value="${recintos.direccion}"/></td> 
		             
		                <td>
		                <form  class="form-horizontal span4 " action="realizarReserva" method = "post">
		                <input type="text"  size="1" id="id" name="idRecinto" value="${recintos.idRecinto}" required="requerid"  style="visibility:hidden" />
		            <input class="btn btn-info" value="Reservar" type="submit">
			        </form>
			              
		                
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