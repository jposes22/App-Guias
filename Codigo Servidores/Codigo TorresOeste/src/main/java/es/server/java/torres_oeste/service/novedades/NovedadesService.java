package es.server.java.torres_oeste.service.novedades;

import java.util.List;

import es.server.java.torres_oeste.view.dto.NovedadDTO;

public interface NovedadesService {

	public List<NovedadDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception;
	

}
