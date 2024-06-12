package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.DeptVO;

public class DeptDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DeptDAO single = null;

	public static DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}//singleton
	
	SqlSessionFactory factory;
	
	private DeptDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
		
	}
	
	//부서목록 조회
	public List<DeptVO> selectDept(){
		//mapper호출
		SqlSession sqlSession = factory.openSession();
		List<DeptVO> list = sqlSession.selectList("d.dept_list");
		sqlSession.close();
		
		return list;
	}

}
