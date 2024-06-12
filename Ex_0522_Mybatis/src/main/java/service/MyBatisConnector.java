package service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static MyBatisConnector single = null;

	public static MyBatisConnector getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		// 생성된 객체정보를 반환
		return single;
	}// singleton

	// 어떤 DB로 접속할 것인가, mapper로 누구를 참조할 것인가 등을 감지하는 클래스
	SqlSessionFactory factory = null;
	// factory : 전체 내용에서 DB연결과 관련된 내용을 뽑아냄.

	private MyBatisConnector() {// 호출할 일 없기 때문에 private 으로 해도 ㄱㅊ.
		try {
			// sqlMapConfig.xml파일 읽기.
			Reader reader = Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");// 상세경로, Reader : stream
			factory = new SqlSessionFactoryBuilder().build(reader);// reader가 읽어온 내용 분석, 필요한 내용 가져감.
			reader.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public SqlSessionFactory getSqlSessionFactory() {
		return factory;
	}// factory 반환(getter)

}
