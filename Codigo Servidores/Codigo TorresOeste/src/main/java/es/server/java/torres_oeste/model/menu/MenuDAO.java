package es.server.java.torres_oeste.model.menu;

import java.util.List;

import es.server.java.torres_oeste.model.vo.MenuVO;
import es.server.java.torres_oeste.model.vo.NovedadVO;
import es.server.java.torres_oeste.utilidades.errores.DAOException;

public interface MenuDAO {

	public List<MenuVO> findAllByFechaActualizacion(Class<MenuVO> clase, long fechaActualizacion) throws DAOException;
}
