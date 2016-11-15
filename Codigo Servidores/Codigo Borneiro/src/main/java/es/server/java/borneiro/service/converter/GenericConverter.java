/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.server.java.borneiro.service.converter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.dozer.DozerBeanMapperSingletonWrapper;

import es.server.java.borneiro.model.vo.GenericLanguageVO;
import es.server.java.borneiro.view.dto.GenericLanguageDTO;
import es.server.java.borneiro.model.vo.GuiaSaberMasVO;
import es.server.java.borneiro.model.vo.GuiaVO;
import es.server.java.borneiro.view.dto.GuiaDTO;
import es.server.java.borneiro.view.dto.GuiaSaberMasDTO;


/**
 * Clase para realizar conversiones de entidades 'AbstractEntity' a
 * cualquier otro objeto y viceversa
 *
 */
public class GenericConverter {

    /**
     * Convierte una entidad en una nueva instancia de la clase especificada
     * @param <T> Tipo de la nueva instancia
     * @param entity Entidad a convertir
     * @param clazz Clase de la nueva instancia
     * @return Resultado de la conversi&oacute;n
     */
    public static <T> T toDto(Object entity, Class<T> clazz) {
    	
    	if (entity == null) {
			return null;
		}
    	
        return DozerBeanMapperSingletonWrapper.getInstance().map(entity, clazz);
    }

    /**
     * Convierte una lista de entidades en una nueva lista de la clase especificada
     * @param <T> Tipo de la nueva instancia
     * @param list Lista de entidades a convertir
     * @param clazz Clase de los elementos de la nueva lista
     * @return Resultado de la conversi&oacute;n
     */
    public static <T> List<T> toDto(Collection<?> list, Class<T> clazz) {

		if (list == null) {
			return null;
		}

		List<T> transformedList = new ArrayList<T>();
		for (Object o : list) {
			transformedList.add(toDto(o, clazz));
		}

		return transformedList;
	}
    
    /**
     * Convierte un objeto en una nueva instancia de la entidad especificada
     * @param <T> Tipo de la entidad
     * @param dto Objeto a convertir
     * @param clazz Clase entidad de destino
     * @return Resultado de la conversi&oacute;n
     */
    public static <T extends Object> T toEntity(Object dto, Class<T> clazz) {
    	
    	if (dto == null) {
    		return null;
    	}
       
    	return DozerBeanMapperSingletonWrapper.getInstance().map(dto, clazz);
    }
    /**
     * Convierte una entidad en una nueva instancia de la clase especificada applicando el idioma
     * @param <T> Tipo de la nueva instancia
     * @param list Lista de entidades a convertir
     * @param clazz Clase de los elementos de la nueva lista
     * @param lang String del idioma a convertir
     * @return Resultado de la conversi&oacute;n
     */
    public static <T> List<T> toDtoLanguage(Collection<?> list, Class<T> clazz,String lang) {

  		if (list == null) {
  			return null;
  		}

  		List<T> transformedList = new ArrayList<T>();
  		for (Object o : list) {
  			transformedList.add(toDtoLanguage(o, clazz,lang));
  		}

  		return transformedList;
  	}
    /**
     * Convierte una entidad en una nueva instancia de la clase especificada applicando el idioma
     * @param <T> Tipo de la nueva instancia
     * @param entity Entidad a convertir
     * @param clazz Clase de la nueva instancia
     * @param lang String del idioma a convertir
     * @return Resultado de la conversi&oacute;n
     */
    //Quitamos reflect.Field; reflection y ponemos esta ñapa para poder tener audio guías rápidamente en varios idiomas
    public static <T> T toDtoLanguage(Object entity, Class<T> clazz, String lang) {
    	
    	if (entity == null) {
			return null;
		}
    	
        T aux =  DozerBeanMapperSingletonWrapper.getInstance().map(entity, clazz);
        if (entity == GenericLanguageVO.class || GenericLanguageVO.class.isAssignableFrom(entity.getClass())) {
           	switch (lang) {
			case "es":
				((GenericLanguageDTO)aux).setDescripcion(((GenericLanguageVO)entity).getDescripcionEs());
				((GenericLanguageDTO)aux).setTitulo(((GenericLanguageVO)entity).getTituloEs());
				break;
			case "gl":
				((GenericLanguageDTO)aux).setDescripcion(((GenericLanguageVO)entity).getDescripcionGl());
				((GenericLanguageDTO)aux).setTitulo(((GenericLanguageVO)entity).getTituloGl());
				break;
			case "en":
				((GenericLanguageDTO)aux).setDescripcion(((GenericLanguageVO)entity).getDescripcionEn());
				((GenericLanguageDTO)aux).setTitulo(((GenericLanguageVO)entity).getTituloEn());
			default:
				break;
			}  	
        }
    	if(entity == GuiaVO.class || GuiaVO.class.isAssignableFrom(entity.getClass()) ){
          	 switch (lang){
          	case "es":
				((GuiaDTO)aux).setUrlAudioGuia(((GuiaVO)entity).getUrlAudioGuiaEs());
				break;
			case "gl":
				((GuiaDTO)aux).setUrlAudioGuia(((GuiaVO)entity).getUrlAudioGuiaGl());
				break;
			case "en":
				((GuiaDTO)aux).setUrlAudioGuia(((GuiaVO)entity).getUrlAudioGuiaEn());
				break;
          	 }
         }
    	
    	if(entity == GuiaSaberMasVO.class || GuiaSaberMasVO.class.isAssignableFrom(entity.getClass()) ){
         	 switch (lang){
         	case "es":
				((GuiaSaberMasDTO)aux).setUrlAudioGuia(((GuiaSaberMasVO)entity).getUrlAudioGuiaEs());
				break;
			case "gl":
				((GuiaSaberMasDTO)aux).setUrlAudioGuia(((GuiaSaberMasVO)entity).getUrlAudioGuiaGl());
				break;
			case "en":
				((GuiaSaberMasDTO)aux).setUrlAudioGuia(((GuiaSaberMasVO)entity).getUrlAudioGuiaEn());
				break;
         	 }
        }
   	
    	
        return aux;
    }
    
    
}
