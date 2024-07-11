package dapp.repository;

import java.io.File;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class DBConfig {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private static DBConfig db=null;
	private DBConfig(String path) {
		try {
			FileInputStream fin=new FileInputStream(path);
			Properties p=new Properties();
			System.out.println(path);
			p.load(fin);
			System.out.println(p.getProperty("db.username"));
			String username=p.getProperty("db.username");
			String password=p.getProperty("db.password");
			String url=p.getProperty("db.url");
			String driverClassName=p.getProperty("db.driverClassName");
					
			Class.forName(driverClassName);	
			conn=DriverManager.getConnection(url,username,password);
				
			if(conn!=null){
				System.out.println("Database is Connected");
			}
			else {
				System.out.println("Database is not Connected");
			}
		}
		catch(Exception ex) {
			
		}
	}
	
	public static DBConfig getInstance(String path){
		if(db==null) {
			db=new DBConfig(path);
		}
		return db;
	}
	
	public Connection getConnection() {
		return conn;
	}
	
	public PreparedStatement getPreparedStatement() {
		return stmt;
	}
	
	public ResultSet getResultSet() {
		return rs;
	}
}
