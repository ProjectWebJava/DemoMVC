<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Tìm kiếm</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css" data-minify="1"/>
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- Phần header cho trang Web -->
	<%@ include file="/comp/Header.jsp" %>
	
	<div class="container-fluid" id="content">
		<section>
			<div clas="container-fluid">
				<div class="row khung">
					<div class="categories col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<div class="title">
							<p>Danh mục sách</p>
						</div>
						<ul class="detail">
							<li class="item"><a href="">Sách mới</a></li>
							<li class="item"><a href="">Sách bán chạy</a></li>
						</ul>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<div id="my-carousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#my-carousel" data-slide-to="0" class="active"></li>
								<li data-target="#my-carousel" data-slide-to="1" class=""></li>
								<li data-target="#my-carousel" data-slide-to="2" class=""></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img src="image/banner-01.jpg"
										style="width: 100%; background-repeat: no-repeat;">
								</div>
								<div class="item">
									<img src="image/banner-02.jpg"
										style="width: 100%; background-repeat: no-repeat;">
								</div>
								<div class="item">
									<img src="image/banner-03.jpg"
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
				</div>
			</div>
		</section>
			<div class="board">
			<div class="row option-search">
				<div class="col-md-3">
					<h4 style="margin: 0px;">
						<span>Tìm kiếm theo:</span>
					</h4>
					<form>
						<input type="radio" name="gender" value="male" style="display:inline-block;"> Tên<br>
						<input type="radio" name="gender" value="female"style="display:inline-block;"> Tác giả<br>
						<input type="radio" name="gender" value="other"style="display:inline-block;"> Nhà xuất bản<br>
					</form>
				</div>
			</div>
			<div class="row">
					<div class="col-ms-12" style="text-align:center">
						<button type="button" style="margin-bottom: 10px;">Tìm kiếm</button>
					</div>
				</div>
				<h3 style="text-align:center;margin:0px;">Kết quả tìm kiếm</h3>
			</div>
		<article>
		</article>
	</div>
	
	<!-- Phần footer cho trang Web -->
	<%@ include file="/comp/Footer.jsp" %>
</body>
</html>