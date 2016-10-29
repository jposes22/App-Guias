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
@Table(name = "GUIA_DETALLE")
public class GuiaDetalleVO extends GenericLanguageVO implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6708802116927236190L;
	
	
	@Id
	@GeneratedValue
	@Column(name = "id_guia_detalle")
	private int idGuiaDetalle;
	@Column(name = "id_guia")
	private int idGuia;
	@Column(name = "orden")
	private int orden;
	
	@Column(name="longitud")
	private double longitud;
	@Column(name="latitud")
	private double latitud;
	
	@OneToMany(targetEntity = GuiaDetalleImagenVO.class, fetch = FetchType.EAGER)
	@JoinColumn(nullable = true,name="id_guia_detalle")
	private List<GuiaDetalleImagenVO> listGuiaDetalleImagen;

	
	//property one to many que no se llama desde el servicio rest GuiaDetalle por eso le ponemos lazy
	@OneToMany(targetEntity = GuiaSaberMasVO.class, fetch = FetchType.LAZY)
	@JoinColumn(nullable = true,name="id_guia_detalle")
	private List<GuiaSaberMasVO> listGuiaSaberMas;
	
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
	public List<GuiaDetalleImagenVO> getListGuiaDetalleImagen() {
		return listGuiaDetalleImagen;
	}
	public void setListGuiaDetalleImagen(List<GuiaDetalleImagenVO> listGuiaDetalleImagen) {
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
	public List<GuiaSaberMasVO> getListGuiaSaberMas() {
		return listGuiaSaberMas;
	}
	public void setListGuiaSaberMas(List<GuiaSaberMasVO> listGuiaSaberMas) {
		this.listGuiaSaberMas = listGuiaSaberMas;
	}
	
	
	
	
	
	
	
	
}
