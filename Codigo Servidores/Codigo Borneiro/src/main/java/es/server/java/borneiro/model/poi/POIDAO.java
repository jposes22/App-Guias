package es.server.java.borneiro.model.poi;

import java.util.List;

import es.server.java.borneiro.model.vo.POIVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface POIDAO {
	public List<POIVO> findAllByFechaActualizacion(Class<POIVO> clase, long fechaActualizacion) throws DAOException;
}
