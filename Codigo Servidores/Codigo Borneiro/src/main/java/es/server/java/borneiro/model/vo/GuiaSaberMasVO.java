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
@Table(name = "GUIA_SABER_MAS")
public class GuiaSaberMasVO extends GenericLanguageVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3524850901475256846L;
	
	@Id
	@GeneratedValue
	@Column(name = "id_guia_saber_mas")
	private int idGuiaSaberMas;
	@Column(name = "id_guia_detalle")
	private int idGuiaDetalle;

	@Column(name="url_audio_guia")
	private String urlAudioGuia;
	
	@Column(name="longitud")
	private double longitud;
	@Column(name="latitud")
	private double latitud;

	//property one to many que no se llama desde el servicio rest GuiaSaberMas por eso le ponemos lazy
	@OneToMany(targetEntity = GuiaSaberMasDetalleVO.class, fetch = FetchType.LAZY)
	@JoinColumn(nullable = true,name="id_guia_saber_mas")
	private List<GuiaSaberMasDetalleVO> listGuiaSaberDetalleMas;
	
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
	public List<GuiaSaberMasDetalleVO> getListGuiaSaberDetalleMas() {
		return listGuiaSaberDetalleMas;
	}
	public void setListGuiaSaberDetalleMas(List<GuiaSaberMasDetalleVO> listGuiaSaberDetalleMas) {
		this.listGuiaSaberDetalleMas = listGuiaSaberDetalleMas;
	}
	
	
	
	
}