package com.futbolito.Controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.futbolito.persistencia.CanchaDAO;
import com.futbolito.persistencia.HorarioDAO;
import com.futbolito.persistencia.PruebaDAO;
import com.futbolito.persistencia.ReservaDAO;
import com.futbolito.persistencia.UsuarioDAO;
import com.futbolito.to.CanchaTO;
import com.futbolito.to.HorarioTO;
import com.futbolito.to.ReservaTO;
import com.futbolito.to.UsuarioTO;
import com.futbolito.to.verificarTO;

@Controller
@SessionAttributes("user")
public class ReservaControlador {
	
	@RequestMapping(value = "/ingresarReserva",method=RequestMethod.POST)
	public String insertarReserva(@RequestParam(value="hora")String hora,Model model,
			@RequestParam(value="fecha")String fecha,
			@RequestParam(value="cancha")String nCancha,
			ModelMap modelSesion,@ModelAttribute("user") UsuarioTO usuario) throws SQLException, ParseException {
		
		modelSesion.addAttribute("idUsuario", usuario.getId());
		int idCancha = Integer.parseInt(nCancha);
		System.out.println("*****Pase por Reserva***");
		System.out.println(hora);
		System.out.println(fecha);
		System.out.println(idCancha);
		System.out.println(usuario.getId());
		
		SimpleDateFormat formatear = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date = formatear.parse(fecha);
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());  
        
        
		CanchaDAO cancha = new CanchaDAO();
		ReservaDAO reserva = new ReservaDAO();
		CanchaTO can = new CanchaTO();
		ReservaTO reserv = new ReservaTO();
		PruebaDAO reservadas = new PruebaDAO();
		verificarTO ve = new verificarTO();
		can.setEstado("Reservada");
		can.setIdCancha(idCancha);
		cancha.actualizarEstadoCancha(can);
		int i;
		
		reserv.setFecha(sqlDate);
		reserv.setHora(hora);
		int idHora = Integer.parseInt(hora);
		reserv.setIdHorario(idHora);
		reserv.setIdUsuario(usuario.getId());
	    reserva.insertarReserva(reserv);
	    model.addAttribute("listaReservas",reservadas.readAll(usuario.getId())); 
        
		return "vistas/listarReservas.jsp";
	} 
	
	
	@RequestMapping(value = "/verReserva",method=RequestMethod.GET)
	public String verReservaUsuario(Model model,
			ModelMap modelSesion,@ModelAttribute("user") UsuarioTO usuario) throws SQLException  {
		
		modelSesion.addAttribute("idUsuario", usuario.getId());
		PruebaDAO reserva = new PruebaDAO();
		model.addAttribute("listaReservas",reserva.readAll(usuario.getId()));		
        return "vistas/listarReservas.jsp";
	} 
	
	@RequestMapping(value = "/cancelarReserva",method=RequestMethod.POST)
	public String eliminarReserva(Model model,
			ModelMap modelSesion,@ModelAttribute("user") UsuarioTO usuario,
			@RequestParam(value="idReserva") int idReserva) throws SQLException  {
		
		modelSesion.addAttribute("idUsuario", usuario.getId());
		
		ReservaDAO reserva = new ReservaDAO();
		reserva.cancelarReserva(idReserva);
		System.out.println(idReserva);
		PruebaDAO listaReserva = new PruebaDAO();
		model.addAttribute("listaReservas",listaReserva.readAll(usuario.getId()));		
        return "vistas/listarReservas.jsp";
	} 
	
	
	

}
