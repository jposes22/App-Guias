package es.server.java.baronha.model.guia;

import java.util.List;

import es.server.java.baronha.model.vo.GuiaVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface GuiaDAO {

	public List<GuiaVO> findAllByFechaActualizacion(Class<GuiaVO> clase, long fechaActualizacion) throws DAOException;
}
