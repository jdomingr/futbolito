package com.futbolito.Controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.futbolito.persistencia.RecintoDAO;

@Controller
public class RecintoControlador {
	
	@RequestMapping(value = "/seleccionarRecinto",method=RequestMethod.GET)
	public String verReserva(Model model) throws SQLException {
		
		RecintoDAO recinto = new RecintoDAO();
		System.out.println("************+Pase por recinto******");
		model.addAttribute("listaRecintos",recinto.readAll());
		return "vistas/buscarRecinto.jsp";
	} 

}
