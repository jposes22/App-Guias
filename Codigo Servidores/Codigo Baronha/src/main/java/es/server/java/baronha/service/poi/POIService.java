package es.server.java.baronha.service.poi;

import java.util.List;

import es.server.java.baronha.view.dto.POIDTO;

public interface POIService {
	public List<POIDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception;

}
