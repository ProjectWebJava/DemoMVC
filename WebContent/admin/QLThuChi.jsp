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
		<div class="row"  style="background-color: #eeeeee;">
			<div class="categories col-lg-3 col-md-3 col-sm-3">
				<div class="title">
					<p>Chức năng quản lý</p>
				</div>
				<ul class="detail">
					<li class="item"><a href="../Manager/BangTin">Quản lý bảng tin</a></li>
					<li class="item active"><a href="../Manager/ThuChi">Quản lý thu chi</a></li>
					<li class="item"><a href="../Manager/DonHang">Quản lý đơn hàng</a></li>
					<li class="item"><a href="../Manager/KhoSach">Quản lý kho sách</a></li>
					<li class="item"><a href="../Manager/KhachHang">Quản lý khách hàng</a></li>
				</ul>
			</div>

			<div class="col-lg-9 col-md-9 col-sm-9">
				<h3 class="animated bounce">
					<small>Quản lý thu chi</small>
				</h3>
				<hr>

				<div class="khungThuChi">
					<div class="col-lg-2 QLTCtheo">
						<form>
							<div class="radio">
								<label><input type="radio" name="optradio" checked="">Theo
									quý</label>
							</div>
							<div class="radio">
								<label><input type="radio" name="optradio">Theo
									tháng</label>
							</div>
							<div class="radio">
								<label><input type="radio" name="optradio">Theo
									năm</label>
							</div>
						</form>
						<hr>
					</div>
					<div class="col-lg-10 QLTCtk">
						<div class="fixcenter">
							<label for="thoidiem">Chọn thời điểm cần thống kê:</label> <select
								id="thoidiem" name="thoidiem">
								<option value="Quý 1/2018">Quý 1/2018</option>
								<option value="Quý 2/2018">Quý 2/2018</option>
								<option value="Quý 3/2018">Quý 3/2018</option>
								<option value="Quý 4/2018">Quý 4/2018</option>
							</select>

						</div>
						<br>
						<div class="fixcenter">
							<label for="tong">Tổng số sách bán ra: </label> <input
								type="text" name="tong" placeholder="500" id="tong">

						</div>
						<br>
						<div class="fixcenter">
							<label for="thu">Thu vào: </label> <input type="text" name="thu"
								placeholder="500000000" id="thu">

						</div>
						<br>
						<div class="fixcenter">
							<label for="lai">Lãi suất: </label> <input type="text" name="lai"
								placeholder="200000000" id="lai">
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