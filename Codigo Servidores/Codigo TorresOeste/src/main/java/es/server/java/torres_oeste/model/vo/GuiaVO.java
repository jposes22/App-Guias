package es.server.java.torres_oeste.model.vo;

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
@Table(name = "TO_GUIA")
public class GuiaVO extends GenericLanguageVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4329920426852035237L;

	@Id
	@GeneratedValue
	@Column(name = "id_guia")
	private int idGuia;
	@Column(name ="tipo_guia")
	private int tipoGuia;
	@Column(name ="orden")
	private int orden;
	
	@Column(name = "url_audio_guia_gl")
	private String urlAudioGuiaGl;
	@Column(name = "url_audio_guia_es")
	private String urlAudioGuiaEs;
	@Column(name = "url_audio_guia_en")
	private String urlAudioGuiaEn;
	
	@Column(name = "latitud")
	private double latitud;
	@Column(name = "longitud")
	private double longitud;
	//property one to many que no se llama desde el servicio rest guia por eso le ponemos lazy
	@OneToMany(targetEntity = GuiaDetalleVO.class, fetch = FetchType.LAZY)
	@JoinColumn(nullable = true,name="id_guia")
	private List<GuiaDetalleVO> listGuiaDetalle;
	
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
	public List<GuiaDetalleVO> getListGuiaDetalle() {
		return listGuiaDetalle;
	}
	public void setListGuiaDetalle(List<GuiaDetalleVO> listGuiaDetalle) {
		this.listGuiaDetalle = listGuiaDetalle;
	}
	public String getUrlAudioGuiaGl() {
		return urlAudioGuiaGl;
	}
	public void setUrlAudioGuiaGl(String urlAudioGuiaGl) {
		this.urlAudioGuiaGl = urlAudioGuiaGl;
	}
	public String getUrlAudioGuiaEs() {
		return urlAudioGuiaEs;
	}
	public void setUrlAudioGuiaEs(String urlAudioGuiaEs) {
		this.urlAudioGuiaEs = urlAudioGuiaEs;
	}
	public String getUrlAudioGuiaEn() {
		return urlAudioGuiaEn;
	}
	public void setUrlAudioGuiaEn(String urlAudioGuiaEn) {
		this.urlAudioGuiaEn = urlAudioGuiaEn;
	}
	
	
	
	
	
	
}
