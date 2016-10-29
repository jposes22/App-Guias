package es.server.java.borneiro.model.guia;

import java.util.List;

import es.server.java.borneiro.model.vo.GuiaSaberMasVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface GuiaSaberMasDAO {

	public List<GuiaSaberMasVO> findAllByFechaActualizacion(Class<GuiaSaberMasVO> clase, long fechaActualizacion) throws DAOException;

}
