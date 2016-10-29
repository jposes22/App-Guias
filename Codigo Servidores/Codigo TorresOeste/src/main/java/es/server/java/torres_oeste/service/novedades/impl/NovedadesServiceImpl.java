package es.server.java.torres_oeste.service.novedades.impl;
 
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import es.server.java.torres_oeste.model.novedades.NovedadesDAO;
import es.server.java.torres_oeste.model.vo.NovedadVO;
import es.server.java.torres_oeste.service.converter.GenericConverter;
import es.server.java.torres_oeste.service.novedades.NovedadesService;
import es.server.java.torres_oeste.view.dto.NovedadDTO;

public class NovedadesServiceImpl implements NovedadesService {
	
	private static final Logger LOGGER = Logger.getLogger(NovedadesServiceImpl.class.getName());
	
	@Autowired
	private NovedadesDAO novedadesDAO;

	public NovedadesDAO getNovedadesDAO() {
		return novedadesDAO;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<NovedadDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception{
		try {
			return GenericConverter.toDtoLanguage(novedadesDAO.findAllByFechaActualizacion(NovedadVO.class, fechaActualizacion),NovedadDTO.class,lang);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
	
	
	

}
