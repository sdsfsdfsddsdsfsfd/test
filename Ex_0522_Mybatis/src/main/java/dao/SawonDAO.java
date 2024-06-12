package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private SawonDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
		//싱글톤으로 factory 생성->메모리 할당받은 factory 가져옴
	}//DAO의 생성자 생성. new SawonDAO 안하는게 메모리 낭비 줄일 수 있음.

	//사원목록 조회
	public List<SawonVO> select(){
		//실제로 접근권한을 가진 객체를 만듦.(factory는 어디로 어떻게 들어가야 하는지만 알아)
		//factory로부터 알게된 DB로 접근하여 실제로 쿼리문을 실행하거나 결과를 받을 수 있도록 하는 클래스.(Spring에서도 나옴)
		SqlSession sqlSession = factory.openSession();//sqlSession : 쿼리문 요청, 결과 가져오는 역할
		
		List<SawonVO> list = sqlSession.selectList("s.sawon_list");//한줄로 쿼리 요청 및 반환까지 끝
		//매퍼를 사용(mybatis) 사용하면 세터, 게터 에서 자동으로 넣어버림.
		//vo의 변수명과 column명이 동일해야 자동으로 넣을 수 있음.
		//seleclist : 가져와야함.(메서드) 
		//삭제시 delete 메서드 호출. 5가지 중 하나의 메서드를 활용해서 DB에서 작업함.
		//한명을 조회하고 싶다면 만들어져있는 selectone 메서드 호출함.
		
		//"s.sawon_list" : 이게 핵심입니다. mapper : 데이터베이스 쿼리문을 입력하기 위해 만들어진 설정파일
		//s : namespace 가 s인 매퍼 찾기
		//그중 sawon_list라는 태그 실행하기
		//그렇게 class에서 mapper라는 파일 호출함.
		
		//vo로 넘어오지만, vo 타입이 list에 담아야 함. 결과는 list에 자동으로 담아짐(selectlist)
		
		//DB조회 끝나면 닫아야 함
		sqlSession.close();
		return list;
	}
	
	//부서별 사원 조회. 오버로드(파라미터 갯수, 종류 다름)
	public List<SawonVO> select(int deptno){
		SqlSession sqlSession = factory.openSession();
		//(mapper명,파라미터)로 불러옴. mapper로 보낼수 있는 파라미터의 개수 : 1
		List<SawonVO> list= sqlSession.selectList("s.sawon_list_deptno", deptno);
		sqlSession.close();
		return list;
	}
	
}
