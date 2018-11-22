<%@page import="model.Image"%>
<%@page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>

<link rel="stylesheet" type="text/css" href="../lib/css/stylesheet.css" data-minify="1" />
<link rel="stylesheet" type="text/css" href="../lib/css/style.css">
<link rel="stylesheet" type="text/css" href="../lib/css/styleView.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<script type="text/javascript" src="../lib/js/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../lib/css/animate.css">

<script type="text/javascript">
	
</script>
</head>
<body class="common-home">

	<!-- Phần header cho trang Web -->
	<%@ include file="/comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row" style="background-color: #eeeeee;">
			<div class="categories col-lg-3 col-md-3 col-sm-3 col-xs-12">
				<div class="title">
					<p>Chức năng quản lý</p>
				</div>
				<ul class="detail">
					<li class="item"><a href="../Manager/BangTin">Quản lý bảng tin</a></li>
					<li class="item"><a href="../Manager/ThuChi">Quản lý thu chi</a></li>
					<li class="item"><a href="../Manager/DonHang">Quản lý đơn hàng</a></li>
					<li class="item active"><a href="../Manager/KhoSach">Quản lý kho sách</a></li>
					<li class="item"><a href="../Manager/KhachHang">Quản lý khách hàng</a></li>
				</ul>
			</div>
			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
				<h2 class="animated bounce" style="text-align: center;">
					<small>Quản lý kho sách</small>
				</h2>
				<hr>

				<div class="bookshelf">
					<div class="row content">
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="book" id="them">
								<a href="../Manager/Sach?action=add"><img alt="them"
									src="../lib/image/plus.png"
									style="margin: 0px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);"></img></a>
							</div>
							
						</div>
						
						<%
							Object result = request.getAttribute("danhSachSach");
							if (result != null && result instanceof Book[]){
								Book[] books = (Book[])result;
								for (int i = 0; i<books.length; i++){
									String maSach = books[i].getMaSach();
									String tenSach = books[i].getTenSach();
									int giaBan = books[i].getGiaBan();
									Image pathImage = books[i].getImages();
									
									out.println("<div class=\"col-lg-3 col-md-4 col-sm-6\">");
									out.println("<div class=\"book\" id=\"" + maSach + "\">");
									
									if (pathImage != null)
										out.println("<img class=\"clear-margin f-center full-width\" alt=\"" + maSach + "\" style=\"max-width: \" src=\"../lib/image/" + pathImage.getDuongDan() + "\">");
									
									out.println("<div class=\"options\">");
									out.println("<div class=\"content\">");
									out.println("<div class=\"col-ms-6\"><a href=\"../Manager/Sach?id=" + maSach + "&action=modify\"><i class=\"fa fa-edit\"></i></a><span>Chỉnh sửa</span></div>");
									out.println("<div class=\"col-ms-6\"><i class=\"fa fa-trash\"></i><span>Xóa</span></div></div></div>");
									out.println("</div></div>");
								}
							}
						%>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="/comp/Footer.jsp"%>
</body>
</html>