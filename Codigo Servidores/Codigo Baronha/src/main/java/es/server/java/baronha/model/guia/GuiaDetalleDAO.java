package es.server.java.baronha.model.guia;

import java.util.List;

import es.server.java.baronha.model.vo.GuiaDetalleVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface GuiaDetalleDAO {
	public List<GuiaDetalleVO> findAllByFechaActualizacion(Class<GuiaDetalleVO> clase, long fechaActualizacion) throws DAOException;
}
