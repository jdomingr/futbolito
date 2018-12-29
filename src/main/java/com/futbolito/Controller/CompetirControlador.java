package com.futbolito.Controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.futbolito.persistencia.CompetirDAO;
import com.futbolito.persistencia.EquipoDAO;
import com.futbolito.persistencia.JugadorDAO;
import com.futbolito.persistencia.TorneoDAO;
import com.futbolito.to.CompetirTO;
import com.futbolito.to.JugadorTO;

@Controller
public class CompetirControlador {
	
	
	@RequestMapping(value = "/agregarEquipo",method=RequestMethod.POST)
	public String agregarEquipoATorneo(@RequestParam(value="idtorneo") int idtorneo,Model model) throws SQLException {
		model.addAttribute("idTorneo", idtorneo);
		return "vistas/agregarEquipoAT.jsp";
	}
	
	@RequestMapping(value = "/agregarCompetir",method=RequestMethod.POST)
	public String agregarCompetir(@RequestParam(value="idtorneo")int idT, Model model
			,@RequestParam(value="equipo") int  idE) throws SQLException {
		
		CompetirDAO dao = new CompetirDAO();
		CompetirTO tic = new CompetirTO();
		tic.setIdTorneo(idT);
		tic.setIdEquipo(idE);
	    dao.insertarCompetir(tic);
	    TorneoDAO tor = new TorneoDAO();
	    tor.actualizarCantidadEquiposTorneo(idT);
	    
	    return "vistas/vistaNormal.jsp";
	}

}
