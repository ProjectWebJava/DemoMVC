<%@page import="model.Book"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Xem giỏ hàng</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/styleView.css">
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
</head>
<body>
	<%@ include file="/comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<section>
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
							<li itemprop="itemListElement"
								itemtype="http://schema.org/ListItem"><a itemprop="item"
								href="http://localhost:8080/Web_Ban_Sach/"> <span
									itemprop="name"> <i class="fa fa-home"></i> Trang chủ
								</span>
							</a> <span><i class="fa fa-angle-right"></i></span>
								<meta itemprop="position" content="1"></li>
							<li itemprop="itemListElement"
								itemtype="http://schema.org/ListItem"><a itemprop="item"
								href=""> <strong itemprop="name">Xem chi tiết</strong>
							</a>
								<meta itemprop="position" content="3"></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<article>
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
					<ul class="table-modify">
						<%
							Object result = request.getAttribute("result");
							if ("0".equals(result)) {
								out.println("<p class=\"error\">Giỏ hàng trống</p>");
							} else if (result instanceof Vector) {
								Vector<Object[]> books = (Vector<Object[]>) result;
								for (int i = 0; i < books.size(); i++) {
									Book book = (Book) books.elementAt(i)[0];
									int countBook = Integer.parseInt((String) books.elementAt(i)[1]);

									out.println("<li class=\"row-table\">");
									out.println("<div class=\"row\">");
									out.println("<div class=\"col-lg-3 col-md-4 col-sm-4 col-xs-12\">");

									if (book.getImages() != null)
										out.println("<div class=\"thumbnail small\"><img src=\"lib/image/"
												+ book.getImages().getDuongDan() + "\"></div></div>");
									out.println("<div class=\"col-lg-7 col-md-6 col-sm-6 col-xs-8 col-ms-12\">");
									out.println("<div id=\"info\" style=\"margin-top: 0px\">");
									out.println("<ul>");
									out.println("<li><p><strong>Tên sách: </strong></p>");
									out.println("<span>" + book.getTenSach() + "</span></li>");
									out.println("<li><p><strong>Tác giả: </strong></p>");
									out.println("<span>" + book.getTacGia() + "</span></li>");
									out.println("<li><p><strong>Giá bán: </strong></p>");
									out.println("<span>" + book.getGiaBan() + "</span></li></ul></div></div>");
									out.println("<div class=\"col-lg-2 col-md-2 col-sm-2 col-xs-4 col-ms-12\">");
									out.println("<div id=\"numberCount\">");
									out.println("<span><strong>Số lượng </strong></span>");
									out.println("<input type=\"number\" name=\"quantity\" min=\"1\" max=\"100\" value=\"" + countBook
											+ "\" id=\"count\">");
									out.println("</div></div></div><div class=\"deleteBook\" onclick=\"removeBookFromCart(" + i + ")\"><i class=\"fa fa-close\"></i></div></li>");
								}
							}
						%>
					</ul>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
					<div class="board" style="text-align: center;" id="bill">
						<span id="label" style="left: 0px;">Tổng tiền phải thanh toán: </span>
						<%
							int sum = 0;
							if ("0".equals(result)) {
								out.println("<span style=\"font-weight:bold;\">0đ</span>");
							} else if (result instanceof Vector) {
								Vector<Object[]> books = (Vector<Object[]>) result;
								for (int i = 0; i < books.size(); i++) {
									Book book = (Book) books.elementAt(i)[0];
									int price = book.getGiaBan();
									int countBook = Integer.parseInt((String) books.elementAt(i)[1]);
									sum += price * countBook;
								}
							}
							out.println("<span id=\"price\" style=\"font-weight:bold;left: 0px;\">" + String.valueOf(sum) + "đ</span>");
						%>
					</div>
					<div class="button-modify" style="text-align: center;">
						<div class="button-rect forest">
							<a class="login-window" href="#confirm-form"><i class="fa fa-money"></i> <span
								class="content-inner">Thanh toán</span></a>
						</div>
					</div>
				</div>
			</div>
		</article>

		<div>
			<div class="login" id="confirm-form">Thông tin khách hàng
				<a class="close" href="#"><i class="fa fa-close" style="color: red; margin-right: 5px;"></i></a>
				<form class="login-content" action="#" method="post">
					<label class="name"> <span>Tên người mua</span> <input
						id="username" type="text" autocomplete="on" name="username"
						placeholder="Name..." value="" />
					</label> <label class="address"> <span>Địa chỉ giao hàng</span> <input
						id="password" type="text" name="address" placeholder="Address..."
						value="" />
					</label> <label class="phone"> <span>Số điện thoại</span> <input
						id="phone" type="text" name="phone" placeholder="Phone..."
						value="" />
					</label>
					<button class="button submit-button" type="button">Đặt hàng</button>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="/comp/Footer.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			$('a.login-window').click(function() {
				//lấy giá trị thuộc tính href - chính là phần tử "#login-box"
				var loginBox = $(this).attr('href');

				//cho hiện hộp đăng nhập trong 300ms
				$(loginBox).fadeIn(300);

				// thêm phần tử id="over" vào sau body
				$('body').append('<div id="over">');
				$('#over').fadeIn(300);

				return false;
			});

			// khi click đóng hộp thoại
			$(document).on('click', "a.close, #over, button.submit-button", function() {
				$('#over, .login').fadeOut(300, function() {
					$('#over').remove();
				});
				return false;
			});
		});
	</script>
</body>
</html>