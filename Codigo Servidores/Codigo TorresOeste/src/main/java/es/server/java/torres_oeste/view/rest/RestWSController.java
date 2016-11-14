package es.server.java.torres_oeste.view.rest;

import java.io.IOException;
import java.io.RandomAccessFile;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import es.server.java.torres_oeste.service.guia.GuiaService;
import es.server.java.torres_oeste.service.idioma_app.IdiomaAPPService;
import es.server.java.torres_oeste.service.menu.MenuService;
import es.server.java.torres_oeste.service.novedades.NovedadesService;
import es.server.java.torres_oeste.service.parametros_app.ParametrosAPPService;
import es.server.java.torres_oeste.service.poi.POIService;
import es.server.java.torres_oeste.utilidades.constantes.ConstantesServer;
import es.server.java.torres_oeste.utilidades.generic.Generic;
import es.server.java.torres_oeste.view.dto.DescargableDTO;
import es.server.java.torres_oeste.view.dto.GuiaDTO;
import es.server.java.torres_oeste.view.dto.GuiaDetalleDTO;
import es.server.java.torres_oeste.view.dto.GuiaSaberMasDTO;
import es.server.java.torres_oeste.view.dto.GuiaSaberMasDetalleDTO;
import es.server.java.torres_oeste.view.dto.IdiomaAPPDTO;
import es.server.java.torres_oeste.view.dto.MenuDTO;
import es.server.java.torres_oeste.view.dto.NovedadDTO;
import es.server.java.torres_oeste.view.dto.POIDTO;
import es.server.java.torres_oeste.view.dto.ParametroAPPDTO;



@RestController()
@RequestMapping("/rest")
@EnableScheduling

public class RestWSController {

	/*
		URLS WebServices
	*/

	private static final String URL_GET_PARAMETROS = "WSParametros/getParametros/{fechaActualizacion}";
	private static final String URL_GET_MENU = "WSMenu/getMenu/{fechaActualizacion}/{lang}";
	private static final String URL_GET_IDIOMA_APP = "WSIdioma/getIdioma/{fechaActualizacion}";
	private static final String URL_GET_NOVEDADES = "WSNovedades/getNovedades/{fechaActualizacion}/{lang}";
	private static final String URL_GET_POIS = "WSPOIS/getPOIs/{fechaActualizacion}/{lang}";
	
	private static final String URL_GET_GUIAS = "WSGuias/getGuias/{fechaActualizacion}/{lang}";
	private static final String URL_GET_GUIAS_DETALLE = "WSGuias/getGuiasDetalle/{fechaActualizacion}/{lang}";
	private static final String URL_GET_GUIAS_SABER_MAS = "WSGuias/getGuiasSaberMas/{fechaActualizacion}/{lang}";
	private static final String URL_GET_GUIAS_SABER_MAS_DETALLE = "WSGuias/getGuiasSaberMasDetalle/{fechaActualizacion}/{lang}";
	
	private static final String URL_GET_IMAGES = "WSImages/getImage/{idImagen:.+}";
	private static final String URL_GET_AUDIO_GUIAS = "WSAudioGuia/getAudio/{idAudioGuia:.+}";
	
	private static final Logger LOGGER = Logger
			.getLogger(RestWSController.class.getName());
	

	/*
	 * Services
	 * */
	
	@Autowired
	private NovedadesService novedadesService;
	
	@Autowired
	private ParametrosAPPService parametrosAPPService;
	
	@Autowired 
	private MenuService menuService;
	
	@Autowired
	private IdiomaAPPService idiomaAPPService;
	
	@Autowired
	private POIService poiService;
	
	@Autowired
	private GuiaService guiaService;
	
	/*
	 * WebServices
	 * */
	
	@RequestMapping(value = URL_GET_NOVEDADES, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<NovedadDTO>> getNovedades(@PathVariable long fechaActualizacion, @PathVariable String lang) {
		try {
			final DescargableDTO<NovedadDTO> listNovedades = new DescargableDTO<NovedadDTO>();
			listNovedades.setFechaDesde(fechaActualizacion);
			listNovedades.setFechaHasta(Generic.getFechaActual()); 
			listNovedades.setResultados(novedadesService.getAllByFechaActualizacion(fechaActualizacion,lang));
			return new ResponseEntity<DescargableDTO<NovedadDTO>>(listNovedades, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<NovedadDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = URL_GET_PARAMETROS, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<ParametroAPPDTO>> getParametros(@PathVariable long fechaActualizacion) {
		try {
			final DescargableDTO<ParametroAPPDTO> listParametros = new DescargableDTO<ParametroAPPDTO>();
			listParametros.setFechaDesde(fechaActualizacion);
			listParametros.setFechaHasta(Generic.getFechaActual()); 
			listParametros.setResultados(parametrosAPPService.getAllByFechaActualizacion(fechaActualizacion));
			return new ResponseEntity<DescargableDTO<ParametroAPPDTO>>(listParametros, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<ParametroAPPDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	//
	@RequestMapping(value = URL_GET_MENU, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<MenuDTO>> getMenu(@PathVariable long fechaActualizacion, @PathVariable String lang) {
		try {
			final DescargableDTO<MenuDTO> listMenu = new DescargableDTO<MenuDTO>();
			listMenu.setFechaDesde(fechaActualizacion);
			listMenu.setFechaHasta(Generic.getFechaActual()); 
			listMenu.setResultados(menuService.getAllByFechaActualizacion(fechaActualizacion,lang));
			return new ResponseEntity<DescargableDTO<MenuDTO>>(listMenu, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<MenuDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = URL_GET_IDIOMA_APP, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<IdiomaAPPDTO>> getIdioma(@PathVariable long fechaActualizacion) {
		try {
			final DescargableDTO<IdiomaAPPDTO> listIdiomas = new DescargableDTO<IdiomaAPPDTO>();
			listIdiomas.setFechaDesde(fechaActualizacion);
			listIdiomas.setFechaHasta(Generic.getFechaActual()); 
			listIdiomas.setResultados(idiomaAPPService.getAllByFechaActualizacion(fechaActualizacion));
			return new ResponseEntity<DescargableDTO<IdiomaAPPDTO>>(listIdiomas, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<IdiomaAPPDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = URL_GET_POIS, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<POIDTO>> getPOIs(@PathVariable long fechaActualizacion, @PathVariable String lang) {
		try {
			final DescargableDTO<POIDTO> listPois = new DescargableDTO<POIDTO>();
			listPois.setFechaDesde(fechaActualizacion);
			listPois.setFechaHasta(Generic.getFechaActual()); 
			listPois.setResultados(poiService.getAllByFechaActualizacion(fechaActualizacion,lang));
			return new ResponseEntity<DescargableDTO<POIDTO>>(listPois, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<POIDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = URL_GET_GUIAS, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<GuiaDTO>> getGuias(@PathVariable long fechaActualizacion, @PathVariable String lang) {
		try {
			final DescargableDTO<GuiaDTO> listGuias = new DescargableDTO<GuiaDTO>();
			listGuias.setFechaDesde(fechaActualizacion);
			listGuias.setFechaHasta(Generic.getFechaActual()); 
			listGuias.setResultados(guiaService.getAllByFechaActualizacion(fechaActualizacion,lang));
			return new ResponseEntity<DescargableDTO<GuiaDTO>>(listGuias, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<GuiaDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = URL_GET_GUIAS_DETALLE, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<GuiaDetalleDTO>> getGuiasDetalle(@PathVariable long fechaActualizacion, @PathVariable String lang) {
		try {
			final DescargableDTO<GuiaDetalleDTO> listGuias = new DescargableDTO<GuiaDetalleDTO>();
			listGuias.setFechaDesde(fechaActualizacion);
			listGuias.setFechaHasta(Generic.getFechaActual()); 
			listGuias.setResultados(guiaService.getAllByFechaActualizacionGuiaDetalle(fechaActualizacion, lang));
			return new ResponseEntity<DescargableDTO<GuiaDetalleDTO>>(listGuias, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<GuiaDetalleDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = URL_GET_GUIAS_SABER_MAS, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<GuiaSaberMasDTO>> getGuiasSaberMas(@PathVariable long fechaActualizacion, @PathVariable String lang) {
		try {
			final DescargableDTO<GuiaSaberMasDTO> listGuias = new DescargableDTO<GuiaSaberMasDTO>();
			listGuias.setFechaDesde(fechaActualizacion);
			listGuias.setFechaHasta(Generic.getFechaActual()); 
			listGuias.setResultados(guiaService.getAllByFechaActualizacionGuiaSaberMas(fechaActualizacion, lang));
			return new ResponseEntity<DescargableDTO<GuiaSaberMasDTO>>(listGuias, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<GuiaSaberMasDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@RequestMapping(value = URL_GET_GUIAS_SABER_MAS_DETALLE, method = RequestMethod.GET)
	public ResponseEntity<DescargableDTO<GuiaSaberMasDetalleDTO>> getGuiasSaberMasDetalle(@PathVariable long fechaActualizacion, @PathVariable String lang) {
		try {
			final DescargableDTO<GuiaSaberMasDetalleDTO> listGuias = new DescargableDTO<GuiaSaberMasDetalleDTO>();
			listGuias.setFechaDesde(fechaActualizacion);
			listGuias.setFechaHasta(Generic.getFechaActual()); 
			listGuias.setResultados(guiaService.getAllByFechaActualizacionGuiaSaberMasDetalle(fechaActualizacion, lang));
			return new ResponseEntity<DescargableDTO<GuiaSaberMasDetalleDTO>>(listGuias, HttpStatus.OK); 
		} catch (Exception ex) {
			LOGGER.error(ex);
			ex.printStackTrace();
			return new ResponseEntity<DescargableDTO<GuiaSaberMasDetalleDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	//WS IMAGES
	@RequestMapping(value = URL_GET_IMAGES, produces = {MediaType.IMAGE_PNG_VALUE, 
            MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_GIF_VALUE})
    public ResponseEntity<byte[]> getImage(@PathVariable String idImagen) throws IOException {
	 
    	 try{
    		 //TODO: change in production
    		 @SuppressWarnings("resource")
			RandomAccessFile inputStrean = new RandomAccessFile(ConstantesServer.URL_IMAGES_APP_LOCAL+ idImagen , "r");
    		 byte[] document = new byte[(int) inputStrean.length()];
        	 inputStrean.readFully(document);
            // Create a byte array output stream.
    		return new ResponseEntity<byte[]>(document,HttpStatus.OK);
    	 }catch (Exception e) {
    		 LOGGER.error(e);
    		 return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}       
    }
    //audio/mpeg
    @RequestMapping(value = URL_GET_AUDIO_GUIAS)
    public ResponseEntity<byte[]> getAudio(@PathVariable String idAudioGuia) throws IOException {
	 
    	 try{
    		 //TODO: change in production
    		 @SuppressWarnings("resource")
			RandomAccessFile inputStrean = new RandomAccessFile(ConstantesServer.URL_IMAGES_APP_LOCAL+ idAudioGuia , "r");
    		 byte[] document = new byte[(int) inputStrean.length()];
        	 inputStrean.readFully(document);
            // Create a byte array output stream.
    		return new ResponseEntity<byte[]>(document,HttpStatus.OK);
    	 }catch (Exception e) {
    		 LOGGER.error(e);
    		 return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}       
    }
	
	//WS AUDIOGUíAS
	
}
