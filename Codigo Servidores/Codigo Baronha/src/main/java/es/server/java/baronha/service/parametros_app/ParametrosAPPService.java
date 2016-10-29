package es.server.java.baronha.service.parametros_app;

import java.util.List;

import es.server.java.baronha.view.dto.ParametroAPPDTO;

public interface ParametrosAPPService{

	public List<ParametroAPPDTO> getAllByFechaActualizacion(long fechaActualizacion) throws Exception;

}
