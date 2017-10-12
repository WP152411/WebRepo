package org.dimigo.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dimigo.vo.UserVO;

/**
 * Servlet implementation class SessionServlet
 */
@WebServlet("/session")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에 사용자 정보가 없으면 login.jsp로 포워딩하고
		// 있으면 jsp/sessionInfo.jsp로 포워딩
		// sessionInfo.jsp : id, name, nickname를 그대로 출력
		if(request.getSession().getAttribute("user")==null){
//			RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
//			rd.forward(request, response);
			response.sendRedirect("jsp/login.jsp");  // 그냥 연결시키기
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/sessionInfo.jsp");
			rd.forward(request, response);  // 받은것 유지 (같은것 공유)
		}
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
