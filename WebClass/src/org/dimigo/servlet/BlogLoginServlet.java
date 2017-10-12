package org.dimigo.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class BlogLoginServlet
 */
@WebServlet("/bloglogin")
public class BlogLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("myblog/bloghome.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s, pwd : %s\n", id, pwd);
		
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		// id, pwd 정합성 체크
		if(id.equals("test@naver.com")){
			session.setAttribute("logged_in", "true");
			session.setAttribute("name", "성경민");
			session.setAttribute("id", id);
			map.put("name", "성경민");
			map.put("id", id);
			map.put("msg", "success");
		} else {
			session.setAttribute("logged_in", "false");
			map.put("msg", "fail");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(map);
		
		response.getWriter().append(json);
	}

}
