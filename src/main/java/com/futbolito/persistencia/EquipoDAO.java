package com.futbolito.persistencia;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.futbolito.to.EquipoTO;
import com.futbolito.to.UsuarioTO;
import com.mysql.jdbc.Connection;

public class EquipoDAO {
	
	private static final String READ_ALL = "select * from equipo";
	private static final String READ_NOMBRES="select idEquipo,Nombre from equipo";
	private static final String READ_PROPIOS = "select * from equipo where idUsuario=?";
	private static final String UPDATE="UPDATE `equipo` SET `Nombre`=?,`numeroPartidos`=?,`numeroJugadores`=? ,`idUsuario`=? WHERE `idEquipo`=?";
	private static final String DELETE ="DELETE FROM `equipo` WHERE `idEquipo`=?";
	private static final String INSERT_QUERY = "insert into equipo (Nombre,numeroPartidos,numeroJugadores,idUsuario) values (?,?,?,?)";
	private static final String BUSCAR_POR_ID = "select * from equipo where `idEquipo`=?";
	private static final String ACTUALIZA_CANTJUG = "UPDATE `equipo` SET `numeroJugadores`=? WHERE `idEquipo`=?";
	private static final String BUSCAR_POR_PARTICIPAR_TORNEO = "SELECT * FROM equipo join competir on equipo.idEquipo = competir.idEquipo where competir.idTorneo = ?;";
    private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    
    
    
    public LinkedList<EquipoTO> readAll() throws SQLException{
        LinkedList<EquipoTO> list = new LinkedList<>();
        EquipoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_ALL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new EquipoTO();
                result.setIdEquipo(rs.getInt("idEquipo"));
                result.setNombre(rs.getString("Nombre"));
                result.setNroPartidos(rs.getInt("numeroPartidos"));
                result.setNroJugadores(rs.getInt("numeroJugadores"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    public EquipoTO buscarPorId(int id) throws SQLException{
        
        EquipoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_ID);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new EquipoTO();
                result.setIdEquipo(rs.getInt("idEquipo"));
                result.setNombre(rs.getString("Nombre"));
                result.setNroPartidos(rs.getInt("numeroPartidos"));
                result.setNroJugadores(rs.getInt("numeroJugadores"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return result;
    }
    public void eliminarEquipo(int id) throws SQLException {
    	Connection conn=null;
    	
    	try {
    		conn = getConnection();
    		 PreparedStatement ps = conn.prepareStatement(DELETE);
    		 ps.setInt(1,id);
    		 ps.executeUpdate();
    		
    	}catch(Exception e) {
    		 Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, e);
    	}finally{
            conn.close();
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
    
    public void  insertarEquipo(EquipoTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(INSERT_QUERY);
            ps.setString(1, tic.getNombre());
            ps.setInt(2, tic.getNroPartidos());
            ps.setInt(3, tic.getNroJugadores());
            ps.setInt(4, tic.getIdUsuario());
            
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    public void  actualizarEquipo(EquipoTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(UPDATE);
            ps.setString(1, tic.getNombre());
            ps.setInt(2, tic.getNroPartidos());
            ps.setInt(3, tic.getNroJugadores());
            ps.setInt(4, tic.getIdUsuario());
            ps.setInt(5, tic.getIdEquipo());
            
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    
    public LinkedList<EquipoTO> listarEquiposPropios(int id) throws SQLException{
        LinkedList<EquipoTO> list = new LinkedList<>();
        EquipoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_PROPIOS);
            ps.setInt(1, id );
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new EquipoTO();
                result.setIdEquipo(rs.getInt("idEquipo"));
                result.setNombre(rs.getString("Nombre"));
                result.setNroPartidos(rs.getInt("numeroPartidos"));
                result.setNroJugadores(rs.getInt("numeroJugadores"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    
    public void actualizarCantidadJugadoresEquipo(int idEquipo) throws SQLException {
         Connection conn=null;
         
         EquipoTO equipito = new EquipoTO();
         equipito = buscarPorId(idEquipo);
         int valor = equipito.getNroJugadores();
         int numeroJugadores = valor+1;
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(ACTUALIZA_CANTJUG);
            ps.setInt(1,numeroJugadores );
            ps.setInt(2,idEquipo);
            
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
    	
    }
    
    public void actualizarCantidadJugadoresEquipos(int idEquipo) throws SQLException {
        Connection conn=null;
        
        EquipoTO equipito = new EquipoTO();
        equipito = buscarPorId(idEquipo);
        int valor = equipito.getNroJugadores();
        int numeroJugadores = valor-1;
       try{
           conn=getConnection();
           PreparedStatement ps=conn.prepareStatement(ACTUALIZA_CANTJUG);
           ps.setInt(1,numeroJugadores );
           ps.setInt(2,idEquipo);
           
           ps.executeUpdate();
           
           
       }catch(SQLException ex){
           Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
       }finally{
           if(conn!=null){
               conn.close();
           }
       }
      
   	
   }
    
    public LinkedList<EquipoTO> listarNombresEquipos() throws SQLException{
        LinkedList<EquipoTO> list = new LinkedList<>();
        EquipoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_NOMBRES);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new EquipoTO();
                result.setIdEquipo(rs.getInt("idEquipo"));
                result.setNombre(rs.getString("Nombre"));
                
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    public LinkedList<EquipoTO> buscarParticipacionTorneo(int id) throws SQLException{
        LinkedList<EquipoTO> list = new LinkedList<>();
        EquipoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_PARTICIPAR_TORNEO);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new EquipoTO();
                result.setIdEquipo(rs.getInt("idEquipo"));
                result.setNombre(rs.getString("Nombre"));
                result.setNroPartidos(rs.getInt("numeroPartidos"));
                result.setNroJugadores(rs.getInt("numeroJugadores"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
}
