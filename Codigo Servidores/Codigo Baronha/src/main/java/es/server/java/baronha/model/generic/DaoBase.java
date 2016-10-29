package es.server.java.baronha.model.generic;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.type.Type;

import es.server.java.baronha.utilidades.errores.DAOException;



public interface DaoBase <T>{

	public List<T> findAllByFechaActualizacion(Class<T> clase, long fechaActualizacion) throws DAOException;
	
	Query getQuery(String query, String columnAlias, Type type)
			throws DAOException;

	Query getQuery(String query, Class<T> entity, String prefijo)
			throws DAOException;

}
