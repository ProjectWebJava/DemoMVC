package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;
import model.Control_Book;
import model.DBConnection;

public class AdminQLKhoSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBConnection connection;
       
    public AdminQLKhoSach() {
        super();
        connection = new DBConnection();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/QLKhoSach.jsp");
		Control_Book control_Book = new Control_Book();
		connection.connect();
		
		Book[] danhSachSach = control_Book.getAllBook(connection);
		request.setAttribute("danhSachSach", danhSachSach);
		
		connection.close();
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
