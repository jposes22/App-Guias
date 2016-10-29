package es.server.java.torres_oeste.service.idioma_app;

import java.util.List;

import es.server.java.torres_oeste.model.vo.IdiomaAPPVO;
import es.server.java.torres_oeste.view.dto.IdiomaAPPDTO;

public interface IdiomaAPPService {

	List<IdiomaAPPDTO> getAllByFechaActualizacion(long fechaActualizacion) throws Exception;

}
