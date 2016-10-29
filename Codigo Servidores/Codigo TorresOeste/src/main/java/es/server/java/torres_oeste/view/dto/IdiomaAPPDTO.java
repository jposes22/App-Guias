package es.server.java.torres_oeste.view.dto;

import java.io.Serializable;

public class IdiomaAPPDTO extends GenericDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3884300692145839366L;
	private int idIdioma;
	private String codigoIdioma;
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
