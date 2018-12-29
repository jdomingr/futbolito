package com.futbolito.persistencia;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.EquipoTO;
import com.futbolito.to.UsuarioTO;
import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class UsuarioDAO {
    
	private static final String READ_QUERY="select * from usuario where email=? and contrasena=?";
	private static final String BUSCAR_POR_ID="select * from usuario where idUsuario=?";
	private static final String READ_NOMBRES="select idUsuario,Nombre,Apellido from usuario";
    private static final String INSERT_QUERY="insert into usuario (Nombre,Apellido,Email,Telefono,Contrasena,idRol) values (?,?,?,?,?,?)";
    private static final String DB_NAME="futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
    public UsuarioTO login(UsuarioTO usuario) {
        //put your code here
        Connection conn=null;
        UsuarioTO result = null;
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(READ_QUERY);
            ps.setString(1, usuario.getEmail());
            ps.setString(2, usuario.getContraseña());
            ResultSet rs = ps.executeQuery();
            rs.next();
            result = new UsuarioTO();
            result.setId(rs.getInt("idUsuario"));
            result.setNombre(rs.getString("nombre"));
            result.setApellido(rs.getString("apellido"));
            result.setEmail(rs.getString("email"));
            result.setTelefono(rs.getString("telefono"));
            result.setContraseña(rs.getString("contrasena"));
            result.setIdRol(rs.getInt("idRol"));
            return result;
        }catch(Exception e){
            return null;
        }
    }
    
    
    public void  insertar(UsuarioTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(INSERT_QUERY);
            ps.setString(1, tic.getNombre());
            ps.setString(2, tic.getApellido());
            ps.setString(3, tic.getEmail());
            ps.setString(4, tic.getTelefono());
            ps.setString(5, tic.getContraseña());
            ps.setInt(6, 2);
            
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    
    public static Connection getConnection(){
        Connection conn=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=(Connection) DriverManager.getConnection(URL, USER, PASSWORD);
        }catch(ClassNotFoundException | SQLException el){
            el.printStackTrace();
            System.err.println("Quedo la parte hermano!!!");
        }
        return conn;
    }
    
    public LinkedList<UsuarioTO> listarNombresUsuarios() throws SQLException{
        LinkedList<UsuarioTO> list = new LinkedList<>();
        UsuarioTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_NOMBRES);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new UsuarioTO();
                result.setId(rs.getInt("idUsuario"));
                result.setNombre(rs.getString("Nombre"));
                result.setApellido(rs.getString("Apellido"));
                
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    public UsuarioTO buescarUsuarioPorID(int id) throws SQLException {
    	UsuarioTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_ID);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new UsuarioTO();
                result.setId(rs.getInt("idUsuario"));
                result.setNombre(rs.getString("nombre"));
                result.setApellido(rs.getString("apellido"));
                result.setEmail(rs.getString("email"));
                result.setTelefono(rs.getString("telefono"));
                result.setContraseña(rs.getString("contrasena"));
                result.setIdRol(rs.getInt("idRol"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return result;
    	
    	
    }
}
