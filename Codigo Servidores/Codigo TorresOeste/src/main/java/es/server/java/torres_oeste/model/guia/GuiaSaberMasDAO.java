package es.server.java.torres_oeste.model.guia;

import java.util.List;

import es.server.java.torres_oeste.model.vo.GuiaSaberMasVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface GuiaSaberMasDAO {

	public List<GuiaSaberMasVO> findAllByFechaActualizacion(Class<GuiaSaberMasVO> clase, long fechaActualizacion) throws DAOException;

}
