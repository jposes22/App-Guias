package es.server.java.borneiro.model.parametros_app;

import java.util.List;

import es.server.java.borneiro.model.vo.ParametroAPPVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface ParametrosAPPDAO {
	public List<ParametroAPPVO> findAllByFechaActualizacion(Class<ParametroAPPVO> clase, long fechaActualizacion) throws DAOException;
}
