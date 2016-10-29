package es.server.java.torres_oeste.view.dto;

import java.io.Serializable;

public class ParametroAPPDTO extends GenericDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6722069970559006317L;
	
	
	private String clave;
	private String valor;
	
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	

}
