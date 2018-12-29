package com.futbolito.to;

public class SolicitudTO {
	private int id_solicitud;
	private String nombre_equipo;
	private String accion;
	private String descripcion;
	private String estado;
	private int id_usuario;
	
	
	public String getAccion() {
		return accion;
	}
	public void setAccion(String accion) {
		this.accion = accion;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getId_solicitud() {
		return id_solicitud;
	}
	public void setId_solicitud(int id_solicitud) {
		this.id_solicitud = id_solicitud;
	}
	public String getNombre_equipo() {
		return nombre_equipo;
	}
	public void setNombre_equipo(String nombre_equipo) {
		this.nombre_equipo = nombre_equipo;
	}
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	
	

}
