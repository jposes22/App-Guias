package es.server.java.borneiro.service.menu;

import java.util.List;

import es.server.java.borneiro.view.dto.MenuDTO;

public interface MenuService {

	List<MenuDTO> getAllByFechaActualizacion(long fechaActualizacion, String lang) throws Exception;

}
