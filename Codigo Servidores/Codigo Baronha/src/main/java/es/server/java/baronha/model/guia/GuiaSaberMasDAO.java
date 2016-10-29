package es.server.java.baronha.model.guia;

import java.util.List;

import es.server.java.baronha.model.vo.GuiaSaberMasVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface GuiaSaberMasDAO {

	public List<GuiaSaberMasVO> findAllByFechaActualizacion(Class<GuiaSaberMasVO> clase, long fechaActualizacion) throws DAOException;

}
