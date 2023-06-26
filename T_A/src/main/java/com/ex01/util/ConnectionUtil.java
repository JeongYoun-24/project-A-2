package com.ex01.util;

import java.io.IOException;
import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.mapper.mybatis.ManagerMapper;
import com.mapper.mybatis.ProductMapper;
import com.mapper.mybatis.U_OrderMapper;
import com.mapper.mybatis.UsersMapper;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


public enum ConnectionUtil  {

	INSTANCE;
	

	private HikariDataSource ds;
	private ConnectionUtil() {
	
		HikariConfig config = new HikariConfig();
		

		config.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		config.setUsername("test3");
		config.setPassword("1234");
		
		config.addDataSourceProperty("cachePrepStmts", true);
		config.addDataSourceProperty("prepStmtCachesize", "250");
		config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
		
		ds = new HikariDataSource(config);
		
	}
	public Connection getConnection() throws Exception{
		return ds.getConnection();
	}
	
	// MyBatis 설정
		public SqlSessionFactory getSqlSessionFactorty() {
			DataSource hDs = ds;
			
			
			TransactionFactory transactionFactory = new JdbcTransactionFactory();
			Environment environment = new Environment("development", transactionFactory, hDs);
			Configuration configuration = new Configuration(environment);
			
			// xml sql 
			configuration.addMapper(UsersMapper.class); // MemberMapper.class
			configuration.addMapper(U_OrderMapper.class);
			configuration.addMapper(ProductMapper.class);
			configuration.addMapper(ManagerMapper.class);
			
			
			return new SqlSessionFactoryBuilder().build(configuration);
		}
	
	
}
