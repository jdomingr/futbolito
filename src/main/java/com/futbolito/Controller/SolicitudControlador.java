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
import com.futbolito.persistencia.SolicitudDAO;
import com.futbolito.persistencia.UsuarioDAO;
import com.futbolito.to.EquipoTO;
import com.futbolito.to.SolicitudTO;
import com.futbolito.to.UsuarioTO;

@Controller
@SessionAttributes("user")
public class SolicitudControlador {

	@RequestMapping(value="/solicitud", method=RequestMethod.GET)
    public String handleRequest(ModelMap model,@ModelAttribute("user") UsuarioTO usuario){
        model.addAttribute("nombre", usuario.getId());
        System.out.println(usuario.getId());
        return "vistas/solicitud.jsp";
    }
	
	@RequestMapping(value = "/CrearSolicitud", method=RequestMethod.POST)
	public String CrearSolicitud(@ModelAttribute("user") UsuarioTO usuario, @RequestParam(value="nombreEquipo") 
	String nombreEquipo, @RequestParam(value="accion") String accion,
	@RequestParam(value="descripcion") String descripcion,Model model) throws SQLException {
		SolicitudDAO dao = new SolicitudDAO();
		SolicitudTO to = new SolicitudTO();
		to.setNombre_equipo(nombreEquipo);
		to.setAccion(accion);
		to.setDescripcion(descripcion);
		to.setId_usuario(usuario.getId());
		dao.CrearSolicitud(to); 
		
		return "vistas/vistaNormal.jsp";
	}
	
	@RequestMapping(value = "/verSolicitudes")
	public String verSolicitud(Model model) throws SQLException {
		
		SolicitudDAO sol = new SolicitudDAO();
		model.addAttribute("listarSolicitud",sol.readAllSolicitudes());
		return "vistas/verSolicitudes.jsp";
	} 
	
	@RequestMapping(value="/actualizarEstado", method=RequestMethod.POST)
	public String actualizarEstado(@RequestParam(value="idSolicitud") String id,Model model) throws SQLException {
		int idSolicitud = Integer.parseInt(id);
		SolicitudDAO dao=new SolicitudDAO();
		dao.actualizarState(idSolicitud);
		return "vistas/vistaAdministrador.jsp";
	} 
	
}
