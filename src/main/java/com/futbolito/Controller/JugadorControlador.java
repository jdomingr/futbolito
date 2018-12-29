package com.futbolito.Controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.futbolito.persistencia.EquipoDAO;
import com.futbolito.persistencia.JugadorDAO;
import com.futbolito.to.EquipoTO;
import com.futbolito.to.JugadorTO;
import com.futbolito.to.UsuarioTO;

@Controller
@SessionAttributes({"user","jugador"})
public class JugadorControlador {

	
	@RequestMapping(value = "/agregarJugador",method=RequestMethod.POST)
	public String agregarJugador(@RequestParam(value="idequipo", required=false, defaultValue="World") String idequipo,Model model) throws SQLException {
		int idE=Integer.parseInt(idequipo);
		model.addAttribute("idEquipo", idE);
		return "vistas/agregarJugador.jsp";
	} 
	
	@RequestMapping(value = "/agregarJugadores",method=RequestMethod.POST)
	public String agregarJugadores(@RequestParam(value="nombreJugador", required=false,defaultValue="World")String nameJugador, Model model
			,@RequestParam(value="apellidoJugador")String apellidoJ
			,@RequestParam(value="idequipo")String idequipo) throws SQLException {
		int idEquipo = Integer.parseInt(idequipo);
		
		JugadorDAO dao = new JugadorDAO();
		JugadorTO tic = new JugadorTO();
		EquipoDAO eq = new EquipoDAO();
		tic.setNombre(nameJugador);
		tic.setApellido(apellidoJ);
		tic.setIdEquipo(idEquipo);
	    dao.insertarJugador(tic);
	    eq.actualizarCantidadJugadoresEquipo(idEquipo);
	    
	    return "vistas/agregarJugador.jsp";
	}
	
	@RequestMapping(value = "/verJugadoresdelEquipo",method=RequestMethod.POST)
	public String verJugadoresdeEquipo(@RequestParam(value="idequipo") String idequipo,@ModelAttribute("user") UsuarioTO usuario,ModelMap model) throws SQLException {
		int idd = Integer.parseInt(idequipo);
		JugadorDAO jug = new JugadorDAO();
		model.addAttribute("listarJugadoresdeEquipo",jug.listarJugadoresEquipo(idd));
		model.addAttribute("usuario", usuario);
		if(usuario.getIdRol()==1) {
			return "vistas/listarJugadoresNormal.jsp";
		}else {
	    return "vistas/listarJugadoresPorEquipo.jsp";
	}}
	
	@RequestMapping(value = "/eliminarJugador",method=RequestMethod.POST)
	public String eliminarJugador(@RequestParam(value="id", required=false, defaultValue="World") String id,ModelMap model
	,@RequestParam(value = "idEquipo") String idEquipo) throws SQLException {
		JugadorDAO jug=new JugadorDAO();
		EquipoDAO eq = new EquipoDAO();
		int idJ=Integer.parseInt(id);
		int idE=Integer.parseInt(idEquipo);
		jug.eliminarJugador(idJ);
		eq.actualizarCantidadJugadoresEquipos(idE);
		return "vistas/vistaNormal.jsp";
	} 
	@RequestMapping(value = "/modificarJugador",method=RequestMethod.POST)
	public String modificarJugador(@RequestParam(value="id", required=false, defaultValue="World") int id,ModelMap model
	,@RequestParam(value = "idEquipo") int idEquipo) throws SQLException {
		JugadorDAO jug=new JugadorDAO();
		JugadorTO jugador= new JugadorTO();
		EquipoDAO eq = new EquipoDAO();
		int idJ=id;
		jugador= jug.buscarPorId(idJ);
		model.addAttribute("jugador", jugador);
		return "vistas/modificarJugador.jsp";
	} 
	@RequestMapping(value = "/modificarUnJugador",method=RequestMethod.POST)
	public String modificarUnJugador(@ModelAttribute("jugador") JugadorTO player,@RequestParam(value="nombreJugador", required=false,defaultValue="World")String nameJugador, ModelMap model
			,@RequestParam(value="apellidoJugador")String apellidoJ) throws SQLException {
		JugadorDAO jug=new JugadorDAO();
		JugadorTO jugador= new JugadorTO();
		jugador= player;
		jugador.setNombre(nameJugador);
		jugador.setApellido(apellidoJ);
		jug.modificarJugador(jugador);
		model.addAttribute("listarJugadoresdeEquipo",jug.listarJugadoresEquipo(jugador.getIdEquipo()));
	    return "vistas/listarJugadoresPorEquipo.jsp";
	}
	@RequestMapping(value = "/verJugadoresdelEquipoNormal",method=RequestMethod.POST)
	public String verJugadoresdeEquipoNormal(@RequestParam(value="idequipo", required=false, defaultValue="World") String idequipo,Model model) throws SQLException {
		int idE=Integer.parseInt(idequipo);
		JugadorDAO jug = new JugadorDAO();
		model.addAttribute("listarJugadoresdeEquipo",jug.listarJugadoresEquipo(idE));
	    return "vistas/listarJugadoresNormal.jsp";
	}

	
	}
