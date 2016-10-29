package es.server.java.borneiro.model.guia;

import java.util.List;

import es.server.java.borneiro.model.vo.GuiaDetalleVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface GuiaDetalleDAO {
	public List<GuiaDetalleVO> findAllByFechaActualizacion(Class<GuiaDetalleVO> clase, long fechaActualizacion) throws DAOException;
}
