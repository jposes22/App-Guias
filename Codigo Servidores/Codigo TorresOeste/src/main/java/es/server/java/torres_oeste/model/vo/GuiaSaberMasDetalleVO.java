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
@Table(name = "TO_GUIA_SABER_MAS_DETALLE")
public class GuiaSaberMasDetalleVO extends GenericLanguageVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1017805065656279508L;
	
	@Id
	@GeneratedValue
	@Column(name = "id_guia_saber_mas_detalle")
	private int idGuiaSaberMasDetalle;
	@Column(name = "id_guia_saber_mas")
	private int idGuiaSaberMas;
	@Column(name = "orden")
	private int orden;
	
	@Column(name="longitud")
	private double longitud;
	@Column(name="latitud")
	private double latitud;
	
	@OneToMany(targetEntity = GuiaSaberMasDetalleImagenVO.class, fetch = FetchType.EAGER)
	@JoinColumn(nullable = true,name="id_guia_saber_mas_detalle")
	private List<GuiaSaberMasDetalleImagenVO> listGuiaSaberMasDetalleImagen;
	
	
	
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	
	
	public List<GuiaSaberMasDetalleImagenVO> getListGuiaSaberMasDetalleImagen() {
		return listGuiaSaberMasDetalleImagen;
	}
	public void setListGuiaSaberMasDetalleImagen(List<GuiaSaberMasDetalleImagenVO> listGuiaSaberMasDetalleImagen) {
		this.listGuiaSaberMasDetalleImagen = listGuiaSaberMasDetalleImagen;
	}
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
