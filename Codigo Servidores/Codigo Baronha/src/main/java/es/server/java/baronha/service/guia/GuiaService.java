package es.server.java.baronha.service.guia;

import java.util.List;

import es.server.java.baronha.view.dto.GuiaDTO;
import es.server.java.baronha.view.dto.GuiaDetalleDTO;
import es.server.java.baronha.view.dto.GuiaSaberMasDTO;
import es.server.java.baronha.view.dto.GuiaSaberMasDetalleDTO;

public interface GuiaService {
	
	List<GuiaDTO> getAllByFechaActualizacion(long fechaActualizacion, String lang) throws Exception;

	List<GuiaDetalleDTO> getAllByFechaActualizacionGuiaDetalle(long fechaActualizacion, String lang) throws Exception;

	List<GuiaSaberMasDTO> getAllByFechaActualizacionGuiaSaberMas(long fechaActualizacion, String lang) throws Exception;

	List<GuiaSaberMasDetalleDTO> getAllByFechaActualizacionGuiaSaberMasDetalle(long fechaActualizacion, String lang)
			throws Exception;

}
