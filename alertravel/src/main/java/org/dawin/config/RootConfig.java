package org.dawin.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages = {
		"org.dawin.service", 
		"org.dawin.controller"
})
@MapperScan(basePackages = { "org.dawin.mapper" })
@EnableAspectJAutoProxy
@EnableTransactionManagement
public class RootConfig {
	
	@Autowired
	ApplicationContext applicationContext;
	
	@Bean
	public DataSource dataSource() { 
		HikariConfig config = new HikariConfig(); 
		config.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy"); 
		config.setJdbcUrl("jdbc:log4jdbc:mysql://49.50.162.69:3306/dawin");
		
		config.setUsername("february-user"); 
		config.setPassword("1234");
		
		HikariDataSource dataSource = new HikariDataSource(config); 
		return dataSource;
	}
	@Bean 
	public SqlSessionFactory sqlSessionFactory() throws Exception { 
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		
		sqlSessionFactory.setConfigLocation(applicationContext.getResource("classpath:/myBatis-config.xml"));
		
		sqlSessionFactory.setDataSource(dataSource()); 
		return (SqlSessionFactory) sqlSessionFactory.getObject();
	}
	
	@Bean
	public DataSourceTransactionManager transactionManager() {
		DataSourceTransactionManager manager = new DataSourceTransactionManager(dataSource());
		
		return manager;
	}
	
}
