package com.futbolito.Controller;

import java.sql.SQLException;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.futbolito.persistencia.EquipoDAO;
import com.futbolito.persistencia.UsuarioDAO;
import com.futbolito.to.EquipoTO;
import com.futbolito.to.UsuarioTO;


@Controller
@SessionAttributes("user")

public class EquipoControlador {
	@RequestMapping(value = "/crearequipo",method=RequestMethod.GET)
	public String crearEquipo() {
		return "vistas/CrearEquipo.jsp";
	} 
	
	@RequestMapping(value = "/listarequipos")
	public String listarEquipos(Model model) throws SQLException {
		
		EquipoDAO equipo = new EquipoDAO();
		model.addAttribute("listaEquipos",equipo.readAll());
		System.out.println(equipo);
		return "vistas/listarEquipos.jsp";
	} 
	@RequestMapping(value = "/listarequiposNormal")
	public String listarequiposNormal(Model model) throws SQLException {
		
		EquipoDAO equipo = new EquipoDAO();
		model.addAttribute("listaEquipos",equipo.readAll());
		return "vistas/ListarEquipoNormal.jsp";
	} 

	@RequestMapping(value = "/eliminarEquipo",method=RequestMethod.POST)
	public String eliminarEquipo(@RequestParam(value="id", required=false, defaultValue="World") String id,Model model) throws SQLException {
		EquipoDAO dao=new EquipoDAO();
		int idE=Integer.parseInt(id);
		dao.eliminarEquipo(idE);
		model.addAttribute("listaEquipos",dao.readAll());
		return "vistas/listarEquipos.jsp";
	} 
	@RequestMapping(value = "/actualizarEquipo",method=RequestMethod.POST)
	public String actualizarEquipo(@RequestParam(value="id", required=false, defaultValue="World") String id,Model model) throws SQLException {
		EquipoDAO dao=new EquipoDAO();
		EquipoTO equipo= new EquipoTO();
		UsuarioTO usuario= new UsuarioTO();
		UsuarioDAO usuarioDao = new UsuarioDAO();
		int idE=Integer.parseInt(id);
		equipo = dao.buscarPorId(idE);
		String nombre =equipo.getNombre();
		int partidos = equipo.getNroPartidos();
		int numJugadores= equipo.getNroJugadores();
		int idUser = equipo.getIdUsuario();
		usuario = usuarioDao.buescarUsuarioPorID(equipo.getIdUsuario());
		String nombreUsuario = usuario.getNombre();
		model.addAttribute("id", equipo.getIdEquipo());
		model.addAttribute("nombre",nombre);
		model.addAttribute("partidos",partidos);
		model.addAttribute("numJugadores",numJugadores);
		model.addAttribute("idUser", idUser);
		model.addAttribute("usuario", nombreUsuario+" "+ usuario.getApellido());model.addAttribute("");
		System.out.println(equipo.getIdEquipo());
		return "vistas/modificar.jsp";
	} 

	
	
	@RequestMapping(value="/crear", method=RequestMethod.POST)
	public String IngresarEquipo(@RequestParam(value="nombreEquipo", required=false,defaultValue="World")String nameEquipo, Model model
			,@RequestParam(value="numPartidos")int numPartidos
			,@RequestParam(value="numJugadores")int numJugadores 
			,@RequestParam(value="usuario")String usuario) throws SQLException {
		int idUsuario = Integer.parseInt(usuario);
		model.addAttribute("nombreE",nameEquipo);
		model.addAttribute("numerosP",numPartidos);
		model.addAttribute("numerosJ",numJugadores);
		model.addAttribute("usuario",idUsuario);
		
		EquipoDAO dao = new EquipoDAO();
		EquipoTO tic = new EquipoTO();
		tic.setNombre(nameEquipo);
		tic.setNroPartidos(numPartidos);
		tic.setNroJugadores(numJugadores);
		tic.setIdUsuario(idUsuario);
	    dao.insertarEquipo(tic);
	    
	    return "vistas/CrearEquipo.jsp";
	}
	@RequestMapping(value="/actualizar", method=RequestMethod.POST)
	public String actualizar(@RequestParam(value="id", required=false, defaultValue="World") String id,Model model
			,@RequestParam(value="nombreEquipo", required=false,defaultValue="World")String nombreEquipo,
			@RequestParam(value="numPartidos")int numPartidos,
			@RequestParam(value="numJugadores")int numJugadores,
			@RequestParam(value="usuario")String usuario
			
			) throws SQLException {
		int idUsuario = Integer.parseInt(usuario);
		EquipoDAO dao=new EquipoDAO();
		EquipoTO equipo= new EquipoTO();
		int idE=Integer.parseInt(id);
		System.out.println(id+", " +nombreEquipo+", "+ numPartidos+","+numJugadores );
		equipo.setIdEquipo(idE);
		equipo.setNombre(nombreEquipo);
		equipo.setNroPartidos(numPartidos);
		equipo.setNroJugadores(numJugadores);
		equipo.setIdUsuario(idUsuario);
		
		dao.actualizarEquipo(equipo);
		
		
		return "vistas/vistaAdministrador.jsp";
	} 
	
	
	@RequestMapping(value = "/listarequiposPropios", method=RequestMethod.GET)
	public String listarequiposPropios(ModelMap model,@ModelAttribute("user") UsuarioTO usuario) throws SQLException {
		
		EquipoDAO equipo = new EquipoDAO();
		model.addAttribute("listaMisEquipos",equipo.listarEquiposPropios(usuario.getId()));
		
		return "vistas/ListarMisEquiposNormal.jsp";
		
	} 
	
	@RequestMapping(value = "/volver", method=RequestMethod.GET)
	public String atras() {
		return "vistas/vistaNormal.jsp";
	} 
	
	@RequestMapping(value = "/volver2", method=RequestMethod.GET)
	public String atras2() {
		return "vistas/vistaAdministrador.jsp";
	} 
	
	
	
	
		


}