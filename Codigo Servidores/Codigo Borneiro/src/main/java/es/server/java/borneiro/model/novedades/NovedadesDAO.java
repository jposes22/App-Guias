package es.server.java.borneiro.model.novedades;

import java.util.List;

import es.server.java.borneiro.model.vo.NovedadVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface NovedadesDAO {

	public List<NovedadVO> findAllByFechaActualizacion(Class<NovedadVO> clase, long fechaActualizacion) throws DAOException;
}
