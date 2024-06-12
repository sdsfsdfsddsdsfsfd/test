package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

@WebServlet("/gogek_list.do")
public class GogekListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// gogek_list.do?loc=???
		String search = request.getParameter("search");
		String search_res = "";
		
		if (search != null && !search.isEmpty()) {
			search_res =search; 
		}
		
		List<GogekVO> gogek_list = null;
		if(search_res.equals("")) {
			gogek_list = GogekDAO.getInstance().selectGogek();//전체조회
		}else {
			gogek_list = GogekDAO.getInstance().selectGogek(search_res);
		}

		// List<GogekVO> gogek_list = GogekDAO.getInstance().selectGogek();

		request.setAttribute("list", gogek_list);
		RequestDispatcher disp = request.getRequestDispatcher("gogek_list.jsp");
		disp.forward(request, response);
	}

}
