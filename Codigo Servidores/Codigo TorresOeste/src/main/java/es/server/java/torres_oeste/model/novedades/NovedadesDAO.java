package es.server.java.torres_oeste.model.novedades;

import java.util.List;

import es.server.java.torres_oeste.model.vo.NovedadVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface NovedadesDAO {

	public List<NovedadVO> findAllByFechaActualizacion(Class<NovedadVO> clase, long fechaActualizacion) throws DAOException;
}
