package es.server.java.baronha.view.dto;

import java.util.List;

public class DescargableDTO<T> {


	private long    fechaDesde;
	
	private long    fechaHasta;
	
	private List<T> resultados;
	
	
	public long getFechaDesde() {
		return fechaDesde;
	}
	public void setFechaDesde(long fechaDesde) {
		this.fechaDesde = fechaDesde;
	}
	
	public long getFechaHasta() {
		return fechaHasta;
	}
	public void setFechaHasta(long fechaHasta) {
		this.fechaHasta = fechaHasta;
	}
	public List<T> getResultados() {
		return resultados;
	}
	public void setResultados(List<T> resultados) {
		this.resultados = resultados;
	}
	
	
	
}
