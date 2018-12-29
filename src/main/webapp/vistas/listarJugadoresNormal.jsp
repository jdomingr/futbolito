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
<title>futbolito</title>
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
					<h1>Jugadores</h1>
			        <table class="table table-hover">
			            <thead>
			            <tr>
			                <th>Nombre</th>
			                <th>Apellido</th>     
			             </tr>
			            </thead>
			           <c:forEach var="jugador" items="${listarJugadoresdeEquipo}">
			            <tr>
			                <td><c:out value="${jugadores.nombre}"/></td>
			                <td><c:out value="${jugadores.apellido}"/></td> 
			            </tr>
			          </c:forEach>     
			        </table>
			        <br>   
			        <c:if test = "${usuario.idRol!=1}">
			            <form action="listarequiposNormal" method = "post" >
						 	<input class="btn btn-info" value="Volver" type="submit">
						</form>
	        		</c:if>
	        		<c:if test = "${usuario.idRol==1}">
		        		<form action="listarequipos" method = "post" >
					 		<input class="btn btn-info" value="Volver" type="submit">
					 	</form>
        			</c:if>
        			<br/>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Solicitud de Manejo de Equipo-->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h2>Solicitud de Manejo de Equipo</h2>
	      </div>
	      <div class="modal-body">
	      	<form class="form-horizontal" action="CrearSolicitud" method = "POST" onSubmit="return enviar()">
	             <div class="form-group">
	                <label class="col-sm-3 control-label" >Nombre de su Equipo</label>
	                <div class="col-sm-9">
	                    <input class="form-control" type="text" name="nombreEquipo" required/>
	                </div>
	             </div>
	             <div class="form-group">
	                <label class="col-sm-3 control-label" >Acción</label>
	                <div class="col-sm-9">
	                    <select class="form-control" name="accion" required>
	                      <option value=" "></option>
						  <option value="Crear">Crear</option> 
						  <option value="Eliminar">Eliminar</option>
						  <option value="Modificar">Modificar</option>
						</select>
	                </div>
	            </div>
	             <div class="form-group">
	                <label class="col-sm-3 control-label" >Descripción (Solo si es Modificación)</label>
	                <div class="col-sm-9">
	                    <textarea rows="4" cols="50" name="descripcion">
	                    
	                    </textarea>
	                </div>
	            </div>
	            <button  id="ingresarSesion" class="btn btn-md btn-success btn-block btn-lg" type="submit"><Span class = "glyphicon glyphicon-envelope"></span> Enviar</button>
	        </form>
	      
	        <button type="button" class="btn btn-md btn-danger btn-block btn-lg" data-dismiss="modal">Cerrar</button>
	      </div>
	    </div>
	
	  </div>
	</div>
	<!--   
	<div  class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4" id="login" >
				<h1>Jugadores</h1>
		        <table class="table table-bordered">
		            <thead>
		            <tr>
		                <th>Nombre</th>
		                <th>Apellido</th>     
		                </tr>
		            </thead>
		           <c:forEach var="jugadores" items="${listarJugadoresdeEquipo}">
		            <tr>
		                <td><c:out value="${jugadores.nombre}"/></td>
		                <td><c:out value="${jugadores.apellido}"/></td> 
		                            </tr>
		          </c:forEach>     
		        </table>
		        <br>   <c:if test = "${usuario.idRol!=1}">
		         <form action="listarequiposNormal" method = "post" >
					 	<input class="btn btn-info" value="Volver" type="submit">
					 </form>
		        		</c:if>
		        		<c:if test = "${usuario.idRol==1}">
		        		<form action="listarequipos" method = "post" >
					 	<input class="btn btn-info" value="VolverALFuturo" type="submit">
					 </form>
		        		</c:if>
			           
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	-->
	
	<script type="text/javascript"> 
		function enviar(){
			alert("Usted a Enviado una Solicitud");
			return true;
		}
	</script>
	<script type="text/javascript"> 
	function enviar2(){
		//Ingresamos un mensaje a mostrar
		//var formulario = document.getElementById("myform");
		var mensaje = confirm("¿Está seguro de eliminar a este jugador?");
		//var dato = formulario[0];
		//Detectamos si el usuario acepto el mensaje
		if (mensaje) {	
		//formulario.submit();
		alert("Jugador eliminado con éxito");
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