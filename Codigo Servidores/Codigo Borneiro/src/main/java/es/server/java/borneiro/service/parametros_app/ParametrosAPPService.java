package es.server.java.borneiro.service.parametros_app;

import java.util.List;

import es.server.java.borneiro.view.dto.ParametroAPPDTO;

public interface ParametrosAPPService{

	public List<ParametroAPPDTO> getAllByFechaActualizacion(long fechaActualizacion) throws Exception;

}
