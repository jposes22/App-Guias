package es.server.java.torres_oeste.service.generic.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import es.server.java.torres_oeste.model.generic.DaoBase;
import es.server.java.torres_oeste.service.converter.GenericConverter;
import es.server.java.torres_oeste.service.generic.ServiceBase;
import es.server.java.torres_oeste.utilidades.errores.DAOException;


public class ServiceBaseImpl<T extends Serializable,Y extends Serializable> implements ServiceBase<T,Y> {
	
	@Autowired
	private DaoBase<T> daoBase;

	public DaoBase<T> getDaoBase() {
		return daoBase;
	}
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Y> getAllByFechaActualizacion(Class<T> claset,Class<Y> clasey, long fechaActualizacion) throws Exception {
		try {
			return GenericConverter.toDto(daoBase.findAllByFechaActualizacion(claset, fechaActualizacion), clasey);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}



	

}
