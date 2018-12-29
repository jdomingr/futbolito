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
					        <h2>Agregar Resultados</h2>
					        <hr/>
					    </div>
				        <form class="form-horizontal" action="agregaResultados" method = "POST" onSubmit="return enviarJugador()">
				            <div class="form-group">
				                <label class="col-sm-2 control-label" >Hora de Inicio</label>
				                <div class="col-sm-10">
				                    <input class="form-control" type="time" name="horaI" value="00:00:00" max="24" step="2" required>
				            </div>
				            </div>
				             <div class="form-group">
				                <label class="col-sm-2 control-label" >Hora de termino</label>
				                <div class="col-sm-10">
				                    <input class="form-control" type="time" name="horaT" value="11:45:00" max="22:30:00" min="10:00:00" step="1" required>
				                </div>
				            </div>
				         
				            <div class="form-group">
				                <label class="col-sm-2 control-label" >Estado</label>
				                <div class="col-sm-10">
				                    <input class="form-control" type="text" name="Estado" required/>
				                </div>
				            </div>
				             <div class="form-group">
				                <label class="col-sm-2 control-label" >Goles de ${requestScope.Equipo1}</label>
				                <div class="col-sm-10">
				                    <input class="form-control" type="number" name="goles1" required/>
				                </div>
				            </div>
				             <div class="form-group">
				                <label class="col-sm-2 control-label" >Goles de ${requestScope.Equipo2}</label>
				                <div class="col-sm-10">
				                    <input class="form-control" type="number" name="goles2" required/>
				                </div>
				            </div>
				            
				            </div>
				            <input type="hidden" name ="idepartido" value="${requestScope.idPartido}"/>
				            <input id="ingresarSesion" class="btn btn-warning btn-lg btn-block" value="Agregar Resultados" type="submit" />
				        </form>
				        <form action="listarPartidosPropios" method = "get" >
						 	<input class="btn btn-info btn-lg btn-block" value="Volver" type="submit">
						</form>
						<br/>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
	
	 <script type="text/javascript"> 
		function enviar(){
			alert("Usted a Enviado una Solicitud");
			return true;
		}
	</script>
	<script type="text/javascript"> 
	function enviarJugador(){
		alert("Jugador Agregado con éxito");
		return true;
	}
	</script>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    </body>
</html>