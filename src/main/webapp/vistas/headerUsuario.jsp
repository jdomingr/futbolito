<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Futbolito</a>
	    </div>
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav navbar-right">
	      	 <li><a href="#" data-toggle="modal" data-target="#myModal">Solicitud</a></li>
	      	 <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Listar Equipo<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="listarequiposPropios">Mis Equipos</a></li>
	            <li><a href="listarequiposNormal">Todos</a></li>
	          </ul>
	        </li>
	        
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Reservas<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="seleccionarRecinto">Realizar reservas</a></li>
	            <li><a href="verReserva">Ver Reservas</a></li>
	          </ul>
	        
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Partidos<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	          </li> <li><a href="crearPartidos">Crear Partidos</a></li>
	            </li> <li><a href="listarPartidosPropios">Mis Partidos</a></li>
	            
	            
	            
	                      </ul>
	        </li>

	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Torneos<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#" data-toggle="modal" data-target="#myModal2">Crear Torneo</a></li>
	            <li><a href="verTorneos">Ver Torneos Creados</a></li>
	            <li><a href="torneo">Ver Todos</a></li>
	            
	            
	                      </ul>
	        </li>

	        <li><a href="index.jsp">Cerrar Sesión</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
</head>
