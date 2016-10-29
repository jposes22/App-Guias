package es.server.java.borneiro.service.novedades;

import java.util.List;

import es.server.java.borneiro.view.dto.NovedadDTO;

public interface NovedadesService {

	public List<NovedadDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception;
	

}
