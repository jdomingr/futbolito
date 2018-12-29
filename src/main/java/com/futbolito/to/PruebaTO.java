package com.futbolito.to;

import java.sql.Date;

public class PruebaTO {
	private int idReserva;
	private String nombreRecinto;
	private String direccion;
	private Date fecha;
	private String hora;
	private int numeroCancha;
	
	
	
	
	public int getIdReserva() {
		return idReserva;
	}
	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}
	public int getNumeroCancha() {
		return numeroCancha;
	}
	public void setNumeroCancha(int numeroCancha) {
		this.numeroCancha = numeroCancha;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getNombreRecinto() {
		return nombreRecinto;
	}
	public void setNombreRecinto(String nombreRecinto) {
		this.nombreRecinto = nombreRecinto;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	
	
	

}
