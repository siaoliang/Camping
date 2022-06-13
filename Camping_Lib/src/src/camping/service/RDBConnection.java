package src.camping.service;

import java.sql.*;

import src.camping.exeception.CAMPException;

class RDBConnection {
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/camping";
	private static final String userId = "root";
	private static final String pwd = "1234";
	
	static Connection getConnection() throws CAMPException {
		try {
			Class.forName(driver); //載入JDBC Driver
			try {
				Connection connection = DriverManager.getConnection(url, userId, pwd);
				return connection;
			} catch (SQLException e) {
				throw new CAMPException("建立連線失敗", e);
			}
		} catch (ClassNotFoundException e) {
			throw new CAMPException("載入JDBC Driverg失敗:" + driver);
		}
	}
}
