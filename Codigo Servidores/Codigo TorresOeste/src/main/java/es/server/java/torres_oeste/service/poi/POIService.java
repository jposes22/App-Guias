package es.server.java.torres_oeste.service.poi;

import java.util.List;

import es.server.java.torres_oeste.view.dto.POIDTO;

public interface POIService {
	public List<POIDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception;

}
