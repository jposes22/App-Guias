package es.server.java.baronha.model.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "IDIOMA_APP")
public class IdiomaAPPVO extends GenericVO implements Serializable{

	@Id
	@GeneratedValue
	@Column(name = "id_idioma")
	private int idIdioma;
	@Column(name = "codigo_idioma")
	private String codigoIdioma;
	@Column(name = "nombre_idioma")
	private String nombreIdioma;
	
	
	
	public int getIdIdioma() {
		return idIdioma;
	}
	public void setIdIdioma(int idIdioma) {
		this.idIdioma = idIdioma;
	}
	
	public String getCodigoIdioma() {
		return codigoIdioma;
	}
	public void setCodigoIdioma(String codigoIdioma) {
		this.codigoIdioma = codigoIdioma;
	}
	public String getNombreIdioma() {
		return nombreIdioma;
	}
	public void setNombreIdioma(String nombreIdioma) {
		this.nombreIdioma = nombreIdioma;
	}
	
}
