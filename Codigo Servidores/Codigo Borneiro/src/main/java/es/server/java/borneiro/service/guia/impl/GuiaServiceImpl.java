package es.server.java.borneiro.service.guia.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import es.server.java.borneiro.model.guia.GuiaDAO;
import es.server.java.borneiro.model.guia.GuiaDetalleDAO;
import es.server.java.borneiro.model.guia.GuiaSaberMasDAO;
import es.server.java.borneiro.model.guia.GuiaSaberMasDetalleDAO;
import es.server.java.borneiro.model.vo.GuiaDetalleVO;
import es.server.java.borneiro.model.vo.GuiaSaberMasDetalleVO;
import es.server.java.borneiro.model.vo.GuiaSaberMasVO;
import es.server.java.borneiro.model.vo.GuiaVO;
import es.server.java.borneiro.service.converter.GenericConverter;
import es.server.java.borneiro.service.guia.GuiaService;
import es.server.java.borneiro.view.dto.GuiaDTO;
import es.server.java.borneiro.view.dto.GuiaDetalleDTO;
import es.server.java.borneiro.view.dto.GuiaSaberMasDTO;
import es.server.java.borneiro.view.dto.GuiaSaberMasDetalleDTO;

public class GuiaServiceImpl implements GuiaService{

private static final Logger LOGGER = Logger.getLogger(GuiaServiceImpl.class.getName());
	
	@Autowired
	GuiaDAO guiaDAO;
	@Autowired
	GuiaDetalleDAO guiaDetalleDAO;
	@Autowired
	GuiaSaberMasDAO guiaSaberMasDAO;
	@Autowired
	GuiaSaberMasDetalleDAO guiaSaberMasDetalleDAO;

	public GuiaDAO getGuiaDAO() {
		return guiaDAO;
	}

	public GuiaDetalleDAO getGuiaDetalleDAO() {
		return guiaDetalleDAO;
	}

	public GuiaSaberMasDAO getGuiaSaberMasDAO() {
		return guiaSaberMasDAO;
	}

	public GuiaSaberMasDetalleDAO getGuiaSaberMasDetalleDAO() {
		return guiaSaberMasDetalleDAO;
	}



	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<GuiaDTO> getAllByFechaActualizacion(long fechaActualizacion,String lang) throws Exception {
		try {
			return GenericConverter.toDtoLanguage(guiaDAO.findAllByFechaActualizacion(GuiaVO.class, fechaActualizacion), GuiaDTO.class, lang);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
	

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<GuiaDetalleDTO> getAllByFechaActualizacionGuiaDetalle(long fechaActualizacion,String lang) throws Exception {
		try {
			return GenericConverter.toDtoLanguage(guiaDetalleDAO.findAllByFechaActualizacion(GuiaDetalleVO.class, fechaActualizacion), GuiaDetalleDTO.class, lang);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<GuiaSaberMasDTO> getAllByFechaActualizacionGuiaSaberMas(long fechaActualizacion,String lang) throws Exception {
		try {
			return GenericConverter.toDtoLanguage(guiaSaberMasDAO.findAllByFechaActualizacion(GuiaSaberMasVO.class, fechaActualizacion), GuiaSaberMasDTO.class, lang);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<GuiaSaberMasDetalleDTO> getAllByFechaActualizacionGuiaSaberMasDetalle(long fechaActualizacion,String lang) throws Exception {
		try {
			return GenericConverter.toDtoLanguage(guiaSaberMasDetalleDAO.findAllByFechaActualizacion(GuiaSaberMasDetalleVO.class, fechaActualizacion), GuiaSaberMasDetalleDTO.class, lang);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e);
			throw e;
		} 
	}
}
