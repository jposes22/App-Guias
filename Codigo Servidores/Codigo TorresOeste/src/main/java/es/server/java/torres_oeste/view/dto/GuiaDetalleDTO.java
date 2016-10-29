package es.server.java.torres_oeste.view.dto;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;

import es.server.java.torres_oeste.model.vo.GuiaDetalleImagenVO;


public class GuiaDetalleDTO extends GenericLanguageDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1059615672462511164L;
	
	private int idGuiaDetalle;
	private int idGuia;
	private int orden;
	private List<GuiaDetalleImagenDTO> listGuiaDetalleImagen;
	private double longitud;
	private double latitud;
	
	public int getIdGuiaDetalle() {
		return idGuiaDetalle;
	}
	public void setIdGuiaDetalle(int idGuiaDetalle) {
		this.idGuiaDetalle = idGuiaDetalle;
	}
	public int getIdGuia() {
		return idGuia;
	}
	public void setIdGuia(int idGuia) {
		this.idGuia = idGuia;
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	public List<GuiaDetalleImagenDTO> getListGuiaDetalleImagen() {
		return listGuiaDetalleImagen;
	}
	public void setListGuiaDetalleImagen(List<GuiaDetalleImagenDTO> listGuiaDetalleImagen) {
		this.listGuiaDetalleImagen = listGuiaDetalleImagen;
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
