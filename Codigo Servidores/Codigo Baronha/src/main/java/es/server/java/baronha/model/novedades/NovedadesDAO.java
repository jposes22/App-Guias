package es.server.java.baronha.model.novedades;

import java.util.List;

import es.server.java.baronha.model.vo.NovedadVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface NovedadesDAO {

	public List<NovedadVO> findAllByFechaActualizacion(Class<NovedadVO> clase, long fechaActualizacion) throws DAOException;
}
