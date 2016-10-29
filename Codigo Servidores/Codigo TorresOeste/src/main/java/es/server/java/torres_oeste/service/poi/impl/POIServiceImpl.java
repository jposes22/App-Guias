package es.server.java.torres_oeste.service.poi.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import es.server.java.torres_oeste.model.poi.POIDAO;
import es.server.java.torres_oeste.model.vo.POIVO;
import es.server.java.torres_oeste.service.converter.GenericConverter;
import es.server.java.torres_oeste.service.poi.POIService;
import es.server.java.torres_oeste.view.dto.POIDTO;

public class POIServiceImpl implements POIService {
	
	private static final Logger LOGGER = Logger.getLogger(POIServiceImpl.class.getName());
	
	@Autowired
	private POIDAO poiDAO;

	public POIDAO getPoiDAO() {
		return poiDAO;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<POIDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception{
		try {
			return GenericConverter.toDtoLanguage(poiDAO.findAllByFechaActualizacion(POIVO.class, fechaActualizacion),POIDTO.class,lang);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
}
