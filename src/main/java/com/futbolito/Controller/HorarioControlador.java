package com.futbolito.Controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.futbolito.persistencia.CanchaDAO;
import com.futbolito.persistencia.HorarioDAO;

@Controller
public class HorarioControlador {
	
	@RequestMapping(value = "/realizarReserva",method=RequestMethod.POST)
	public String verReserva(@RequestParam(value="idRecinto")String idRecinto,Model model) throws SQLException {
		int id = Integer.parseInt(idRecinto);
		HorarioDAO horario = new HorarioDAO();
		System.out.println("************+Pase por aqui******");
		System.out.println(id);
		
		CanchaDAO cancha = new CanchaDAO();
		
		model.addAttribute("misCanchas",cancha.readAll(id));
		model.addAttribute("misReservas",horario.readAll(id));
		return "vistas/Reserva.jsp";
	} 

}
