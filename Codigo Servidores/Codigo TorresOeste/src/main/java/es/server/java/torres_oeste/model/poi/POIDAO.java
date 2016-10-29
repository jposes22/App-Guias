package es.server.java.torres_oeste.model.poi;

import java.util.List;

import es.server.java.torres_oeste.model.vo.POIVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface POIDAO {
	public List<POIVO> findAllByFechaActualizacion(Class<POIVO> clase, long fechaActualizacion) throws DAOException;
}
