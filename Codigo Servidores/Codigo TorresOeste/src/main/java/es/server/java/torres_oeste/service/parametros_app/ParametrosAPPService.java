package es.server.java.torres_oeste.service.parametros_app;

import java.util.List;

import es.server.java.torres_oeste.view.dto.ParametroAPPDTO;

public interface ParametrosAPPService{

	public List<ParametroAPPDTO> getAllByFechaActualizacion(long fechaActualizacion) throws Exception;

}
