package es.server.java.borneiro.view.dto;

import java.io.Serializable;
import java.util.List;

public class GuiaSaberMasDetalleDTO extends GenericLanguageDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5436729504258771074L;
	
	
	private int idGuiaSaberMasDetalle;
	private int idGuiaSaberMas;
	private int orden;
	private List<GuiaSaberMasDetalleImagenDTO> listGuiaSaberMasDetalleImagen;
	private double longitud;
	private double latitud;
	
	public int getIdGuiaSaberMasDetalle() {
		return idGuiaSaberMasDetalle;
	}
	public void setIdGuiaSaberMasDetalle(int idGuiaSaberMasDetalle) {
		this.idGuiaSaberMasDetalle = idGuiaSaberMasDetalle;
	}
	public int getIdGuiaSaberMas() {
		return idGuiaSaberMas;
	}
	public void setIdGuiaSaberMas(int idGuiaSaberMas) {
		this.idGuiaSaberMas = idGuiaSaberMas;
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	public List<GuiaSaberMasDetalleImagenDTO> getListGuiaSaberMasDetalleImagen() {
		return listGuiaSaberMasDetalleImagen;
	}
	public void setListGuiaSaberMasDetalleImagen(List<GuiaSaberMasDetalleImagenDTO> listGuiaSaberMasDetalleImagen) {
		this.listGuiaSaberMasDetalleImagen = listGuiaSaberMasDetalleImagen;
	}
	public double getLongitud() {
		return longitud;
	}
	public void setLongitud(double longitud) {
		this.longitud = longitud;
	}
	public double getLatitud() {
		return latitud;
	}
	public void setLatitud(double latitud) {
		this.latitud = latitud;
	}
	
	
}
