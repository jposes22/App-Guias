package es.server.java.torres_oeste.model.parametros_app;

import java.util.List;

import es.server.java.torres_oeste.model.vo.ParametroAPPVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface ParametrosAPPDAO {
	public List<ParametroAPPVO> findAllByFechaActualizacion(Class<ParametroAPPVO> clase, long fechaActualizacion) throws DAOException;
}
