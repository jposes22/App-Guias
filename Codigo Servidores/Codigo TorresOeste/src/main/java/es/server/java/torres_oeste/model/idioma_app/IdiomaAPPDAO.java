package es.server.java.torres_oeste.model.idioma_app;

import java.util.List;

import es.server.java.torres_oeste.model.vo.IdiomaAPPVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface IdiomaAPPDAO {
	public List<IdiomaAPPVO> findAllByFechaActualizacion(Class<IdiomaAPPVO> clase, long fechaActualizacion) throws DAOException;

}
