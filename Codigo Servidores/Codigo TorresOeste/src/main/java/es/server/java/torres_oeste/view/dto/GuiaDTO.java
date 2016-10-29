package es.server.java.torres_oeste.view.dto;

import java.io.Serializable;



public class GuiaDTO extends GenericLanguageDTO implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -968812582490315979L;
	
	private int idGuia;
	private int tipoGuia;
	private int orden;
	private String urlAudioGuia;
	private double longitud;
	private double latitud;
	
	public int getIdGuia() {
		return idGuia;
	}
	public void setIdGuia(int idGuia) {
		this.idGuia = idGuia;
	}
	public int getTipoGuia() {
		return tipoGuia;
	}
	public void setTipoGuia(int tipoGuia) {
		this.tipoGuia = tipoGuia;
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	public String getUrlAudioGuia() {
		return urlAudioGuia;
	}
	public void setUrlAudioGuia(String urlAudioGuia) {
		this.urlAudioGuia = urlAudioGuia;
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
