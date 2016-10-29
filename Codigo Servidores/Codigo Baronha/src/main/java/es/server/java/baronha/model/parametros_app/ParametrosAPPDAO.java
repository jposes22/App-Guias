package es.server.java.baronha.model.parametros_app;

import java.util.List;

import es.server.java.baronha.model.vo.ParametroAPPVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface ParametrosAPPDAO {
	public List<ParametroAPPVO> findAllByFechaActualizacion(Class<ParametroAPPVO> clase, long fechaActualizacion) throws DAOException;
}
