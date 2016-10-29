package es.server.java.baronha.model.guia;

import java.util.List;

import es.server.java.baronha.model.vo.GuiaSaberMasDetalleVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface GuiaSaberMasDetalleDAO {
	public List<GuiaSaberMasDetalleVO> findAllByFechaActualizacion(Class<GuiaSaberMasDetalleVO> clase, long fechaActualizacion) throws DAOException;
}
