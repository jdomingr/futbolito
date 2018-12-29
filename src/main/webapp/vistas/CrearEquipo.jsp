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
		<link href="css/estiloAdmin.css" rel="stylesheet">
        <title>futbolito</title>
    </head>
    <body>
    	<div class="color-fondo-login">
	    	<div class="imagen-fondo"></div>
		</div>
	   <!--Header_section-->
       <jsp:include page="headerAdministrador.jsp" /> 
       
       <div  class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="container contenedor">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="text-center">
						        <h3>Crear Equipo</h3>
						        <hr/>
						    </div>
					        <br>
					        <form class="form-horizontal" action="crear" method = "POST" onSubmit="return enviar()">
					            <div class="form-group">
					                <label class="col-sm-3 control-label" >Nombre Equipo</label>
					                <div class="col-sm-9">
					                    <input class="form-control" type="text" name="nombreEquipo" required/>
					                </div>
					            </div>
					             <div class="form-group">
					                <label class="col-sm-3 control-label" >Número de Partidos</label>
					                <div class="col-sm-9">
					                    <input class="form-control" type="number" name="numPartidos" required/>
					                </div>
					            </div>
					            <div class="form-group">
					                <label class="col-sm-3 control-label" >Número de Jugadores</label>
					                <div class="col-sm-9">
					                    <input class="form-control" type="number" name="numJugadores" required/>
					                </div>
					            </div>
					            <div class="form-group">
					                <label class="col-sm-3 control-label" >Usuario</label>
					                <div class="col-sm-9">
						                <select class="form-control" name="usuario">
							                <option value="">Usuario a Cargo</option> 
											<%
							                     UsuarioDAO user = new UsuarioDAO();
											     LinkedList<UsuarioTO> userto = new LinkedList<>();
											     userto = user.listarNombresUsuarios();
											     if(userto != null){
										                for (int i = 0; i < userto.size(); i++) {
										                    UsuarioTO usuario = userto.get(i);
							                %>
							            	<option value="<%=usuario.getId()%>"><%=usuario.getNombre()+" "+usuario.getApellido()%></option>
						                 <%}} %>
						                 </select>
					                </div>
					            </div>
					            <input id="ingresarSesion" class="btn btn-warning btn-lg btn-block" value="Crear Equipo" type="submit">
					        </form>
					         <form action="volver2" method = "get" >
							 	<input class="btn btn-info btn-lg btn-block" value="Volver" type="submit">
							 </form>
							 <br/>
						</div>
						<div class="col-md-3"></div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript"> 
			function enviar(){
				alert("Equipo Creado");
				return true;
			}
		</script>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    </body>
</html>