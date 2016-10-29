package es.server.java.baronha.service.idioma_app.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import es.server.java.baronha.model.idioma_app.IdiomaAPPDAO;
import es.server.java.baronha.model.vo.IdiomaAPPVO;
import es.server.java.baronha.service.converter.GenericConverter;
import es.server.java.baronha.service.idioma_app.IdiomaAPPService;
import es.server.java.baronha.view.dto.IdiomaAPPDTO;

public class IdiomaAPPServiceImpl implements IdiomaAPPService {
	
	private static final Logger LOGGER = Logger.getLogger(IdiomaAPPServiceImpl.class.getName());
	
	@Autowired
	IdiomaAPPDAO idiomaAPPDAO;

	public IdiomaAPPDAO getIdiomaAPPDAO() {
		return idiomaAPPDAO;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<IdiomaAPPDTO> getAllByFechaActualizacion(long fechaActualizacion) throws Exception {
		try {
			return GenericConverter.toDto(idiomaAPPDAO.findAllByFechaActualizacion(IdiomaAPPVO.class, fechaActualizacion), IdiomaAPPDTO.class);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
	

}
