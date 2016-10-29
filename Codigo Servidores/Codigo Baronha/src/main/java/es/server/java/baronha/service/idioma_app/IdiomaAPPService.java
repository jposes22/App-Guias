package es.server.java.baronha.service.idioma_app;

import java.util.List;

import es.server.java.baronha.model.vo.IdiomaAPPVO;
import es.server.java.baronha.view.dto.IdiomaAPPDTO;

public interface IdiomaAPPService {

	List<IdiomaAPPDTO> getAllByFechaActualizacion(long fechaActualizacion) throws Exception;

}
