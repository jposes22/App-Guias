package es.server.java.borneiro.view.dto;

import java.io.Serializable;

public class MenuDTO extends GenericDTO implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2928552954304490366L;
	
	private int idMenu;
	private int codeMenu;
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
