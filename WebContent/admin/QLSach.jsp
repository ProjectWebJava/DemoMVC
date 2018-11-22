
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
<script type="text/javascript" src="../lib/js/Cookies.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../lib/css/animate.css">

<script type="text/javascript">
	$(document).ready(function(){
		var action = '${result}';
		if (action == "1" || action == "2"){
			$("#submit").click(function(){
				//Set up value to save
				var id, name, gia, theLoai, nxb, tacGia, moTa, duongDan;
				
				if (action == "2") id = '${id}';
				name = $("#name").val();
				gia = $("#price").val();
				theLoai = $("#category").val();
				nxb = $("#NXB").val();
				tacGia = $("#author").val();
				moTa = $("#figure").val();
				duongDan = document.cookie.split("=")[1];
				
				if (action == "1"){
					$.post("../Manager/Sach?action=add", {
						name: name,
						gia: gia,
						theLoai: theLoai,
						nxb: nxb,
						tacGia: tacGia,
						moTa: moTa,
						duongDan: duongDan
					},
					function(data, status){
						if (status == "success"){
							alert("Lưu thành công!");
							resetInput();
						} else {
							alert("Lưu không thành công!");
						}
					});
				} else {
					var imageAction = '${imageAction}';
					if (imageAction == "add"){
						$.post("../Manager/Sach?action=modify", {
							id: id,
							name: name,
							gia: gia,
							theLoai: theLoai,
							nxb: nxb,
							tacGia: tacGia,
							moTa: moTa,
							imageAction: imageAction,
							duongDan: duongDan
						},
						function(data, status){
							if (status == "success"){
								alert("Chỉnh sửa thành công!");
							} else {
								alert("Chỉnh sửa không thành công!");
							}
						});
					} else {
						$.post("../Manager/Sach?action=modify", {
							id: id,
							name: name,
							gia: gia,
							theLoai: theLoai,
							nxb: nxb,
							tacGia: tacGia,
							moTa: moTa,
							imageAction: imageAction,
							duongDan: duongDan,
							maAnh: '${maAnh}'
						},
						function(data, status){
							if (status == "success"){
								alert("Chỉnh sửa thành công!");
							} else {
								alert("Chỉnh sửa không thành công!");
							}
						});
					}
				}
			});
		}
	});
	
	function resetInput(){
		document.getElementById("name").value = "";
		document.getElementById("price").value = "";
		document.getElementById("category").value = "";
		document.getElementById("NXB").value = "";
		document.getElementById("author").value = "";
		document.getElementById("figure").value = "";
		document.getElementById("image").src = "";
		document.getElementById("inputImage").value = "";
	}
	
	window.addEventListener("load", function() {
		  document.getElementById("inputImage").onchange = function(event) {
			 var tmppath = URL.createObjectURL(event.target.files[0]);
			 $("#image").attr("src", URL.createObjectURL(event.target.files[0]));
			 setCookie("img", event.target.files[0].name);
		}});
</script>
</head>
<body class="common-home">

	<!-- Phần header cho trang Web -->
	<%@ include file="/comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row"  style="background-color: #eeeeee;">
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
			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12" id="main-content">
				<ul class="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
					<li itemprop="itemListElement"
						itemtype="http://schema.org/ListItem"><a itemprop="item"
						href="../Manager/KhoSach"> <span itemprop="name"> <i></i>Quản lý kho
								sách
						</span>
					</a> <span><i class="fa fa-angle-right"></i></span>
						<meta itemprop="position" content="1"></li>
					<li itemprop="itemListElement"
						itemtype="http://schema.org/ListItem"><a itemprop="item"
						href=""> <strong itemprop="name">Nhập sách</strong>
					</a>
						<meta itemprop="position" content="3"></li>
				</ul>

				<hr>

				<div class="board" style="padding: 0px !important;">
					<!--Button-->
					<div class="col-ms-3 aSM" style="text-align: center;">
						<a href="">Hủy</a>
					</div>
					<%
						Object result = request.getAttribute("result");
						if (result != null){
							if (result.equals("1")){
								out.println("<div class=\"col-ms-6 tuade\">Nhập thêm sách</div>");
							} else if (result.equals("2")){
								out.println("<div class=\"col-ms-6 tuade\">Cập nhật thông tin sách</div>");
							}
						}
					%>
					<div class="col-ms-3 aSM" style="text-align: center;">
						<a href="../Manager/KhoSach" id="submit">Chấp nhận</a>
					</div>
				</div>

				<div class="board">

					<!--Khung thông tin-->
					<div class="row">
						<div class="col-sm-5 col-xs-12">
							<%
								Object resultBook = request.getAttribute("result");
								Book book = null;
								if ("2".equals(resultBook)) {
									book = (Book) request.getAttribute("book");
									
									out.println("<div class=\"NhapSachIMG\">");
									out.println("<img id=\"image\" src=\"../lib/image/" + book.getImages().getDuongDan() + "\"></img>");
									out.println("<input type=\"file\" accept=\"image/* \" style=\"width: 100%;\" id=\"inputImage\"></div>");
								} else if ("1".equals(resultBook)) {
									book = new Book();
									
									out.println("<div class=\"NhapSachIMG\">");
									out.println("<img id=\"image\" src=\"../lib/image/none.png\"></img>");
									out.println("<input type=\"file\" accept=\"image/* \" style=\"width: 100%;\" id=\"inputImage\"></div>");
								}
							%>
						</div>
						
						<%
							out.println("<div class=\"col-sm-7 col-xs-12\">");
							out.println("<div class=\"NhapSachINFO\">");

							//Input name
							out.println("<div class=\"fixLB\">");
							out.println("<i class=\"fa fa-book\" aria-hidden=\"true\"></i>");
							out.println("<label for=\"name\">Tên Sách</label>");
							out.println("<input type=\"text\" name=\"name\" placeholder=\"VD: Sherlock Holmes\" id=\"name\" value=\""
									+ book.getTenSach() + "\"></div>");
							out.println("<br>");

							//Input price
							out.println("<div class=\"fixLB\">");
							out.println("<i class=\"fa fa-book\" aria-hidden=\"true\"></i>");
							out.println("<label for=\"name\">Giá Sách</label>");
							if (book.getGiaBan() > 0){
								out.println("<input type=\"text\" name=\"price\" placeholder=\"VD: 220000\" id=\"price\" value=\""
										+ book.getGiaBan() + "\"></div>");
							} else {
								out.println("<input type=\"text\" name=\"price\" placeholder=\"VD: 220000\" id=\"price\"></div>");
							}
							out.println("<br>");

							//Input nxb
							out.println("<div class=\"fixLB\">");
							out.println("<i class=\"fa fa-book\" aria-hidden=\"true\"></i>");
							out.println("<label for=\"name\">Nhà Xuất Bản</label>");
							out.println("<input type=\"text\" name=\"NXB\" placeholder=\"VD: Nhà xuất bản Văn Học\" id=\"NXB\" value=\""
									+ book.getNXB() + "\"></div>");
							out.println("<br>");

							//Input category
							out.println("<div class=\"fixLB\">");
							out.println("<i class=\"fa fa-book\" aria-hidden=\"true\"></i>");
							out.println("<label for=\"name\">Thể loại</label>");
							out.println(
									"<input type=\"text\" name=\"category\" placeholder=\"VD: Sherlock Holmes\" id=\"category\" value=\""
											+ book.getTheLoai() + "\"></div>");
							out.println("<br>");

							//Input author
							out.println("<div class=\"fixLB\">");
							out.println("<i class=\"fa fa-book\" aria-hidden=\"true\"></i>");
							out.println("<label for=\"name\">Tác giả</label>");
							out.println(
									"<input type=\"text\" name=\"author\" placeholder=\"VD: Sherlock Holmes\" id=\"author\" value=\""
											+ book.getTacGia() + "\"></div>");

							out.println("</div></div>");

							//Input figure
							out.println("<div class=\"col-ms-12\">");
							out.println("<div class=\"figureNhapSach\">");
							out.println("<i class=\"fa fa-book\" aria-hidden=\"true\"></i>");
							out.println("<label for=\"name\">Mô tả</label>");
							out.println("<textarea placeholder=\"Mô tả\" id=\"figure\">" + book.getMoTa() + "</textarea></div>");

							out.println("</div></div>");
						%>
					</div>
					
					<!-- <div class="row">
						<div class="col-ms-3">
							<div class="button-modify">
								<div class="button-rect forest">
									<i class="fa fa-money"></i>
									<span class="content-inner">Hủy</span>
								</div>
							</div>
						</div>
						<div class="col-ms-6"></div>
						<div class="col-ms-3">
							<div class="button-modify">
								<div class="button-rect cool">
									<i class="fa fa-money"></i>
									<span class="content-inner">Chấp nhận</span>
								</div>
							</div>
						</div>
					</div>
 -->				</div>
			</div>
		</div>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="/comp/Footer.jsp"%>
</body>
</html>