package es.server.java.torres_oeste.model.guia;

import java.util.List;

import es.server.java.torres_oeste.model.vo.GuiaDetalleVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface GuiaDetalleDAO {
	public List<GuiaDetalleVO> findAllByFechaActualizacion(Class<GuiaDetalleVO> clase, long fechaActualizacion) throws DAOException;
}
