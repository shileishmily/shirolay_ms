package com.youguu.sys.base;

import com.youguu.core.dao.SqlDAO;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.annotation.Resource;

public class SunMsDAO<T> extends SqlDAO<T> {
	public SunMsDAO() {
		super();
		setUseSimpleName(true);
	}

	@Resource(name = "shirolayMsSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

}
