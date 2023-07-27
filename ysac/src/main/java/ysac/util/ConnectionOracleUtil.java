package ysac.util;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.log4j.Log4j2;
import ysac.cart.mapper.CartSqlMapper;
import ysac.category.mapper.CategorySqlMapper;
import ysac.manager.mapper.ManagerMapper;
import ysac.manager_board.mapper.Manager_BoardMapper;
import ysac.order.mapper.UorderSqlMapper;
import ysac.product.mapper.ProductSqlMapper;
import ysac.qna.mapper.QnaMapper;
import ysac.rev.mapper.RevMapper;
import ysac.users.mapper.UsersMapper;

@Log4j2
public enum ConnectionOracleUtil {
	INSTANCE;
	
	private HikariDataSource ds;
	
	private static SqlSessionFactory instance;
	
	private ConnectionOracleUtil() {
		
		HikariConfig config = new HikariConfig();
		
		config.setDriverClassName("oracle.jdbc.OracleDriver");
		config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521/xe");
		config.setUsername("test3");
		config.setPassword("1234");
		
		ds = new HikariDataSource(config);
	}
	public Connection getConnection() throws Exception{
		return ds.getConnection();
	}

//	iBatis 설정
	
//	iBatis(MyBatis 반환)
	public SqlSessionFactory getSqlSessionFactory() {
		
		DataSource hDs = ds;
		log.info("hikariDataSource: "+hDs);
		
		TransactionFactory transactionFactory = new JdbcTransactionFactory();
		
		Environment environment = new Environment("development", transactionFactory, hDs);
		Configuration configuration = new Configuration(environment);
		
		configuration.addMapper(CartSqlMapper.class);
		configuration.addMapper(CategorySqlMapper.class);
		configuration.addMapper(ManagerMapper.class);
		configuration.addMapper(Manager_BoardMapper.class);
		configuration.addMapper(UorderSqlMapper.class);
		configuration.addMapper(ProductSqlMapper.class);
		configuration.addMapper(UsersMapper.class);
		configuration.addMapper(RevMapper.class);
		configuration.addMapper(QnaMapper.class);
		
		
		
		log.info("sqlSessionFactory: "+ new SqlSessionFactoryBuilder().build(configuration) );
		return new SqlSessionFactoryBuilder().build(configuration);
	}
	
}
