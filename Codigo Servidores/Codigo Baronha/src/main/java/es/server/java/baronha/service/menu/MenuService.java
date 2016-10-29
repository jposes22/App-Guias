package es.server.java.baronha.service.menu;

import java.util.List;

import es.server.java.baronha.view.dto.MenuDTO;

public interface MenuService {

	List<MenuDTO> getAllByFechaActualizacion(long fechaActualizacion, String lang) throws Exception;

}
