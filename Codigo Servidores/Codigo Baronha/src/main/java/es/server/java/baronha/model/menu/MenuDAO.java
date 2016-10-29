package es.server.java.baronha.model.menu;

import java.util.List;

import es.server.java.baronha.model.vo.MenuVO;
import es.server.java.baronha.model.vo.NovedadVO;
import es.server.java.baronha.utilidades.errores.DAOException;

public interface MenuDAO {

	public List<MenuVO> findAllByFechaActualizacion(Class<MenuVO> clase, long fechaActualizacion) throws DAOException;
}
