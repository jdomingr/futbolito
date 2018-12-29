package com.futbolito.to;

import java.sql.Date;
import java.sql.Time;

public class PartidoTO {
	
	private int idPartido;
	private Date fecha;
	private Time horaInicio;
	private Time horaFin;
	private String estado;
	private int golesEquipo1;
	private int golesEquipo2;
	private int idEquipo1;
	private int idEquipo2;
	private int idCancha;
	private int idUsuario;
	private int idTorneo;
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
	public int getIdEquipo1() {
		return idEquipo1;
	}
	public void setIdEquipo1(int idEquipo1) {
		this.idEquipo1 = idEquipo1;
	}
	public int getIdEquipo2() {
		return idEquipo2;
	}
	public void setIdEquipo2(int idEquipo2) {
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
	public int getIdTorneo() {
		return idTorneo;
	}
	public void setIdTorneo(int idTorneo) {
		this.idTorneo = idTorneo;
	}
	
	
	
	

}
