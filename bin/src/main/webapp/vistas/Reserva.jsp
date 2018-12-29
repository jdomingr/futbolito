<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.LinkedList"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link href="css/reserva.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

 <script src="js/jquery.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="js/datepicker.min.js"></script>
   <script>
   $(function() {
	    $( "#datepicker" ).datepicker({
	   	    	 inline: true,
	   	            firstDay: 1,
	   	            showOtherMonths: true,
	   	           dateFormat:"dd-mm-yy",
	   	            dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
	   	            altField: "#d"
	   	            
	   	    });
	    
	    $("#d").change(function(){
	    	
	    	$("#datepicker").datepicker('setDate',$(this).val());
	    });
	    
	  });
	</script>
<title>Equipos</title>
</head>
<body>
     
	
      <jsp:include page="headerUsuario.jsp" /> 
	
	<div id="todo"  align="center">
	<div id="Reserva" style="padding-top: 10px;">
	<a style="font-size: 20px; text-decoration: none; color: #00998c; font-weight: bolder; padding-top:10px;">Reservas de canchas</a>
	 <div id="PestaniasContenido" >
            <div >
                <p class="titulo" id="papa" style="width: 550px !important;"> Selecciona la fecha y la hora en que deseas reservar</p>
                <div class="dib fl" id="calendario">
                    <div class="db">
                        <div id="datepicker"></div>
                    </div>
                    <div class="db">

                    </div>
                    <div class="db">
                        <div class="tiporeserva" style="padding-left:7px;">
                            <div class="divtiporeserva disponible"></div>
                            <p class="txtdisponible" style="font-size: 12px !important;">Horario disponible</p>
                        </div>
                       
                        <div class="tiporeserva" style="padding-left:7px;">
                            <div class="divtiporeserva reservado"></div>
                            <p class="txtreservado" style="font-size: 12px !important;">Horario reservado</p>
                        </div>
                    </div>
                    <br><br><br>
                    <form action="ingresarReserva" method="post" id="frmDate" onSubmit="return enviar()">
                     <div class="db" style="margin-top: -8px;">
                        <p style="color: #00998c !important;">Seleccione la hora de reserva:
                        
                        <select  name="hora">
                              <c:forEach var="reserv" items="${misReservas}">
		            			
		                		<option value="${reserv.horaInicio}"><c:out value="${reserv.horaInicio}"/></option>
		                		
		                		
		          			</c:forEach>
                        </select>
                        
                        </p>
                    </div>
                    
                    <div>
                         <p style="color: #00998c !important;" >Seleccione la cancha:
                        
                        <select  name="cancha">
                              <c:forEach var="canch" items="${misCanchas}">
		            			
		                		<option value="${canch.idCancha}"><c:out value="${canch.numero}"/></option>
		                		
		                		
		          			</c:forEach>
                        </select>
                        
                        </p>
                    
                    
                    </div>
                    <div>
                       <input type="hidden"  id="d" name="fecha">
                    </div>
                    <div>
                        <input class="btn btn-info" value="Reservar" type="submit">
                    </div>
                   </form>
                 </div>
                 
                 
                 <div class="dib fl" id="tablacalendario">
                    <table class="reserva">
                        <thead>
                            <tr class="tituloTR">
                                <th style="color: #00998c !important;">HORA</th>
                                <th colspan="4" style="color: #00998c !important;">PRECIO</th>
                            </tr>
                            
                        </thead>
                        <tbody>
                            
                           <c:forEach var="reserv" items="${misReservas}">
		            			<tr>
		                		<td><c:out value="${reserv.horaInicio}"/></td>
		                		<td><c:out value="${reserv.precio}"/></td> 
		                		<td></td>
		               
		            			</tr>
		          			</c:forEach>
                        
                        </tbody>
                 </table>
               </div> 
          </div>
          
          
       </div>
     </div>   
	</div>
  </div>
  

	
	
    </body>
    
    <script type="text/javascript"> 
		function enviar(){
			alert("Reserva realizada exitosamente");
			return true;
		}
	</script>
    
</html>