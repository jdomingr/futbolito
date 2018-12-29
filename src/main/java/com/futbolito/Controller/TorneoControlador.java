package com.futbolito.Controller;

import java.sql.Date;
import java.sql.SQLException;
import java.util.LinkedList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.futbolito.persistencia.EquipoDAO;
import com.futbolito.persistencia.PartidoDAO;
import com.futbolito.persistencia.TorneoDAO;
import com.futbolito.to.EquipoTO;
import com.futbolito.to.PartidoTO;
import com.futbolito.to.TorneoTO;
import com.futbolito.to.UsuarioTO;



@Controller
@SessionAttributes("user")
public class TorneoControlador {
	
	
	@RequestMapping(value = "/torneo",method=RequestMethod.GET)
	public String torneo(Model model) throws SQLException {
		TorneoDAO torneo = new TorneoDAO();
		model.addAttribute("torneos",torneo.readAll());
		return "vistas/torneo.jsp";
	}
	@RequestMapping(value = "/verTorneo",method=RequestMethod.GET)
	public String verTorneo(Model model,@RequestParam(value="idTorneo")int idTorneo) throws SQLException {
		
		EquipoDAO equipo = new EquipoDAO();
		PartidoDAO partido = new PartidoDAO();
		TorneoDAO torneo = new TorneoDAO();
		LinkedList<EquipoTO> equipos = equipo.buscarParticipacionTorneo(idTorneo);
		LinkedList<PartidoTO> partidos = partido.readPartidoTorneo(idTorneo);
		int matriz[][]= new int[equipos.size()][5];
		String matriz2[][] = new String[equipos.size()][6];
		int limite = equipos.size();
		for(int i=0; i < limite;i++) {
			matriz[i][0] = equipos.get(i).getIdEquipo();
		}
		
		limite= partidos.size();
		
		for(int i=0; i < limite;i++) {
			for(int j=0;j<equipos.size();j++) {
				if(partidos.get(i).getIdEquipo1() == matriz[j][0]) {
					matriz[j][1]+=partidos.get(i).getGolesEquipo1();
					matriz[j][2]+=partidos.get(i).getGolesEquipo2();
				}
				if(partidos.get(i).getIdEquipo2() == matriz[j][0]) {
					matriz[j][1]+=partidos.get(i).getGolesEquipo2();
					matriz[j][2]+=partidos.get(i).getGolesEquipo1();
				}
			}
			//equipo 1 gana
			if(partidos.get(i).getGolesEquipo1() > partidos.get(i).getGolesEquipo2()) {
				for(int j=0;j<equipos.size();j++) {
					if(partidos.get(i).getIdEquipo1() == matriz[j][0]) {
						matriz[j][4]+=3; 
					}
				}
			}else {
				//equipo dos gana
				if(partidos.get(i).getGolesEquipo1() < partidos.get(i).getGolesEquipo2()) {
					for(int j=0;j<equipos.size();j++) {
						if(partidos.get(i).getIdEquipo2() == matriz[j][0]) {
							matriz[j][4]+=3; 
						}
					}
				}else {
					//empate
					for(int j=0;j<equipos.size();j++) {
						if(partidos.get(i).getIdEquipo1() == matriz[j][0]) {
							matriz[j][4]+=1; 
						}
						if(partidos.get(i).getIdEquipo2() == matriz[j][0]) {
							matriz[j][4]+=1; 
						}
					}
					
				}
			}
		}
		for(int i=0;i<matriz.length;i++) {
			matriz[i][3]= matriz[i][1] - matriz[i][2];
		}
		for(int i=0;i<matriz.length;i++) {
			for(int j=0;j<matriz[0].length;j++) {
				matriz2[i][j] = String.valueOf(matriz[i][j]);
			}
			System.out.println(" ");
		}
		for(int i=0;i < matriz2.length;i++) { 
			for(int j=0; j < equipos.size();j++) {
				if(Integer.parseInt(matriz2[i][0]) == equipos.get(j).getIdEquipo()) {
					matriz2[i][5]= equipos.get(j).getNombre();
				}
			}
			
		}
		model.addAttribute("tablaDetalle",matriz2);
		model.addAttribute("torneo",torneo.buscarPorId(idTorneo));

		return "vistas/tablaPosiciones.jsp";
	}
	
	@RequestMapping(value = "/crearTorneo", method=RequestMethod.POST)
	public String CrearTorneo(@ModelAttribute("user") UsuarioTO usuario, @RequestParam(value="nomTorneo") String nom,
	@RequestParam(value="finicio") Date fecha, @RequestParam(value="numParticipantes") int nump,Model model) throws SQLException {
		TorneoDAO dao = new TorneoDAO();
		TorneoTO to = new TorneoTO();
		to.setNombreTorneo(nom);
		to.setFechaInicio(fecha);
		to.setNumeroParticipantes(nump);
		to.setIdUsuario(usuario.getId());
		dao.CrearTorneo(to); 
		
		return "vistas/vistaNormal.jsp";
	}
	
	@RequestMapping(value = "/verTorneos", method=RequestMethod.GET)
	public String listarTorneos(ModelMap model,@ModelAttribute("user") UsuarioTO usuario) throws SQLException {
		
		TorneoDAO torneo = new TorneoDAO();
		model.addAttribute("listarMisTorneos",torneo.listarTorneosPropios(usuario.getId()));
		
		return "vistas/ListarMisTorneos.jsp";
		
	} 
}






