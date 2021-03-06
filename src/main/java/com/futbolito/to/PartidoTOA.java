package com.futbolito.to;

import java.sql.Date;
import java.sql.Time;

public class PartidoTOA {
	
	private int idPartido;
	private Date fecha;
	private Time horaInicio;
	private Time horaFin;
	private String estado;
	private int golesEquipo1;
	private int golesEquipo2;
	private String idEquipo1;
	private String idEquipo2;
	private int idCancha;
	private int idUsuario;
	private String idTorneo;
	public int getIdPartido() {
		return idPartido;
	}
	public void setIdPartido(int idPartido) {
		this.idPartido = idPartido;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Time getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(Time horaInicio) {
		this.horaInicio = horaInicio;
	}
	public Time getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(Time horaFin) {
		this.horaFin = horaFin;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getGolesEquipo1() {
		return golesEquipo1;
	}
	public void setGolesEquipo1(int golesEquipo1) {
		this.golesEquipo1 = golesEquipo1;
	}
	public int getGolesEquipo2() {
		return golesEquipo2;
	}
	public void setGolesEquipo2(int golesEquipo2) {
		this.golesEquipo2 = golesEquipo2;
	}
	public String getIdEquipo1() {
		return idEquipo1;
	}
	public void setIdEquipo1(String idEquipo1) {
		this.idEquipo1 = idEquipo1;
	}
	public String getIdEquipo2() {
		return idEquipo2;
	}
	public void setIdEquipo2(String idEquipo2) {
		this.idEquipo2 = idEquipo2;
	}
	public int getIdCancha() {
		return idCancha;
	}
	public void setIdCancha(int idCancha) {
		this.idCancha = idCancha;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getIdTorneo() {
		return idTorneo;
	}
	public void setIdTorneo(String idTorneo) {
		this.idTorneo = idTorneo;
	}
	
	

}
