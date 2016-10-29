package es.server.java.torres_oeste.model.guia;

import java.util.List;

import es.server.java.torres_oeste.model.vo.GuiaSaberMasDetalleVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface GuiaSaberMasDetalleDAO {
	public List<GuiaSaberMasDetalleVO> findAllByFechaActualizacion(Class<GuiaSaberMasDetalleVO> clase, long fechaActualizacion) throws DAOException;
}
