package com.futbolito.to;

import java.sql.Date;

public class TorneoTO {
	private int idTorneo;
	private String nombreTorneo;
	private Date FechaInicio;
	private int numeroParticipantes;
	private int idCampeon;
	private int idUsuario;
	public int getIdTorneo() {
		return idTorneo;
	}
	public void setIdTorneo(int idTorneo) {
		this.idTorneo = idTorneo;
		
	}
	
	
	public String getNombreTorneo() {
		return nombreTorneo;
	}
	public void setNombreTorneo(String nombreTorneo) {
		this.nombreTorneo = nombreTorneo;
	}
	public Date getFechaInicio() {
		return FechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		FechaInicio = fechaInicio;
	}
	public int getNumeroParticipantes() {
		return numeroParticipantes;
	}
	public void setNumeroParticipantes(int numeroParticipantes) {
		this.numeroParticipantes = numeroParticipantes;
	}
	public int getIdCampeon() {
		return idCampeon;
	}
	public void setIdCampeon(int idCampeon) {
		this.idCampeon = idCampeon;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	
}
