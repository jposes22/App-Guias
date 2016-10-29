package es.server.java.borneiro.view.dto;

import java.io.Serializable;

import es.server.java.borneiro.utilidades.generic.Generic;

public class GuiaDetalleImagenDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1287958754298664085L;
	
	private int idGuiaDetalleImagen;
	private String urlImagen;
	private int idGuiaDetalle;
	
	
	public int getIdGuiaDetalleImagen() {
		return idGuiaDetalleImagen;
	}
	public void setIdGuiaDetalleImagen(int idGuiaDetalleImagen) {
		this.idGuiaDetalleImagen = idGuiaDetalleImagen;
	}
	
	public String getUrlImagen() {
		return Generic.checkNiceURL(urlImagen);
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	public int getIdGuiaDetalle() {
		return idGuiaDetalle;
	}
	public void setIdGuiaDetalle(int idGuiaDetalle) {
		this.idGuiaDetalle = idGuiaDetalle;
	}
	
	
	
	
}
