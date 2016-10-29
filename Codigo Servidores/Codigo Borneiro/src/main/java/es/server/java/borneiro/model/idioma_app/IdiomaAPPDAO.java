package es.server.java.borneiro.model.idioma_app;

import java.util.List;

import es.server.java.borneiro.model.vo.IdiomaAPPVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface IdiomaAPPDAO {
	public List<IdiomaAPPVO> findAllByFechaActualizacion(Class<IdiomaAPPVO> clase, long fechaActualizacion) throws DAOException;

}