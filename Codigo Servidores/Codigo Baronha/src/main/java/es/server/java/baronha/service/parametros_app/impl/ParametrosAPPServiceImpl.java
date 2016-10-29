package es.server.java.baronha.service.parametros_app.impl;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import es.server.java.baronha.model.parametros_app.ParametrosAPPDAO;
import es.server.java.baronha.model.vo.ParametroAPPVO;
import es.server.java.baronha.service.converter.GenericConverter;
import es.server.java.baronha.service.parametros_app.ParametrosAPPService;
import es.server.java.baronha.view.dto.ParametroAPPDTO;

public class ParametrosAPPServiceImpl implements ParametrosAPPService {

	private static final Logger LOGGER = Logger.getLogger(ParametrosAPPServiceImpl.class.getName());
	
	
	@Autowired
	private ParametrosAPPDAO parametrosAPPDAO;

	public ParametrosAPPDAO getParametrosAPPDAO() {
		return parametrosAPPDAO;
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ParametroAPPDTO> getAllByFechaActualizacion(long fechaActualizacion) throws Exception{
		try {
			return GenericConverter.toDto(parametrosAPPDAO.findAllByFechaActualizacion(ParametroAPPVO.class, fechaActualizacion),ParametroAPPDTO.class);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
	
}
