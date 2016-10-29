package es.server.java.torres_oeste.service.menu;

import java.util.List;

import es.server.java.torres_oeste.view.dto.MenuDTO;

public interface MenuService {

	List<MenuDTO> getAllByFechaActualizacion(long fechaActualizacion, String lang) throws Exception;

}
