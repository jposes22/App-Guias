package es.server.java.torres_oeste.view.dto;

import java.io.Serializable;
import java.util.List;

import es.server.java.torres_oeste.utilidades.generic.Generic;


public class POIDTO extends GenericLanguageDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1949916655245694860L;
	
	private int idPoi;
	private String urlImagen;
	private String urlWeb;
	private String urlCompartir;
	private String email;
	private String telefono;
	private double latitud;
	private double longitud;
	private int tipoPoi;
	private List<POIImagenDTO> listPoiImagen;
	
	public int getIdPoi() {
		return idPoi;
	}
	public void setIdPoi(int idPoi) {
		this.idPoi = idPoi;
	}
	public String getUrlImagen() {
		return Generic.checkNiceURL(urlImagen);
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	public String getUrlWeb() {
		return urlWeb;
	}
	public void setUrlWeb(String urlWeb) {
		this.urlWeb = urlWeb;
	}
	public String getUrlCompartir() {
		return urlCompartir;
	}
	public void setUrlCompartir(String urlCompartir) {
		this.urlCompartir = urlCompartir;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
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
	public int getTipoPoi() {
		return tipoPoi;
	}
	public void setTipoPoi(int tipoPoi) {
		this.tipoPoi = tipoPoi;
	}
	public List<POIImagenDTO> getListPoiImagen() {
		return listPoiImagen;
	}
	public void setListPoiImagen(List<POIImagenDTO> listPoiImagen) {
		this.listPoiImagen = listPoiImagen;
	}
	
	
}
