package es.server.java.borneiro.model.vo;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NOVEDADES")
public class NovedadVO extends GenericLanguageVO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 762194949198885182L;
	
	
	@Id
	@GeneratedValue
	@Column(name = "id_novedad")
	private int idNovedad;
	@Column(name = "fecha_novedad")
	private long fechaNovedad;
	@Column(name= "imagen")
	private Blob imagen;
	@Column(name = "url_compartir")
	private String urlCompartir;
	@Column(name = "url_web")
	private String urlWeb;
	@Column(name = "fecha_envio")
	private long fechaEnvio;

	public int getIdNovedad() {
		return idNovedad;
	}
	public void setIdNovedad(int idNovedad) {
		this.idNovedad = idNovedad;
	}
	public long getFechaNovedad() {
		return fechaNovedad;
	}
	public void setFechaNovedad(long fechaNovedad) {
		this.fechaNovedad = fechaNovedad;
	}
	public String getUrlCompartir() {
		return urlCompartir;
	}
	public void setUrlCompartir(String urlCompartir) {
		this.urlCompartir = urlCompartir;
	}
	public String getUrlWeb() {
		return urlWeb;
	}
	public void setUrlWeb(String urlWeb) {
		this.urlWeb = urlWeb;
	}
	public long getFechaEnvio() {
		return fechaEnvio;
	}
	public void setFechaEnvio(long fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}
	public Blob getImagen() {
		return imagen;
	}
	public void setImagen(Blob imagen) {
		this.imagen = imagen;
	}
	
	

}
