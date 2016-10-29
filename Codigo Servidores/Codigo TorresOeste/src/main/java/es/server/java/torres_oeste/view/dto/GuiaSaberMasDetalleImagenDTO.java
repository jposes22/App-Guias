package es.server.java.torres_oeste.view.dto;

import java.io.Serializable;

import es.server.java.torres_oeste.utilidades.generic.Generic;


public class GuiaSaberMasDetalleImagenDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4742388247860035929L;
	
	
	private int idGuiaSaberMasDetalleImagen;
	private int idGuiaSaberMasDetalle;
	private String urlImagen;
	
	
	
	public int getIdGuiaSaberMasDetalleImagen() {
		return idGuiaSaberMasDetalleImagen;
	}
	public void setIdGuiaSaberMasDetalleImagen(int idGuiaSaberMasDetalleImagen) {
		this.idGuiaSaberMasDetalleImagen = idGuiaSaberMasDetalleImagen;
	}
	public int getIdGuiaSaberMasDetalle() {
		return idGuiaSaberMasDetalle;
	}
	public void setIdGuiaSaberMasDetalle(int idGuiaSaberMasDetalle) {
		this.idGuiaSaberMasDetalle = idGuiaSaberMasDetalle;
	}
	public String getUrlImagen() {
		return Generic.checkNiceURL(urlImagen);
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	
	
}
