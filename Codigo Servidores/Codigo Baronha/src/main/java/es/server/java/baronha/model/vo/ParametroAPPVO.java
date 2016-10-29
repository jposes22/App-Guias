package es.server.java.baronha.model.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PARAMETROS_APP")
public class ParametroAPPVO extends GenericVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5381469691416268248L;
	@Id
	@Column(name = "clave")
	private String clave;
	@Column(name = "valor")
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
