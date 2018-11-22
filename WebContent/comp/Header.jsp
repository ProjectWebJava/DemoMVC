<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn-toggle").click(function(){
			var display = $("#btn-toggle").next().css("display");
			if (display == "none"){
				$("#btn-toggle").next().css({"display":"block", "height":"100%"});
			} else {
				$("#btn-toggle").next().css({"display":"none", "height":"0px"});
			}
		});
	});
</script>
<body>

	<header>
		<!-- Thanh topbar -->
		<div class="container-fluid">

			<!-- Thanh tiêu để trên cùng dành cho màn hình trung bình và hẹp -->
			<div class="topbar">
				<div class="container">
					<div class="row">
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-ms-1">
							<span id="logo">Logo</span>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-ms-4">
							<form action="" class="search-bar clearfix" id="search-textbox">
								<input type="text" id="search" placeholder="Nhập tên sách..."></input>
								<span><i class="fa fa-search"></i></span>
							</form>
							<div id="zoom-btn"><i class="fa fa-search"></i></div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-6">
							<div class="icon-bar horizontal">
								<ul>
									<li>
										<div class="i-right dropdown">
											<i class="fa fa-user"></i>
											<div class="right-dropdown-content">
												<%
													HttpSession ses = request.getSession();
													String user = (String)ses.getAttribute("User");
													if (user == null){
														out.println("<ul>");
														out.println("<li><a href=\"login\">Đăng nhập</a>");
														out.println("<li><a href=\"http://localhost:8080/Web_Ban_Sach/SignUp.jsp\">Đăng ký tài khoản</a>");
														out.println("</ul>");
													}
													else
													{
														out.println("<ul>");
														out.println("<li><a href=\"\">Thông tin tài khoản</a>");
														out.println("<li><a href=\"logout\">Đăng xuất</a>");
														out.println("</ul>");
													}
												%>
											</div>
										</div>
									</li>
									<li>
										<div class="top-cart cart-icon">
											<a href="ViewCart"><i class="fa fa-briefcase"></i></a>
											<div class="cart-count">
												<%
													int count = 0; 
													Cookie[] arg_Cookies = request.getCookies();
													if (arg_Cookies != null){
														for(int i=0; i<arg_Cookies.length; i++){
															Cookie cookie = arg_Cookies[i];
															if (arg_Cookies[i].getName().equalsIgnoreCase("countBook")){
																count = Integer.parseInt(cookie.getValue());
															}
														}
													}
													out.println("<span id=\"number\">" + count + "</span>");
												%>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Thanh menu -->
			<nav>
				<div class="container">
					<!-- Menu -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-ms-12">
							<div class="navbar" style="border:none">
								<ul class="nav nav-left">
									<li class="nav-item nav-item-lv1 active"><a class="nav-link"
										href="http://localhost:8080/Web_Ban_Sach">Trang chủ</a></li>
									<li class="nav-item nav-item-lv1"><a class="nav-link"
										href="http://localhost:8080/Web_Ban_Sach/Bookshelf">Sách mới</a></li>
									<li class="nav-item nav-item-lv1"><a class="nav-link"
										href="http://localhost:8080/Web_Ban_Sach/Bookshelf">Sách hot</a></li>
								</ul>
								<div class="nav nav-toggle">
									<button id="btn-toggle">
										<i class="fa fa-align-justify"></i>
									</button>
									<div class="toggle-content">
										<span class="toggle-item"><a
											href="http://localhost:8080/Web_Ban_Sach">Trang chủ</a></span> 
										<span class="toggle-item"><a
											href="http://localhost:8080/Web_Ban_Sach/Bookshelf">Sách mới</a></span> 
										<span class="toggle-item"><a
											href="http://localhost:8080/Web_Ban_Sach/Bookshelf">Sách hot</a></span> 
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav></header>
</body>
</html>