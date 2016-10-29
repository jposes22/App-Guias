package es.server.java.borneiro.view.dto;

import java.io.Serializable;

public class NovedadDTO extends GenericLanguageDTO  implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8193746854699963058L;
	
	private int idNovedad; 
	private long fechaNovedad; 
	private String imagen;
	private String urlCompartir; 
	private String urlWeb; 
	private Boolean isRSS; 
	private long fechaEnvio; 
	
	
	public NovedadDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
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
	
	public Boolean getIsRSS() {
		return isRSS;
	}
	public void setIsRSS(Boolean isRSS) {
		this.isRSS = isRSS;
	}
	public long getFechaEnvio() {
		return fechaEnvio;
	}
	public void setFechaEnvio(long fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}
	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
	
	

}
