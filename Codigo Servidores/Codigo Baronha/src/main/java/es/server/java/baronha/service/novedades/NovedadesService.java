package es.server.java.baronha.service.novedades;

import java.util.List;

import es.server.java.baronha.view.dto.NovedadDTO;

public interface NovedadesService {

	public List<NovedadDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception;
	

}
