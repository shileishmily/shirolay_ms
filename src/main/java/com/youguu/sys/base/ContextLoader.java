package com.youguu.sys.base;

import com.youguu.core.dao.DataSourceLoader;
import com.youguu.core.dao.multi.MultiDataSourceTransactionManager;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration("sunMsContextLoader")
@ComponentScan({"com.youguu.sys*"})
@EnableTransactionManagement
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class ContextLoader extends DataSourceLoader {

	public DataSource getDataSource(String selector) {
		return loadMulti(selector);
	}

	@Bean
	public SqlSessionFactory shirolayMsSessionFactory() throws Exception {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(getDataSource("shirolay_ms"));
		DefaultResourceLoader dc = new DefaultResourceLoader();
		bean.setConfigLocation(dc.getResource("classpath:mybatis/sys-mapper-config.xml"));
		return bean.getObject();
	}

	@Bean(name = "shirolayMsTx")
	public DataSourceTransactionManager shirolayMsTx() {
		DataSourceTransactionManager transactionManager = new MultiDataSourceTransactionManager();
		transactionManager.setDataSource(getDataSource("shirolay_ms"));
		return transactionManager;
	}


}
