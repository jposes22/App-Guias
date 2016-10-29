package es.server.java.torres_oeste.model.guia;

import java.util.List;

import es.server.java.torres_oeste.model.vo.GuiaVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface GuiaDAO {

	public List<GuiaVO> findAllByFechaActualizacion(Class<GuiaVO> clase, long fechaActualizacion) throws DAOException;
}
