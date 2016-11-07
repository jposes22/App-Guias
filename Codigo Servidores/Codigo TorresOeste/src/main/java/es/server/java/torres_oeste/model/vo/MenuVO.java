package es.server.java.torres_oeste.model.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import es.server.java.torres_oeste.view.dto.GenericDTO;

@Entity
@Table(name = "TO_MENU")
public class MenuVO extends GenericVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1345325994876147631L;
	
	
	@Id
	@GeneratedValue
	@Column(name = "id_menu")
	private int idMenu;
	@Column(name = "code_menu")
	private int codeMenu;
	@Column(name = "orden")
	private int orden;
	
	
	public int getIdMenu() {
		return idMenu;
	}
	public void setIdMenu(int idMenu) {
		this.idMenu = idMenu;
	}

	public int getCodeMenu() {
		return codeMenu;
	}
	public void setCodeMenu(int codeMenu) {
		this.codeMenu = codeMenu;
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	
}
