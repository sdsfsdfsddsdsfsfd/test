package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

@WebServlet("/sawonlist.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Sawonlist.do?deptno=10 : 정상적으로 파라미터 넘어옴
		//Sawonlist.do?deptno= : empty
		//Sawonlist.do?	: null		
		
		int deptno = 0;
		String str_deptno = request.getParameter("deptno");
		
		if(str_deptno != null && !str_deptno.isEmpty()) {
			deptno = Integer.parseInt(str_deptno);//파라미터에 문제가 없다면 정수값으로 전환
		}
		
		//List<SawonVO> list = SawonDAO.getInstance().select();//mapper까지 들어갔다 나옴
		List<SawonVO> list = null;
		
		if(deptno == 0) {
			//전체목록 조회
			list = SawonDAO.getInstance().select();
		}else {
			//부서별 조회. 부서번호를 파라미터로 보냄. 오버로드때문에 같은 이름 메서드 가능함.
			list = SawonDAO.getInstance().select(deptno);
		}
		
		
		//list 바인딩
		request.setAttribute("list", list);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	}

}
