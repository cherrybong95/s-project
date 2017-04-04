package model;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class DataSourceManager {
private static DataSourceManager instance=new DataSourceManager();
protected static DataSourceManager getInstance(){
	return instance;
}
private DataSourceManager(){
	BasicDataSource dbcp=new BasicDataSource();
	dbcp.setDriverClassName("oracle.jdbc.driver.OracleDriver");
	dbcp.setUrl("jdbc:oracle:thin:@127.0.0.1:1521:xe");
	dbcp.setUsername("scott");
	dbcp.setPassword("tiger");
	dataSource=dbcp;
	
	
}
private DataSource dataSource;
public DataSource getDataSource(){
	return dataSource;
}
}
