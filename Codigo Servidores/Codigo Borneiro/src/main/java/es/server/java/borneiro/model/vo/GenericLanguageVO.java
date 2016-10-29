package es.server.java.borneiro.model.vo;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass 
public class GenericLanguageVO extends GenericVO {

	@Column(name = "titulo_gl")
	private String tituloGl;
	@Column(name = "titulo_es")
	private String tituloEs;
	@Column(name = "titulo_en")
	private String tituloEn;
	
	@Column(name = "descripcion_gl",length = 10000)
	private String descripcionGl;
	@Column(name = "descripcion_es",length = 10000)
	private String descripcionEs;
	@Column(name = "descripcion_en",length = 10000)
	private String descripcionEn;
	
	
	public String getTituloGl() {
		return tituloGl;
	}
	public void setTituloGl(String tituloGl) {
		this.tituloGl = tituloGl;
	}
	public String getTituloEs() {
		return tituloEs;
	}
	public void setTituloEs(String tituloEs) {
		this.tituloEs = tituloEs;
	}
	public String getTituloEn() {
		return tituloEn;
	}
	public void setTituloEn(String tituloEn) {
		this.tituloEn = tituloEn;
	}
	public String getDescripcionGl() {
		return descripcionGl;
	}
	public void setDescripcionGl(String descripcionGl) {
		this.descripcionGl = descripcionGl;
	}
	public String getDescripcionEs() {
		return descripcionEs;
	}
	public void setDescripcionEs(String descripcionEs) {
		this.descripcionEs = descripcionEs;
	}
	public String getDescripcionEn() {
		return descripcionEn;
	}
	public void setDescripcionEn(String descripcionEn) {
		this.descripcionEn = descripcionEn;
	}
	
	
}
