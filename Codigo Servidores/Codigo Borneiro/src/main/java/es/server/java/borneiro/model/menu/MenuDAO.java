package es.server.java.borneiro.model.menu;

import java.util.List;

import es.server.java.borneiro.model.vo.MenuVO;
import es.server.java.borneiro.model.vo.NovedadVO;
import es.server.java.borneiro.utilidades.errores.DAOException;

public interface MenuDAO {

	public List<MenuVO> findAllByFechaActualizacion(Class<MenuVO> clase, long fechaActualizacion) throws DAOException;
}
