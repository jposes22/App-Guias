package es.server.java.borneiro.model.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GUIA_DETALLE_IMAGENES")
public class GuiaDetalleImagenVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3079396178486221645L;
	@Id
	@GeneratedValue
	@Column(name = "id_guia_detalle_imagen")
	private int idGuiaDetalleImagen;
	@Column(name = "url_imagen")
	private String urlImagen;
	@Column(name = "id_guia_detalle")
	private int idGuiaDetalle;
	
	
	public int getIdGuiaDetalleImagen() {
		return idGuiaDetalleImagen;
	}
	public void setIdGuiaDetalleImagen(int idGuiaDetalleImagen) {
		this.idGuiaDetalleImagen = idGuiaDetalleImagen;
	}
	
	public String getUrlImagen() {
		return urlImagen;
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	public int getIdGuiaDetalle() {
		return idGuiaDetalle;
	}
	public void setIdGuiaDetalle(int idGuiaDetalle) {
		this.idGuiaDetalle = idGuiaDetalle;
	}
	
	
	
}
