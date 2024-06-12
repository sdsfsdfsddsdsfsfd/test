package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBService {
	//데이터베이스에 연결 담당할거임
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBService single = null;//상수는 final

	public static DBService getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
		return single;
	}
	
	DataSource ds;
	
	public DBService() {//무조건 호출되요.잘만들어놓으면 복붙해서 클래스 호출하면 됨.
		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context)ic.lookup("java:comp/env");
			ds = (DataSource)ctx.lookup("jdbc/oracle_test");//이름 찾을거야.
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}//생성자
	
	public Connection getConnection() {//connection형태로 반환한다.
		Connection conn = null;
		try {
			conn = ds.getConnection();//db연결까지만 담당하는 객체
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}//conn
	
	
	
}
