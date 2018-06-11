package cn.hncj.hotel.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Filter;
import org.hibernate.HibernateException;
import org.hibernate.Interceptor;
import org.hibernate.LockMode;
import org.hibernate.ReplicationMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.support.SQLExceptionTranslator;
import org.springframework.orm.hibernate3.HibernateCallback;

import cn.hncj.hotel.dao.BaseDaoImpl;

public class ServiceDelegationDao {
	@Resource(name = "baseDao")
	BaseDaoImpl baseDao;

	public void afterPropertiesSet() {
		baseDao.afterPropertiesSet();
	}

	public int bulkUpdate(String queryString, Object... values) throws DataAccessException {
		return baseDao.bulkUpdate(queryString, values);
	}

	public int bulkUpdate(String queryString, Object value) throws DataAccessException {
		return baseDao.bulkUpdate(queryString, value);
	}

	public int bulkUpdate(String queryString) throws DataAccessException {
		return baseDao.bulkUpdate(queryString);
	}

	public void clear() throws DataAccessException {
		baseDao.clear();
	}

	public void closeIterator(Iterator arg0) throws DataAccessException {
		baseDao.closeIterator(arg0);
	}

	public boolean contains(Object entity) throws DataAccessException {
		return baseDao.contains(entity);
	}

	public DataAccessException convertHibernateAccessException(HibernateException ex) {
		return baseDao.convertHibernateAccessException(ex);
	}

	public void delete(Object entity, LockMode lockMode) throws DataAccessException {
		baseDao.delete(entity, lockMode);
	}

	public void delete(Object entity) throws DataAccessException {
		baseDao.delete(entity);
	}

	public void delete(String entityName, Object entity, LockMode lockMode) throws DataAccessException {
		baseDao.delete(entityName, entity, lockMode);
	}

	public void delete(String entityName, Object entity) throws DataAccessException {
		baseDao.delete(entityName, entity);
	}

	public void deleteAll(Collection entities) throws DataAccessException {
		baseDao.deleteAll(entities);
	}

	public Filter enableFilter(String filterName) throws IllegalStateException {
		return baseDao.enableFilter(filterName);
	}

	public boolean equals(Object obj) {
		return baseDao.equals(obj);
	}

	public void evict(Object entity) throws DataAccessException {
		baseDao.evict(entity);
	}

	public <T> T execute(HibernateCallback<T> action) throws DataAccessException {
		return baseDao.execute(action);
	}

	public List executeFind(HibernateCallback<?> action) throws DataAccessException {
		return baseDao.executeFind(action);
	}

	public <T> T executeWithNativeSession(HibernateCallback<T> action) {
		return baseDao.executeWithNativeSession(action);
	}

	public <T> T executeWithNewSession(HibernateCallback<T> action) {
		return baseDao.executeWithNewSession(action);
	}

	public List find(String queryString, Object... values) throws DataAccessException {
		return baseDao.find(queryString, values);
	}

	public List find(String queryString, Object value) throws DataAccessException {
		return baseDao.find(queryString, value);
	}

	public List find(String queryString) throws DataAccessException {
		return baseDao.find(queryString);
	}

	public List findByCriteria(DetachedCriteria criteria, int firstResult, int maxResults) throws DataAccessException {
		return baseDao.findByCriteria(criteria, firstResult, maxResults);
	}

	public List findByCriteria(DetachedCriteria criteria) throws DataAccessException {
		return baseDao.findByCriteria(criteria);
	}

	public List findByExample(Object exampleEntity, int firstResult, int maxResults) throws DataAccessException {
		return baseDao.findByExample(exampleEntity, firstResult, maxResults);
	}

	public List findByExample(Object exampleEntity) throws DataAccessException {
		return baseDao.findByExample(exampleEntity);
	}

	public List findByExample(String entityName, Object exampleEntity, int firstResult, int maxResults)
			throws DataAccessException {
		return baseDao.findByExample(entityName, exampleEntity, firstResult, maxResults);
	}

	public List findByExample(String entityName, Object exampleEntity) throws DataAccessException {
		return baseDao.findByExample(entityName, exampleEntity);
	}

	public List findByNamedParam(String queryString, String paramName, Object value) throws DataAccessException {
		return baseDao.findByNamedParam(queryString, paramName, value);
	}

	public List findByNamedParam(String queryString, String[] paramNames, Object[] values) throws DataAccessException {
		return baseDao.findByNamedParam(queryString, paramNames, values);
	}

	public List findByNamedQuery(String queryName, Object... values) throws DataAccessException {
		return baseDao.findByNamedQuery(queryName, values);
	}

	public List findByNamedQuery(String queryName, Object value) throws DataAccessException {
		return baseDao.findByNamedQuery(queryName, value);
	}

	public List findByNamedQuery(String queryName) throws DataAccessException {
		return baseDao.findByNamedQuery(queryName);
	}

	public List findByNamedQueryAndNamedParam(String queryName, String paramName, Object value)
			throws DataAccessException {
		return baseDao.findByNamedQueryAndNamedParam(queryName, paramName, value);
	}

	public List findByNamedQueryAndNamedParam(String queryName, String[] paramNames, Object[] values)
			throws DataAccessException {
		return baseDao.findByNamedQueryAndNamedParam(queryName, paramNames, values);
	}

	public List findByNamedQueryAndValueBean(String queryName, Object valueBean) throws DataAccessException {
		return baseDao.findByNamedQueryAndValueBean(queryName, valueBean);
	}

	public List findByValueBean(String queryString, Object valueBean) throws DataAccessException {
		return baseDao.findByValueBean(queryString, valueBean);
	}

	public void flush() throws DataAccessException {
		baseDao.flush();
	}

	public <T> T get(Class<T> entityClass, Serializable id, LockMode lockMode) throws DataAccessException {
		return baseDao.get(entityClass, id, lockMode);
	}

	public <T> T get(Class<T> entityClass, Serializable id) throws DataAccessException {
		return baseDao.get(entityClass, id);
	}

	public Object get(String entityName, Serializable id, LockMode lockMode) throws DataAccessException {
		return baseDao.get(entityName, id, lockMode);
	}

	public Object get(String entityName, Serializable id) throws DataAccessException {
		return baseDao.get(entityName, id);
	}

	public Interceptor getEntityInterceptor() throws IllegalStateException, BeansException {
		return baseDao.getEntityInterceptor();
	}

	public int getFetchSize() {
		return baseDao.getFetchSize();
	}

	public String[] getFilterNames() {
		return baseDao.getFilterNames();
	}

	public int getFlushMode() {
		return baseDao.getFlushMode();
	}

	public SQLExceptionTranslator getJdbcExceptionTranslator() {
		return baseDao.getJdbcExceptionTranslator();
	}

	public int getMaxResults() {
		return baseDao.getMaxResults();
	}

	public String getQueryCacheRegion() {
		return baseDao.getQueryCacheRegion();
	}

	public SessionFactory getSessionFactory() {
		return baseDao.getSessionFactory();
	}

	public int hashCode() {
		return baseDao.hashCode();
	}

	public void initialize(Object arg0) throws DataAccessException {
		baseDao.initialize(arg0);
	}

	public boolean isAllowCreate() {
		return baseDao.isAllowCreate();
	}

	public boolean isAlwaysUseNewSession() {
		return baseDao.isAlwaysUseNewSession();
	}

	public boolean isCacheQueries() {
		return baseDao.isCacheQueries();
	}

	public boolean isCheckWriteOperations() {
		return baseDao.isCheckWriteOperations();
	}

	public boolean isExposeNativeSession() {
		return baseDao.isExposeNativeSession();
	}

	public Iterator iterate(String queryString, Object... values) throws DataAccessException {
		return baseDao.iterate(queryString, values);
	}

	public Iterator iterate(String queryString, Object value) throws DataAccessException {
		return baseDao.iterate(queryString, value);
	}

	public Iterator iterate(String queryString) throws DataAccessException {
		return baseDao.iterate(queryString);
	}

	public <T> T load(Class<T> entityClass, Serializable id, LockMode lockMode) throws DataAccessException {
		return baseDao.load(entityClass, id, lockMode);
	}

	public <T> T load(Class<T> entityClass, Serializable id) throws DataAccessException {
		return baseDao.load(entityClass, id);
	}

	public void load(Object entity, Serializable id) throws DataAccessException {
		baseDao.load(entity, id);
	}

	public Object load(String entityName, Serializable id, LockMode lockMode) throws DataAccessException {
		return baseDao.load(entityName, id, lockMode);
	}

	public Object load(String entityName, Serializable id) throws DataAccessException {
		return baseDao.load(entityName, id);
	}

	public <T> List<T> loadAll(Class<T> entityClass) throws DataAccessException {
		return baseDao.loadAll(entityClass);
	}

	public void lock(Object entity, LockMode lockMode) throws DataAccessException {
		baseDao.lock(entity, lockMode);
	}

	public void lock(String entityName, Object entity, LockMode lockMode) throws DataAccessException {
		baseDao.lock(entityName, entity, lockMode);
	}

	public <T> T merge(String entityName, T entity) throws DataAccessException {
		return baseDao.merge(entityName, entity);
	}

	public <T> T merge(T entity) throws DataAccessException {
		return baseDao.merge(entity);
	}

	public void persist(Object entity) throws DataAccessException {
		baseDao.persist(entity);
	}

	public void persist(String entityName, Object entity) throws DataAccessException {
		baseDao.persist(entityName, entity);
	}

	public void refresh(Object entity, LockMode lockMode) throws DataAccessException {
		baseDao.refresh(entity, lockMode);
	}

	public void refresh(Object entity) throws DataAccessException {
		baseDao.refresh(entity);
	}

	public void replicate(Object entity, ReplicationMode replicationMode) throws DataAccessException {
		baseDao.replicate(entity, replicationMode);
	}

	public void replicate(String entityName, Object entity, ReplicationMode replicationMode)
			throws DataAccessException {
		baseDao.replicate(entityName, entity, replicationMode);
	}

	public Serializable save(Object entity) throws DataAccessException {
		return baseDao.save(entity);
	}

	public Serializable save(String entityName, Object entity) throws DataAccessException {
		return baseDao.save(entityName, entity);
	}

	public void saveOrUpdate(Object entity) throws DataAccessException {
		baseDao.saveOrUpdate(entity);
	}

	public void saveOrUpdate(String entityName, Object entity) throws DataAccessException {
		baseDao.saveOrUpdate(entityName, entity);
	}

	public void saveOrUpdateAll(Collection entities) throws DataAccessException {
		baseDao.saveOrUpdateAll(entities);
	}

	public void setAllowCreate(boolean allowCreate) {
		baseDao.setAllowCreate(allowCreate);
	}

	public void setAlwaysUseNewSession(boolean alwaysUseNewSession) {
		baseDao.setAlwaysUseNewSession(alwaysUseNewSession);
	}

	public void setBeanFactory(BeanFactory beanFactory) {
		baseDao.setBeanFactory(beanFactory);
	}

	public void setCacheQueries(boolean cacheQueries) {
		baseDao.setCacheQueries(cacheQueries);
	}

	public void setCheckWriteOperations(boolean checkWriteOperations) {
		baseDao.setCheckWriteOperations(checkWriteOperations);
	}

	public void setEntityInterceptor(Interceptor entityInterceptor) {
		baseDao.setEntityInterceptor(entityInterceptor);
	}

	public void setEntityInterceptorBeanName(String entityInterceptorBeanName) {
		baseDao.setEntityInterceptorBeanName(entityInterceptorBeanName);
	}

	public void setExposeNativeSession(boolean exposeNativeSession) {
		baseDao.setExposeNativeSession(exposeNativeSession);
	}

	public void setFetchSize(int fetchSize) {
		baseDao.setFetchSize(fetchSize);
	}

	public void setFilterName(String filter) {
		baseDao.setFilterName(filter);
	}

	public void setFilterNames(String[] filterNames) {
		baseDao.setFilterNames(filterNames);
	}

	public void setFlushMode(int flushMode) {
		baseDao.setFlushMode(flushMode);
	}

	public void setFlushModeName(String constantName) {
		baseDao.setFlushModeName(constantName);
	}

	public void setJdbcExceptionTranslator(SQLExceptionTranslator jdbcExceptionTranslator) {
		baseDao.setJdbcExceptionTranslator(jdbcExceptionTranslator);
	}

	public void setMaxResults(int maxResults) {
		baseDao.setMaxResults(maxResults);
	}

	public void setQueryCacheRegion(String queryCacheRegion) {
		baseDao.setQueryCacheRegion(queryCacheRegion);
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		baseDao.setSessionFactory(sessionFactory);
	}

	public String toString() {
		return baseDao.toString();
	}

	public void update(Object entity, LockMode lockMode) throws DataAccessException {
		baseDao.update(entity, lockMode);
	}

	public void update(Object entity) throws DataAccessException {
		baseDao.update(entity);
	}

	public void update(String entityName, Object entity, LockMode lockMode) throws DataAccessException {
		baseDao.update(entityName, entity, lockMode);
	}

	public void update(String entityName, Object entity) throws DataAccessException {
		baseDao.update(entityName, entity);
	}
	
}
