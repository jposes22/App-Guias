package es.server.java.borneiro.model.guia;

import java.util.List;

import es.server.java.borneiro.model.vo.GuiaVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface GuiaDAO {

	public List<GuiaVO> findAllByFechaActualizacion(Class<GuiaVO> clase, long fechaActualizacion) throws DAOException;
}
