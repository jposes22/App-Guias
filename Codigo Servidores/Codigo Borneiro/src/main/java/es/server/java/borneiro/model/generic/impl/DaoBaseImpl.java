package es.server.java.borneiro.model.generic.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.type.Type;

import es.server.java.borneiro.model.generic.DaoBase;
import es.server.java.borneiro.utilidades.errores.DAOException;



public class DaoBaseImpl<T extends Serializable> implements DaoBase<T> {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	@SuppressWarnings("unchecked")
	public T findById(Class<T> clase, Integer id) throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			T obj = (T) session.get(clase, id);
			return obj;
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<T> findAllByFechaActualizacion(Class<T> clase, long fechaActualizacion) throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			return session.createCriteria(clase).add(Restrictions.gt("fechaActualizacion", fechaActualizacion)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
			//return session.createCriteria(clase).list();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new DAOException(e);
		}
	}

	@SuppressWarnings("unchecked")
	public T findByObject(Class<T> clase, T id) throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			T obj = (T) session.get(clase, id);
			return obj;
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(Class<T> clase) throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			return session.createCriteria(clase).list();
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

	public Serializable save(T t) throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			Serializable id = session.save(t);
			return id;
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

	public T saveOrUpdate(T t) throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			session.saveOrUpdate(t);
			return t;
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

	public T update(T t) throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			session.update(t);
			return t;
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

	public void delete(T t) throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			session.delete(t);
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

	public Query getQuery(String query, Class<T> entity, String prefijo)
			throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			return session.createSQLQuery(query).addEntity(prefijo, entity);
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

	public Query getQuery(String query, String columnAlias, Type type)
			throws DAOException {
		try {
			Session session = getSessionFactory().getCurrentSession();
			return session.createSQLQuery(query).addScalar(columnAlias, type);
		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

}
