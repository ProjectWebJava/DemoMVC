<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
	<footer class="footer">
		<div class="content">
			<div class="site-footer">
				<div class="copyright clearfix">
					<div class="container">
						<div class="inner clearfix">
							<div class="row">
								<div class="col-md-12 text-center text-lg-left">
									<span>&copy; Copyright 2018</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	
	<script>
	
		//Goto url
		function gotoPage(url){
			document.location.href = url;
		}
	
		//Use in ViewBook.jsp
		function addBookToCart(id, soluong){
			var count = getCookie("countBook");
			if (count.length == 0) count = 1;
			else count++;
			
			setCookie("book" + count, "id:" + id + "-count:" + soluong); //Thêm sách đã mua vào cookie
			setCookie("countBook", count);
			$(".cart-count").load(document.URL + " #number");
			$("#countInput").load(document.URL + " #count");
		}
		
		//Use in ViewCart.jsp
		function removeBookFromCart(index){
			var cookies = getListCookie(); //Danh sách cookie trong web
			var countBook = cookies.pop().split("="); //Số lượng lần mua sách
			
			if (cookies.length > 0){
				var book = getCookieAt(cookies, index); //Lấy ra thông tin lần mua sách thứ index
				deleteCookie(book.split("=")[0]); //Xóa lần mua này
				
				var soLuong = countBook[1] - 1;//Giảm số lượng lần mua trong biến đếm
				setCookie(countBook[0], soLuong);
				
				$(".cart-count").load(document.URL + " #number");
				$("#bill").load(document.URL + " #label, #price");
				if (soLuong > 0) $(".table-modify").load(document.URL + " .row-table");
				else $(".table-modify").load(document.URL + " .error");
			}
		}
		
		//Use in ViewBook.jsp
		function getNumberBuy(){
			var inputNumber = document.getElementById("count");
			return inputNumber.value;
		}
		
		//Use in ViewBook.jsp
		function zoomImage(mini_image, zoom_image, name){
			var url = "url" + "(lib/image/" + name + ")";
			var image= document.getElementById(zoom_image);
			image.style.content = url; //Thay đổi đường dẫn của zoom-image 
			
			/*Thay đổi active image*/
			var oldActiveImage = document.getElementsByClassName("mini-image active")[0];
			oldActiveImage.className = "mini-image"; //Xóa trạng thái active hình hiện tại
			mouseOutImage(oldActiveImage);//Chỉnh sửa thuộc tính cho hình
			mini_image.className = "mini-image active"; //Kích hoạt trạng thía active mới
		}
		
		//Use in ViewBook.jsp
		function mouseHoverImage(img){
			if (img.className == "mini-image"){
				img.style.opacity = 1.0;
				img.children[0].border = "1px solid gray";
			}
		}
		
		//Use in ViewBook.jsp
		function mouseOutImage(img){
			if (img.className == "mini-image"){
				img.style.opacity = 0.75;
				img.children[0].border = "none";
			}
		}
	</script>
</body>
</html>