package es.server.java.borneiro.model.guia;

import java.util.List;

import es.server.java.borneiro.model.vo.GuiaSaberMasDetalleVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface GuiaSaberMasDetalleDAO {
	public List<GuiaSaberMasDetalleVO> findAllByFechaActualizacion(Class<GuiaSaberMasDetalleVO> clase, long fechaActualizacion) throws DAOException;
}
