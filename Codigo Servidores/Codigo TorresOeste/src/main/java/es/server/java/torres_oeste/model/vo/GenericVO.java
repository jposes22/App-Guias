package es.server.java.torres_oeste.model.vo;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass 
public class GenericVO {

	@Column(name = "is_activo")
	private Boolean isActivo;
	@Column(name = "fecha_actualizacion")
	private long fechaActualizacion;
	
	
	public Boolean getIsActivo() {
		return isActivo;
	}
	public void setIsActivo(Boolean isActivo) {
		this.isActivo = isActivo;
	}
	public long getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(long fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	
}
