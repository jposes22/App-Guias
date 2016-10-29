package es.server.java.baronha.service.menu.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import es.server.java.baronha.model.menu.MenuDAO;
import es.server.java.baronha.model.vo.MenuVO;
import es.server.java.baronha.service.converter.GenericConverter;
import es.server.java.baronha.service.menu.MenuService;
import es.server.java.baronha.view.dto.MenuDTO;

public class MenuServiceImpl implements MenuService {

	private static final Logger LOGGER = Logger.getLogger(MenuServiceImpl.class.getName());
	
	@Autowired
	private MenuDAO menuDAO;
	
	public MenuDAO getMenuDAO() {
		return menuDAO;
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MenuDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception {
		try {
			return GenericConverter.toDtoLanguage(menuDAO.findAllByFechaActualizacion(MenuVO.class, fechaActualizacion), MenuDTO.class, lang);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
}
