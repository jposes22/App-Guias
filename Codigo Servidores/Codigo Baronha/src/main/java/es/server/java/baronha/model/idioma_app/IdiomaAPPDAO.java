package es.server.java.baronha.model.idioma_app;

import java.util.List;

import es.server.java.baronha.model.vo.IdiomaAPPVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface IdiomaAPPDAO {
	public List<IdiomaAPPVO> findAllByFechaActualizacion(Class<IdiomaAPPVO> clase, long fechaActualizacion) throws DAOException;

}
