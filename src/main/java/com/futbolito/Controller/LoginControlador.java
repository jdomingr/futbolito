package com.futbolito.Controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.futbolito.persistencia.UsuarioDAO;
import com.futbolito.to.UsuarioTO;



@Controller
@SessionAttributes("user")
public class LoginControlador {
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String ValidarUsuario(@RequestParam(value="usuario", required=false,defaultValue="World")String name, ModelMap model
			,@RequestParam(value="password")String password) throws SQLException {
		
		model.addAttribute("usuario",name);
		model.addAttribute("password",password);	
		String msj = "Usuario o contraseña incorrectos";
		model.addAttribute("mensaje",msj);
		UsuarioTO resultado = null;
		UsuarioDAO dao = new UsuarioDAO();
		UsuarioTO tic = new UsuarioTO();
		tic.setEmail(name);
		tic.setContraseña(password);
		resultado = dao.login(tic);
		
	    if(resultado == null) {
	    	return "index.jsp";
	    }else {
	    	if(resultado.getIdRol()==1){
	    		model.addAttribute("user", resultado);
	    		return "vistas/vistaAdministrador.jsp";
	    	}else {
	    		model.addAttribute("user", resultado);
	    		 return "vistas/vistaNormal.jsp";
	    	}
	    	
	    }
		
	} 
	
	
}
