package model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;


public class Control_Book {
	
	public Control_Book() {
		
	}
	
	public String addBook(DBConnection connection, String tenSach, int giaSach, String theLoai, String NXB, String tacGia, String moTa, String duongDanAnh) {
		//Thêm sách mới vào bảng
		String maSach = "";
		try {
			Vector<Object[]> paramsIn_Book = connection.createParams(new int[] { 2, 3, 4, 5, 6, 7},
					new Object[] { tenSach, giaSach, theLoai, NXB, tacGia, moTa});
			Vector<Object[]> paramsOut_Book = connection.createParams(new int[] {1}, new Object[] {Types.VARCHAR});
			Object[] result = connection.executeProcedure("sp_ThemSachMoi", paramsIn_Book, paramsOut_Book, null);
			
			if (result != null && result.length > 0 && duongDanAnh != null) {
				maSach = result[0].toString();
				Control_Image control_Image = new Control_Image();
				control_Image.addImage(connection, maSach, duongDanAnh);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return maSach;
	}
	
	public void updateBook(DBConnection connection, Book book) {
		//Cập nhật thông tin cho cuốn sách theo mã sách
		try {
			Vector<Object[]> paramsIn_Book = connection.createParams(new int[] { 1, 2, 3, 4, 5, 6, 7}, 
					new Object[] {book.getMaSach(), book.getTenSach(), book.getGiaBan(), book.getTheLoai(), book.getNXB(), book.getTacGia(), book.getMoTa()});
			connection.executeProcedure("sp_ChinhSuaSach", paramsIn_Book, null, null);
			
			Control_Image control_Image = new Control_Image();
			control_Image.updateImage(connection, book.getImages());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public Book[] getAllBook(DBConnection connection) {
		//Trả về danh sách sách có trong bảng
		Vector<Book> result = new Vector<>();
		try {
			ResultSet resultSet = connection.executeFunction("fc_getAllBook", null);
			while (resultSet.next()) {
				Book book = new Book();
				Control_Image ctrImage = new Control_Image();
				
				//Add value to Book
				book.setMaSach(resultSet.getString(1));
				book.setTenSach(resultSet.getString(2));
				book.setGiaBan(resultSet.getInt(3));
				book.setTheLoai(resultSet.getString(4));
				book.setNXB(resultSet.getString(5));
				book.setTacGia(resultSet.getString(6));
				book.setMoTa(resultSet.getString(7));
				
				Image[] images = ctrImage.getImageById(connection, null, book.getMaSach());
				//Xét trường hợp mỗi sách chỉ cần một hình để hiển thị
				if (images != null && images.length > 0)
				book.setImages(images[0]);
				
				result.addElement(book);
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result.toArray(new Book[0]);
	}
	
	public Book getBookById(DBConnection connection, String Id) {
		//Trả về sách có id trong bảng
		Book result = null;
		Control_Image ctrImage = new Control_Image();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {1}, new Object[] {Id});
			ResultSet resultSet = connection.executeFunction("fc_getBookById", paramsIn);
			while (resultSet.next()) {
				result = new Book();
				
				//Add value to Book
				result.setMaSach(resultSet.getString(1));
				result.setTenSach(resultSet.getString(2));
				result.setGiaBan(resultSet.getInt(3));
				result.setTheLoai(resultSet.getString(4));
				result.setNXB(resultSet.getString(5));
				result.setTacGia(resultSet.getString(6));
				result.setMoTa(resultSet.getString(7));
				
				Image[] images = ctrImage.getImageById(connection, null, result.getMaSach());
				//Xét trường hợp mỗi sách chỉ cần một hình để hiển thị
				if (images != null && images.length > 0)
					result.setImages(images[0]);
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
