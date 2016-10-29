package es.server.java.borneiro.service.poi;

import java.util.List;

import es.server.java.borneiro.view.dto.POIDTO;

public interface POIService {
	public List<POIDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception;

}
