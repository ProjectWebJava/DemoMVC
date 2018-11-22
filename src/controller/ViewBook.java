package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;
import model.Control_Book;
import model.DBConnection;

public class ViewBook extends HttpServlet {
	private static final long serialVersionUID = 1L;       
    private DBConnection connection;

    public ViewBook() {
        super();
        connection = new DBConnection();
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewBook.jsp");
		Control_Book control_Book = new Control_Book();
		connection.connect();
		
		String id = (String)request.getParameter("id");
		if (id != null) {
			Book book = control_Book.getBookById(connection, id);
			if (book != null) {
				request.setAttribute("result", book);
			} else {
				request.setAttribute("result", "0");
			}
		}
		
		connection.close();
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	
	
	
}
