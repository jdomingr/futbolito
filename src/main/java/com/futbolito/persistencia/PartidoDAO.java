package com.futbolito.persistencia;

import java.awt.List;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.futbolito.to.CanchaTO;
import com.futbolito.to.EquipoTO;
import com.futbolito.to.PartidoTO;
import com.futbolito.to.PartidoTOA;
import com.futbolito.to.TorneoTO;
import com.mysql.jdbc.Connection;

public class PartidoDAO {

	private static final String READ_ALL = "select * from partido";
	private static final String READ_PARTIDO_TORNEO = "select * from partido where idTorneo = ?";
	private static final String READ_PROPIOS = "select * from partido where idUsuario=?";
	private static final String UPDATE="UPDATE `partido` SET `horaInicio`=?,`horaFin`=?,`Estado`=? ,`golesEquipo1`=?,`golesEquipo2`=? WHERE `idPartido`=?";
	private static final String DELETE ="DELETE FROM `equipo` WHERE `idEquipo`=?";
	private static final String INSERT_QUERY = "INSERT INTO `partido`( `Fecha`, `Estado`,`idEquipo1`, `idEquipo2`, `idCancha`, `idUsuario`, `idTorneo`) VALUES (?,?,?,?,?,?,?)";
	private static final String BUSCAR_POR_ID = "select * from partido where `idPartido`= ?";
	private static final String ACTUALIZA_CANTJUG = "UPDATE `equipo` SET `numeroJugadores`=? WHERE `idEquipo`=?";
    private static final String DB_NAME = "futbolito";
    private static final String PORT="3306";
    private static final String URL="jdbc:mysql://localhost:"+PORT+"/"+DB_NAME;
    private static final String USER="root";
    private static final String PASSWORD="";
    

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
    
    
    public LinkedList<PartidoTO> readAll() throws SQLException{
        LinkedList<PartidoTO> list = new LinkedList<>();
        PartidoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_ALL);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new PartidoTO();
                result.setIdPartido(rs.getInt("idPartido"));
                result.setFecha(rs.getDate("Fecha"));
                result.setHoraInicio(rs.getTime("horaInicio"));
                result.setHoraFin(rs.getTime("horaFin"));
                result.setEstado(rs.getString("Estado"));
                result.setGolesEquipo1(rs.getInt("golesEquipo1"));
                result.setGolesEquipo2(rs.getInt("golesEquipo2"));
                result.setIdEquipo1(rs.getInt("idEquipo1"));
                result.setIdEquipo2(rs.getInt("idEquipo2"));
                result.setIdCancha(rs.getInt("idCancha"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PartidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    public LinkedList<PartidoTO> readPartidoTorneo(int id) throws SQLException{
        LinkedList<PartidoTO> list = new LinkedList<>();
        PartidoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_PARTIDO_TORNEO);
            ps.setInt(1, id );
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new PartidoTO();
                result.setIdPartido(rs.getInt("idPartido"));
                result.setFecha(rs.getDate("Fecha"));
                result.setHoraInicio(rs.getTime("horaInicio"));
                result.setHoraFin(rs.getTime("horaFin"));
                result.setEstado(rs.getString("Estado"));
                result.setGolesEquipo1(rs.getInt("golesEquipo1"));
                result.setGolesEquipo2(rs.getInt("golesEquipo2"));
                result.setIdEquipo1(rs.getInt("idEquipo1"));
                result.setIdEquipo2(rs.getInt("idEquipo2"));
                result.setIdCancha(rs.getInt("idCancha"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PartidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    public LinkedList<PartidoTO> listarPartidosPropios(int id) throws SQLException{
        LinkedList<PartidoTO> list = new LinkedList<>();
        PartidoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_PROPIOS);
            ps.setInt(1, id );
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new PartidoTO();
                result.setIdPartido(rs.getInt("idPartido"));
                result.setFecha(rs.getDate("Fecha"));
                result.setHoraInicio(rs.getTime("horaInicio"));
                result.setHoraFin(rs.getTime("horaFin"));
                result.setEstado(rs.getString("Estado"));
                result.setGolesEquipo1(rs.getInt("golesEquipo1"));
                result.setGolesEquipo2(rs.getInt("golesEquipo2"));
                result.setIdEquipo1(rs.getInt("idEquipo1"));
                result.setIdEquipo2(rs.getInt("idEquipo2"));
                result.setIdCancha(rs.getInt("idCancha"));
                result.setIdUsuario(rs.getInt("idUsuario"));
                result.setIdTorneo(rs.getInt("idTorneo"));
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PartidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
    
    public void  AgregarResultados(PartidoTO tic) throws SQLException{
        Connection conn=null;
        
        try{
            conn=getConnection();
            PreparedStatement ps=conn.prepareStatement(UPDATE);
            ps.setTime(1, tic.getHoraInicio());
            ps.setTime(2, tic.getHoraFin());
            ps.setString(3, tic.getEstado());
            ps.setInt(4, tic.getGolesEquipo1());
            ps.setInt(5, tic.getGolesEquipo2());
            ps.setInt(6, tic.getIdPartido());
            
            ps.executeUpdate();
            
            
        }catch(SQLException ex){
            Logger.getLogger(PartidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if(conn!=null){
                conn.close();
            }
        }
       
        
    }
    public LinkedList<PartidoTOA> listarPartidosP(int id) throws SQLException{
        LinkedList<PartidoTOA> list = new LinkedList<>();
        PartidoTOA result = null;
        Connection conn=null;
        EquipoTO equipo= null;
        EquipoDAO dao =new EquipoDAO();
        
        CanchaDAO canchadao =new CanchaDAO();
       
        TorneoDAO torneodao =new TorneoDAO();
        
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(READ_PROPIOS);
            ps.setInt(1, id );
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result= new PartidoTOA();
                equipo = new EquipoTO();
                result.setIdPartido(rs.getInt("idPartido"));
                result.setFecha(rs.getDate("Fecha"));
                result.setHoraInicio(rs.getTime("horaInicio"));
                result.setHoraFin(rs.getTime("horaFin"));
                result.setEstado(rs.getString("Estado"));
                result.setGolesEquipo1(rs.getInt("golesEquipo1"));
                result.setGolesEquipo2(rs.getInt("golesEquipo2"));
                result.setIdEquipo1(dao.buscarPorId(rs.getInt("idEquipo1")).getNombre());
                result.setIdEquipo2(dao.buscarPorId(rs.getInt("idEquipo2")).getNombre());
                result.setIdCancha(canchadao.buscarPorId(rs.getInt("idCancha")).getNumero());
                result.setIdUsuario(rs.getInt("idUsuario"));
                result.setIdTorneo(torneodao.buscarPorId(rs.getInt("idTorneo")).getNombreTorneo());
                list.add(result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PartidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return list;
    }
 public PartidoTOA buscarPorIdP(int id) throws SQLException{
        
	 PartidoTOA result = null;
	 CanchaDAO canchadao =new CanchaDAO();
	 EquipoDAO dao =new EquipoDAO();
     TorneoDAO torneodao =new TorneoDAO();
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_ID);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	 result= new PartidoTOA();
            	 result.setIdPartido(rs.getInt("idPartido"));
                 result.setFecha(rs.getDate("Fecha"));
                 result.setHoraInicio(rs.getTime("horaInicio"));
                 result.setHoraFin(rs.getTime("horaFin"));
                 result.setEstado(rs.getString("Estado"));
                 result.setGolesEquipo1(rs.getInt("golesEquipo1"));
                 result.setGolesEquipo2(rs.getInt("golesEquipo2"));
                 result.setIdEquipo1(dao.buscarPorId(rs.getInt("idEquipo1")).getNombre());
                 result.setIdEquipo2(dao.buscarPorId(rs.getInt("idEquipo2")).getNombre());
                 result.setIdCancha(canchadao.buscarPorId(rs.getInt("idCancha")).getNumero());
                 result.setIdUsuario(rs.getInt("idUsuario"));
                 result.setIdTorneo(torneodao.buscarPorId(rs.getInt("idTorneo")).getNombreTorneo());
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return result;
    }
 public PartidoTO buscarPorId(int id) throws SQLException{
     
	 PartidoTO result = null;
        Connection conn=null;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(BUSCAR_POR_ID);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	 result= new PartidoTO();
            	 result.setIdPartido(rs.getInt("idPartido"));
                 result.setFecha(rs.getDate("Fecha"));
                 result.setHoraInicio(rs.getTime("horaInicio"));
                 result.setHoraFin(rs.getTime("horaFin"));
                 result.setEstado(rs.getString("Estado"));
                 result.setGolesEquipo1(rs.getInt("golesEquipo1"));
                 result.setGolesEquipo2(rs.getInt("golesEquipo2"));
                 result.setIdEquipo1(rs.getInt("idEquipo1"));
                 result.setIdEquipo2(rs.getInt("idEquipo2"));
                 result.setIdCancha(rs.getInt("idCancha"));
                 result.setIdUsuario(rs.getInt("idUsuario"));
                 result.setIdTorneo(rs.getInt("idTorneo"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            conn.close();
        }
        return result;
    }
 public void  insertarPartido(PartidoTO tic) throws SQLException{
     Connection conn=null;
     
     try{
         conn=getConnection();
         PreparedStatement ps=conn.prepareStatement(INSERT_QUERY);
         ps.setDate(1, tic.getFecha());
         ps.setString(2, tic.getEstado());
         ps.setInt(3, tic.getIdEquipo1());
         ps.setInt(4, tic.getIdEquipo2());
         ps.setInt(5, tic.getIdCancha());
         ps.setInt(6, tic.getIdUsuario());
         ps.setInt(7, tic.getIdTorneo());
         
         ps.executeUpdate();
         
         
     }catch(SQLException ex){
         Logger.getLogger(EquipoDAO.class.getName()).log(Level.SEVERE, null, ex);
     }finally{
         if(conn!=null){
             conn.close();
         }
     }
    
     
 }
    
}
