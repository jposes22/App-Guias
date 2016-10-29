package es.server.java.borneiro.view.dto;

import java.io.Serializable;
import java.util.List;


public class GuiaSaberMasDTO extends GenericLanguageDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5380078617956653148L;
	
	
	private int idGuiaSaberMas;
	private int idGuiaDetalle;
	private String urlAudioGuia;
	private double latitud;
	private double longitud;
	
	
	
	public int getIdGuiaSaberMas() {
		return idGuiaSaberMas;
	}
	public void setIdGuiaSaberMas(int idGuiaSaberMas) {
		this.idGuiaSaberMas = idGuiaSaberMas;
	}
	public int getIdGuiaDetalle() {
		return idGuiaDetalle;
	}
	public void setIdGuiaDetalle(int idGuiaDetalle) {
		this.idGuiaDetalle = idGuiaDetalle;
	}
	public String getUrlAudioGuia() {
		return urlAudioGuia;
	}
	public void setUrlAudioGuia(String urlAudioGuia) {
		this.urlAudioGuia = urlAudioGuia;
	}
	public double getLatitud() {
		return latitud;
	}
	public void setLatitud(double latitud) {
		this.latitud = latitud;
	}
	public double getLongitud() {
		return longitud;
	}
	public void setLongitud(double longitud) {
		this.longitud = longitud;
	}
	
	

	
	
}
