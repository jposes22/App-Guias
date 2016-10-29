package es.server.java.baronha.model.poi;

import java.util.List;

import es.server.java.baronha.model.vo.POIVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface POIDAO {
	public List<POIVO> findAllByFechaActualizacion(Class<POIVO> clase, long fechaActualizacion) throws DAOException;
}
