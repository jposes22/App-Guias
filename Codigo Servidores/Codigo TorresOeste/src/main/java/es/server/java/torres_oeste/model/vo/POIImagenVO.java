package es.server.java.torres_oeste.model.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TO_POI_IMAGEN")
public class POIImagenVO {
	@Id
	@GeneratedValue
	@Column(name = "id_poi_imagen")
	private int idPoiImagen;
	@Column(name = "id_poi")
	private int idPoi;
	@Column(name = "url_imagen")
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
		return urlImagen;
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	

}
