package controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;
import model.Control_Book;
import model.Control_Image;
import model.DBConnection;
import model.Image;

public class AdminQLSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DBConnection connection;

    public AdminQLSach() {
        super();
        connection = new DBConnection();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/QLSach.jsp");
		
		String action = request.getParameter("action");
		if (action != null) {
			if (action.equalsIgnoreCase("add")) {
				request.setAttribute("result", "1"); //Thêm sách mới
			} else {
				String id = request.getParameter("id");
				
				if (id != null) {
					Control_Book control_Book = new Control_Book();
					connection.connect();
					
					Book book = control_Book.getBookById(connection, id);
					if (book != null) {
						request.setAttribute("result", "2"); //Đọc thông tin sách
						request.setAttribute("book", book); //Truyền thông tin sách về client
						
						//Thông tin để cập nhật ảnh
						request.setAttribute("id", book.getMaSach());
						Image image = book.getImages();
						if (image.getDuongDan() != null && image.getDuongDan().length() > 0) {
							request.setAttribute("imageAction", "update");
							request.setAttribute("maAnh", image.getMaAnh());
						} else {
							request.setAttribute("imageAction", "add");
						}
					} else {
						request.setAttribute("result", "0"); //Đọc thông tin sách lỗi
					}
					
					connection.close();
				} else request.setAttribute("result", "0"); //Chuỗi truy vấn sai
			}
		} else request.setAttribute("result", "0"); //Chuỗi truy vấn sai
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		connection.connect();
		
		
		if (action != null) {
			Control_Book control_Book = new Control_Book();
			String tenSach = request.getParameter("name");
			int giaSach = Integer.parseInt(request.getParameter("gia"));
			String theLoai = request.getParameter("theLoai");
			String NXB = request.getParameter("nxb");
			String tacGia = request.getParameter("tacGia");
			String moTa = request.getParameter("moTa");
			String duongDanAnh = request.getParameter("duongDan");
			
			if (action.equals("add")) {
				//Thêm sách mới
				System.out.println("Đã vô đây: " + "Thêm sách mới");
				
				control_Book.addBook(connection, tenSach, giaSach, theLoai, NXB, tacGia, moTa, duongDanAnh);
			} else if (action.equals("modify")) {
				String imageAction = request.getParameter("imageAction");
				String id = request.getParameter("id");
				if (imageAction.equals("add")) {
					//Cập nhật sách chưa có hình
					System.out.println("Đã vô đây: " + "Cập nhật sách chưa có hình");
					
					//Tạo một hình mới trong database
					Control_Image control_Image = new Control_Image();
					String maAnh = control_Image.addImage(connection, id, duongDanAnh);
					Image image = new Image(maAnh, id, duongDanAnh);
					
					//Cập nhật sách theo ảnh vừa tạo
					control_Book.updateBook(connection, new Book(id, tenSach, giaSach, theLoai, NXB, tacGia, moTa, image));
				} else if (imageAction.equals("update")) {
					//Cập nhật sách đã có hình
					System.out.println("Đã vô đây: " + "Cập nhật sách đã có hình");
					
					String maAnh = request.getParameter("maAnh");
					Image image = new Image(maAnh, id, duongDanAnh);
					control_Book.updateBook(connection, new Book(id, tenSach, giaSach, theLoai, NXB, tacGia, moTa, image));
				}
			}
		}
		connection.close();
		
		doGet(request, response);
	}

}
