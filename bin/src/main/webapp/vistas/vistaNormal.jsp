<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	 <jsp:include page="headerUsuario.jsp" /> 
	<div  class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="container contenedor">

					<h1>Bienvenido ${user.nombre}!!</h1>

				</div>

			<!--  <div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4" id="login" >
				
				<center>
					<h1>Vista Usuario</h1>
					<br>
				    <form class="form-horizontal span4 " action="listarequiposNormal" method = "POST" >
			            <input class="btn btn-info" value="Listar Todos los Equipos" type="submit">
			        </form>
				</center>
				<br>
				<center>
				    <form class="form-horizontal span4 " action="listarequiposPropios" method = "POST" >
			            <input class="btn btn-info" value="Listar Mis Equipos" type="submit">
			        </form>
				</center>
			
			<br>
				<center>
					
				    <form class="form-horizontal span4 " action="solicitud" method = "POST" >
				   
			            <input class="btn btn-info" value="Solicitud de Manejo de Mis Equipos" type="submit">
			        </form>
				</center>
					<br>
				<center>
					
				    <form class="form-horizontal span4 " action="seleccionarRecinto" method = "POST" >
				   
			            <input class="btn btn-info" value="Realizar reserva" type="submit">
			        </form>
				</center>
				
					<br>
				<center>
					
				    <form class="form-horizontal span4 " action="verReserva" method = "POST" >
				   
			            <input class="btn btn-info" value="Ver reservas" type="submit">
			        </form>
				</center>
				<br>
				<center>
					
				    <form class="form-horizontal span4 " action="contenidoLogin" method = "get" >
				   
			            <input class="btn btn-danger" value="Salir" type="submit">
			        </form>
				</center>
						
			</div>
		</div>
		-->
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
	<!-- Modal Crear torneo-->
	<div id="myModal2" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h2>Crear Torneo</h2>
	      </div>
	      <div class="modal-body">
	      	<form class="form-horizontal" action="crearTorneo" method = "POST" onSubmit="return enviar()">
	      	     <div class="form-group">
	                <label class="col-sm-3 control-label" >Nombre Torneo</label>
	                <div class="col-sm-9">
	                    <input class="form-control" type="text" name="nomTorneo" required/>
	                </div>
	             </div>
	             <div class="form-group">
	                <label class="col-sm-3 control-label" >Fecha de Inicio</label>
	                <div class="col-sm-9">
	                    <input class="form-control" type="date" name="finicio" required/>
	                </div>
	             </div>
	             <div class="form-group">
	                <label class="col-sm-3 control-label" >Número de Participantes</label>
	                <div class="col-sm-9">
	                    <input class="form-control" type="number" name="numParticipantes" required/>
	                </div>
	             </div>
	            <button  id="ingresarSesion" class="btn btn-md btn-success btn-block btn-lg" type="submit">Crear</button>
	        </form>
	      
	        <button type="button" class="btn btn-md btn-danger btn-block btn-lg" data-dismiss="modal">Cerrar</button>
	      </div>
	    </div>
	
	  </div>
	</div>
	<script type="text/javascript"> 
		function enviar(){
			alert("Realizado Exitosamente");
			return true;
		}
	</script>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>