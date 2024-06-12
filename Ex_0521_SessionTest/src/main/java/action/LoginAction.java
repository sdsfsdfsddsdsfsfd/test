package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		// id를 selectone으로 DAO에서 조회함.

		MemberVO user = MemberDAO.getInstance().selectOne(id);
		// 만약 db에 아이디가 없으면! 메모리 할당이 안됨. 아이디가 존재하면 null은 아님.

		String param = "";
		String resultStr = "";

		// 아이디가 존재하지 않을때
		if (user == null) {
			param = "no_id";
			resultStr = String.format("[{'param':'%s'}]", param);
			response.getWriter().println(resultStr);
			return;
		}

		// 비밀번호 일치 여부
		if (!user.getPwd().equals(pwd)) {// 비밀번호가 일치하지 않을때
			param = "no_pwd";
			resultStr = String.format("[{'param':'%s'}]", param);
			response.getWriter().println(resultStr);
			return;
		}

		// 아이디와 비밀번호에 문제가 없다면 세션에 user객체 저장.
		// 단, 세션은 서버자체의 메모리를 사용하기 때문에 많을수록 브라우저를 느리게 만드므로
		// 꼭 필요한 곳에서만 슬 수 있도록 하자!

		// 세션 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		// 어디서든 쓸 수 있기 때문에 포워딩 필요 없다.

		// 로그인 성공
		param = "clear";
		resultStr = String.format("[{'param':'%s'}]", param);
		response.getWriter().println(resultStr);

	}

}
