package es.server.java.borneiro.service.idioma_app;

import java.util.List;

import es.server.java.borneiro.model.vo.IdiomaAPPVO;
import es.server.java.borneiro.view.dto.IdiomaAPPDTO;

public interface IdiomaAPPService {

	List<IdiomaAPPDTO> getAllByFechaActualizacion(long fechaActualizacion) throws Exception;

}
