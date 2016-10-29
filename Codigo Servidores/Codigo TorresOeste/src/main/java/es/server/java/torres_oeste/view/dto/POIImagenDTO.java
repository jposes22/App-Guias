package es.server.java.torres_oeste.view.dto;

import es.server.java.torres_oeste.utilidades.generic.Generic;

public class POIImagenDTO {

	private int idPoiImagen;
	private int idPoi;
	private String urlImagen;
	
	public int getIdPoiImagen() {
		return idPoiImagen;
	}
	public void setIdPoiImagen(int idPoiImagen) {
		this.idPoiImagen = idPoiImagen;
	}
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

	
	
}
