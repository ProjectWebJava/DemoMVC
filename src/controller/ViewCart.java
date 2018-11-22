package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;
import model.Control_Book;
import model.DBConnection;


public class ViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DBConnection connection;   

    public ViewCart() {
        super();
        connection = new DBConnection();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewCart.jsp");
		Control_Book control_Book = new Control_Book();
		connection.connect();
		
		Cookie[] cookies = request.getCookies();
		Vector<Object[]> books = new Vector<Object[]>(); //Kết quả gửi về client
		for (int i = 0; i<cookies.length; i++) {
			Cookie cookie = cookies[i];
			String name = cookie.getName();
			if (name.length() <= 4) continue;
			if (name.substring(0, 4).equalsIgnoreCase("book")) {
				String[] value = cookie.getValue().split("-");
				String id = getValueInCookie(value[0]);
				String count = getValueInCookie(value[1]);
				Book book = control_Book.getBookById(connection, id); //Thông tin của sách
				books.addElement(new Object[] {book, count});
			}
		}
		
		if (books.size() > 0)
			request.setAttribute("result", books);
		else
			request.setAttribute("result", "0");
		
		connection.close();
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	private int getCountBuy(Cookie[] cookies) {
		int count = 0;
		for (Cookie cookie : cookies) {
			String name = cookie.getName();
			if (name.equalsIgnoreCase("countBook")) {
				count = Integer.parseInt(cookie.getValue());
			}
		}
		return count;
	}
	
	private String getValueInCookie(String cookie){
		String string[] = cookie.split(":");
		return string[1];
	}
}
