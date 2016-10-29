package es.server.java.borneiro.model.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GUIA_SABER_MAS_DETALLE_IMAGEN")
public class GuiaSaberMasDetalleImagenVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -862044887395942625L;
	
	@Id
	@GeneratedValue
	@Column(name = "id_guia_saber_mas_detalle_imagen")
	private int idGuiaSaberMasDetalleImagen;
	@Column(name = "id_guia_saber_mas_detalle")
	private int idGuiaSaberMasDetalle;
	@Column(name = "url_imagen")
	private String urlImagen;
	
	
	
	public int getIdGuiaSaberMasDetalleImagen() {
		return idGuiaSaberMasDetalleImagen;
	}
	public void setIdGuiaSaberMasDetalleImagen(int idGuiaSaberMasDetalleImagen) {
		this.idGuiaSaberMasDetalleImagen = idGuiaSaberMasDetalleImagen;
	}
	
	public int getIdGuiaSaberMasDetalle() {
		return idGuiaSaberMasDetalle;
	}
	public void setIdGuiaSaberMasDetalle(int idGuiaSaberMasDetalle) {
		this.idGuiaSaberMasDetalle = idGuiaSaberMasDetalle;
	}
	public String getUrlImagen() {
		return urlImagen;
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	
	
	
	
}
