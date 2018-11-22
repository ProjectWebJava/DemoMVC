<%@page import="model.Image"%>
<%@page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Thông tin chi tiết</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css" data-minify="1"/>
<link rel="stylesheet" type="text/css" href="lib/css/styleView.css"/>
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
</head>
<body>
	<%@ include file="/comp/Header.jsp" %>
	
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

		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<article>
						<div class="row">
							<div class="board">
								<div class="col-lg-1 col-md-1 hidden-sm hidden-xs hidden-ms" style="padding: 0px;">
									<div class="mini-image-bar">
										<div class="mini-image active" 
											onclick="zoomImage(this, 'zoom-image', 's00001.jpeg')"
											onmouseover="mouseHoverImage(this)"
											onmouseout="mouseOutImage(this)">
												<img alt="s00001" src="lib/image/s00001.jpeg">
										</div>
										<div class="mini-image" 
											onclick="zoomImage(this, 'zoom-image', 's00002.jpeg')"
											onmouseover="mouseHoverImage(this)"
											onmouseout="mouseOutImage(this)">
												<img alt="s00002" src="lib/image/s00002.jpeg">
										</div>
										<div class="mini-image" 
											onclick="zoomImage(this, 'zoom-image', 's00003.jpeg')"
											onmouseover="mouseHoverImage(this)"
											onmouseout="mouseOutImage(this)">
												<img alt="s00003" src="lib/image/s00003.jpeg">
										</div>
										<div class="mini-image" 
											onclick="zoomImage(this, 'zoom-image', 's00004.jpeg')"
											onmouseover="mouseHoverImage(this)"
											onmouseout="mouseOutImage(this)">
												<img alt="s00004" src="lib/image/s00004.jpeg">
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
									<div class="thumbnail">
										<%
											Object result = request.getAttribute("result");
											String pathImage = "";
											if (result instanceof Book) {
												Image pathsImage = ((Book)result).getImages();
												if (pathsImage != null){
													pathImage = "lib/image/" + pathsImage.getDuongDan();
												}
											}
											out.println("<img src=\"" + 
												pathImage + "\" id=\"zoom-image\" style=\"content: url('" + 
												pathImage + "');\">");
										%>
									</div>
								</div>
								<div class="col-lg-7 col-md-5 col-sm-6 col-xs-12">
									<div id="info">
									
										<%
											if ("0".equals(result)) {
												out.println("<p class=\"error\">Mã sách không hợp lệ</p>");
											} else if (result instanceof Book) {
												out.println("<ul>");

												out.println("<li>");
												out.println("<div class=\"row\">");
												out.println("<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Tên sách: </strong></p></div>");
												out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book)result).getTenSach() + "</span></div>");
												out.println("</div>");
												out.println("</li>");

												out.println("<li>");
												out.println("<div class=\"row\">");
												out.println("<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Tác giả: </strong></p></div>");
												out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book)result).getTacGia() + "</span></div>");
												out.println("</div>");
												out.println("</li>");

												out.println("<li>");
												out.println("<div class=\"row\">");
												out.println("<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Giá bán: </strong></p></div>");
												out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book)result).getGiaBan() + "</span></div>");
												out.println("</div>");
												out.println("</li>");

												out.println("</ul>");
											}
										%>
									</div>

									<div class="row" style="margin-top: 20px;">
										<div class="col-lg-1 col-md-3 col-sm-3 col-xs-12" id="countInput">
											<input type="number" name="quantity" min="1" max="100" value="1" id="count">
										</div>
										<div class="col-lg-11 col-md-5 col-sm-8 col-xs-12">
											<div class="button-modify">
												<%
													String maSach = ((Book)result).getMaSach();
													out.println("<div class=\"button-rect forest\" onclick='addBookToCart(\""  + maSach + "\", getNumberBuy());'>");
													out.println("<i class=\"fa fa-cart-plus\"></i>");
													out.println("<span class=\"content content-inner\">Mua hàng</span></div>");
												%>
											</div>
										</div>
										<div class="col-lg-12 col-md-4 col-sm-1 hidden-xs"></div>
									</div>
								</div>

								<div class="col-ms-12 figureBook">
									<p class="header">Giới thiệu tác phẩm</p>
									<%
										if (result instanceof Book) {
											Book book = (Book)result;
											String figure = book.getMoTa();
											if (figure.length() > 0) out.println("<p class=\"content\">" + figure + "</p>");
											else out.println("<p class=\"content\">Đang cập nhật nội dung</p>");
										}
									%>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
	</div>

		<%@ include file="/comp/Footer.jsp" %>
</body>
</html>