package bingo.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import bingo.dao.IDao;

/**
 * 服务类基类
 */
public class BaseService {
	protected static final Logger log = LoggerFactory.getLogger(BaseService.class);

	protected IDao dao ;

	public void setDao(IDao dao) {
		this.dao = dao;
	}

}
