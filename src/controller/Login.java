package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.getSession().removeAttribute("User");

		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> user = request.getParameterMap();
		if (user.size() > 0) {
			if (user.get("nameLogin")[0].equals("user")
					&& user.get("passLogin")[0].equals("1234")) {//�?ăng nhặp thành công
				HttpSession session = request.getSession();
				session.setAttribute("User", user.get("nameLogin")[0]);
				response.sendRedirect(request.getContextPath());
			} else {
				StringBuffer path = new StringBuffer(request.getContextPath() + "/login?err=");
				if (!user.get("nameLogin")[0].equals("user")) path.append("1");
				else if (!user.get("passLogin")[0].equals("1234")) path.append("0");
				response.sendRedirect(path.toString());
			}
		}
	}
}
