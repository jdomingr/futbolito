<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.futbolito.to.UsuarioTO"%>
    <%@page import="com.futbolito.persistencia.UsuarioDAO"%>
    <%@page import="org.springframework.ui.Model"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.util.LinkedList"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<div class="text-center">
					        <h2>Agregar Partido</h2>
					        <hr/>
					    </div>
				        <form class="form-horizontal" action="insertarPartidos" method = "POST" onSubmit="return enviarJugador()">
				            <div class="form-group">
				                <label class="col-sm-2 control-label" >fecha</label>
				                <div class="col-sm-10">
				                    <input class="form-control" type="date" name="fecha" step="1"  required>
				                </div>
				            </div>
				             <div class="form-group">
				                <label class="col-sm-2 control-label" >Equipo 1</label>
				                <div class="col-sm-10">
				                    <select  class="form-control" name=Equipo1 required>
 						 <option value="">Seleccione Equipo</option>  
				          <c:forEach var="equipos" items="${equipos}">
			            
			             
 								 <option value="${equipos.idEquipo}">${equipos.nombre}</option>
 								 
			          </c:forEach>
			          </select>  
				                </div>
				            </div>
				            <div class="form-group">
				                <label class="col-sm-2 control-label" >Equipo 2</label>
				                <div class="col-sm-10">
				                   
				         <select  class="form-control" name="Equipo2" required>
 						 <option value="">Seleccione Equipo</option>  
				          <c:forEach var="equipos" items="${equipos}">
			            
			             
 								 <option value="${equipos.idEquipo}">${equipos.nombre}</option>
 								 
			          </c:forEach>
			          </select>  
				                </div>
				            </div>
				            <div class="form-group">
				                <label class="col-sm-2 control-label" >Cancha</label>
				                <div class="col-sm-10">
				                    <input class="form-control" type="text" name="Cancha" required/>
				                </div>
				            </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label" >Torneo</label>
				                <div class="col-sm-10">
				                    <select  class="form-control" name="Torneo" required>
 						 <option value="">Seleccione El Torneo</option>  
				          <c:forEach var="torneo" items="${torneos}">
 								 <option value="${torneo.idTorneo}">${torneo.nombreTorneo}</option>
 								 
			          </c:forEach>
			          </select> 
				                </div>
				            </div>
				            <input id="ingresarSesion" class="btn btn-warning btn-lg btn-block" value="Agregar" type="submit" />
				        </form>
				        <form action="insertarPartido" method = "get" >
						 	<input class="btn btn-info btn-lg btn-block" value="Volver" type="submit">
						</form>
						<br/>
					</div>
					<div class="col-md-4"></div>
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
				<center>
					<h3>Agregar Jugador</h3>
			       
			        <form class="form-horizontal span4 " action="agregarJugadores" method = "POST" onSubmit="return enviar()">
			            <div class="control-group">
			                <label class="control-label" >Nombre Jugador</label>
			                <div class="controls">
			                    <input class="form-control" type="text" name="nombreJugador" required style="width: 300px"/>
			                </div>
			            </div>
			             <div class="control-group">
			                <label class="control-label" >Apellido Jugador</label>
			                <div class="controls">
			                    <input class="form-control" type="text" name="apellidoJugador" required style="width: 300px"/>
			                </div>
			            </div>
			            <br>
			            <br>
			            <input type="hidden" name ="idequipo" value="${idEquipo}"/>
			            <input class="btn btn-warning" value="Agregar" type="submit" />
			            </form>
			            <br>
			            <form action="listarequiposPropios" method = "post" >
					 	<input class="btn btn-info" value="Volver" type="submit">
					 </form>
			        
				</center>

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
	function enviarJugador(){
		alert("Partido Agregado con éxito");
		return true;
	}
	</script>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    </body>
</html>