<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>

<link rel="stylesheet" type="text/css" href="../lib/css/stylesheet.css" data-minify="1"/>
<link rel="stylesheet" type="text/css" href="../lib/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="../lib/js/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/js/vu.js"></script>


</head>
<body>

	<!-- Phần header cho trang Web -->
	<%@ include file="/comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row">
			<div class="categories col-lg-3 col-md-3 col-sm-12">
				<div class="title">
					<p>Chức năng quản lý</p>
				</div>
				<ul class="detail">
					<li class="item active"><a href="../Manager/BangTin">Quản lý bảng tin</a></li>
					<li class="item"><a href="../Manager/ThuChi">Quản lý thu chi</a></li>
					<li class="item"><a href="../Manager/DonHang">Quản lý đơn hàng</a></li>
					<li class="item"><a href="../Manager/KhoSach">Quản lý kho sách</a></li>
					<li class="item"><a href="../Manager/KhachHang">Quản lý khách hàng</a></li>
				</ul>
			</div>

			<div class="col-lg-9 col-md-9 col-sm-12">
				<h3>
					<small>Quản lý bản tin</small>
				</h3>

				<div id="my-carousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#my-carousel" data-slide-to="0" class="active"></li>
						<li data-target="#my-carousel" data-slide-to="1" class=""></li>
						<li data-target="#my-carousel" data-slide-to="2" class=""></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="../image/banner-01.jpg"
								style="width: 100%; background-repeat: no-repeat;">

						</div>
						<div class="item">
							<img src="../image/banner-02.jpg"
								style="width: 100%; background-repeat: no-repeat;">
						</div>
						<div class="item">
							<img src="../image/banner-03.jpg"
								style="width: 100%; background-repeat: no-repeat;">
						</div>

						<a class="left carousel-control" href="#my-carousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#my-carousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>

			<div class="col-ms-12">
				<h3 style="text-align: center; color: black;">Thêm tin</h3>

				<div class="txtThemTin">
					<input type="text" class="form-control" size="60" placeholder="Nội dung..."> 
					<input type="file" accept="image/* " style="width: 100%;" id="inputImage"> 
					<i style="color: red; text-align: center"> (Nên chọn ảnh có kích thước: px x px) </i>
				</div>

				<div class="btnThemTin" style="width: 100%; overflow: hidden;">
					<span><button type="button" class="btn btn-danger"
							style="float: left;">Hủy</button></span> <span><button
							type="button" class="btn btn-primary" style="float: right;">Thêm</button></span>
				</div>
				
				<h3 style="text-align: center; color: black;">Tin đang hoạt động</h3>

				<div style="text-align: center;">
					<div class="board">
						<img src="../image/banner-01.jpg"></img>
						<div class="tininfo">
							<div class="container">
								<div class="intro-text">
									<h3>BOOK!</h3>
									<p>It's Nice To Meet You</p>
									<button onclick="myFunction()" class="btn" id="xoabt">Xoá</button>
									<button class="btn">Sửa</button>
								</div>
							</div>
						</div>
					</div>

					<div class="board">
						<img src="../image/banner-02.jpg"></img>
						<div class="tininfo">
							<div class="container">
								<div class="intro-text">
									<h3>BOOK!</h3>
									<p>It's Nice To Meet You</p>
									<button class="btn">Xoá</button>
									<button class="btn">Sửa</button>
								</div>
							</div>
						</div>
					</div>

					<div class="board">
						<img src="../image/banner-03.jpg"></img>
						<div class="tininfo">
							<div class="container">
								<div class="intro-text">
									<h3>BOOK!</h3>
									<p>It's Nice To Meet You</p>
									<button class="btn">Xoá</button>
									<button class="btn">Sửa</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="/comp/Footer.jsp"%>
</body>
</html>