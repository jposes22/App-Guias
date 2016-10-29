package es.server.java.borneiro.model.vo;


import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "POI")
public class POIVO extends GenericLanguageVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3643010055450638221L;
	
	
	@Id
	@GeneratedValue
	@Column(name = "id_poi")
	private int idPoi;
	@Column(name = "url_imagen")
	private String urlImagen;
	@Column(name = "url_web")
	private String urlWeb;
	@Column(name = "url_compartir")
	private String urlCompartir;
	@Column(name = "email")
	private String email;
	@Column(name = "telefono")
	private String telefono;
	@Column(name = "latitud")
	private double latitud;
	@Column(name = "longitud")
	private double longitud;
	@Column(name = "tipo_poi")
	private int tipoPoi;
	
	@OneToMany(targetEntity = POIImagenVO.class, fetch = FetchType.EAGER)
	@JoinColumn(nullable = true,name="id_poi")
	private List<POIImagenVO> listPoiImagen;
	
	
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
	public List<POIImagenVO> getListPoiImagen() {
		return listPoiImagen;
	}
	public void setListPoiImagen(List<POIImagenVO> listPoiImagen) {
		this.listPoiImagen = listPoiImagen;
	}
	
	
	

}
