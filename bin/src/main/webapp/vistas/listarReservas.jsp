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
<title>Reservas</title>
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
				<h1>Listado de reservas</h1>
		        <table class="table table-hover">
		            <thead>
		            <tr>
		                <th>Recinto</th>
		                <th>Direccion</th>
		                <th>N�mero de cancha</th>
		                <th>Fecha</th>
		                <th>Hora</th>
		                <th>Cancelar reserva</th>
		                
		                
		            </tr>
		            </thead>
		           <c:forEach var="reserv" items="${listaReservas}">
		            <tr>
		                <td><c:out value="${reserv.nombreRecinto}"/></td>
		                <td><c:out value="${reserv.direccion}"/></td> 
		                <td><c:out value="${reserv.numeroCancha}"/></td>
		                <td><c:out value="${reserv.fecha}"/></td>
		                <td><c:out value="${reserv.hora}"/></td>
		                <td>
		                  <form  class="form-horizontal span4 " action="cancelarReserva" method = "post" onSubmit="return enviar()">
		                     <button class="btn btn-danger" type="submit"><Span class = "glyphicon glyphicon-trash"></Span> Cancelar</button>
			                 <input type="hidden" name="idReserva" value="${reserv.idReserva}">
			               </form>
			            </td>
		                
		            </tr>
		          </c:forEach>     
		        </table>
			</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"> 
	function enviar(){
		//Ingresamos un mensaje a mostrar
		//var formulario = document.getElementById("myform");
		var mensaje = confirm("�Est� seguro?");
		//var dato = formulario[0];
		//Detectamos si el usuario acepto el mensaje
		if (mensaje) {	
		//formulario.submit();
		alert("Reserva cancelada");
		return true;
		}
		
		else {
			;
			return false;
		exit()
		}
		}
	</script>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
	
    </body>
    
</html>