package es.server.java.baronha.service.generic;

import java.util.List;

public interface ServiceBase <T,Y> {
 
	List<Y> getAllByFechaActualizacion(Class<T> claset, Class<Y> clasey, long fechaActualizacion) throws Exception;
	

}
