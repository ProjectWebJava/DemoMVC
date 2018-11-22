<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<div class="categories col-lg-3 col-sm-12">
				<div class="title">
					<p>Chức năng quản lý</p>
				</div>
				<ul class="detail">
					<li class="item"><a href="../Manager/BangTin">Quản lý bảng tin</a></li>
					<li class="item"><a href="../Manager/ThuChi">Quản lý thu chi</a></li>
					<li class="item active"><a href="../Manager/DonHang">Quản lý đơn hàng</a></li>
					<li class="item"><a href="../Manager/KhoSach">Quản lý kho sách</a></li>
					<li class="item"><a href="../Manager/KhachHang">Quản lý khách hàng</a></li>
				</ul>
			</div>

			<div class="col-lg-9 col-sm-12">
				<h3>
					<small>Quản lý đơn hàng</small>
				</h3>
				<hr>
				<div class="sbDH">
					<div class="container">
						<div class="dropdownSB">
							<button class="dropbtn" id="ftSearch"
								onclick="myFunctionSearch()">
								Filter<i class="fa fa-caret-down"></i>
							</button>
							<div class="dropdownSB-content" id="myDropdown">
								<a href="#">Mã đơn hàng</a> <a href="#">Mã khách hàng</a>
							</div>
						</div>
						<input type="text" class="btnSearch" name="search"
							placeholder="Tìm kiếm" id="btnSearch"> <span>
							<button type="submit" class="dropbtn">
								<i class="fa fa-search"></i>
							</button>
						</span>

					</div>
				</div>
				<hr>
				<div class="board" style="overflow-x:auto;">
					<ul class="ochuaQLDH">
						<li class="tbHere"><a href="#">Tất cả</a></li>
						<li><a href="#">Chờ duyệt</a></li>
						<li><a href="#">Đã duyệt</a></li>
						<li><a href="#">Hoàn thành</a></li>

					</ul>


					<div class="QLDH_tbDonHang">
						<table>
							<tbody>
								<tr>
									<th>Mã đơn hàng</th>
									<th>Mã khách hàng</th>
									<th>Tên khách hàng</th>
									<th>Địa chỉ</th>
									<th>Số điện thoại</th>
									<th>Mail</th>
									<th>Mã sách</th>
									<th>Tựa sách</th>
									<th>Giá</th>
									<th>Tình trạng</th>
									<th>Thao tác</th>
								</tr>
								<tr>
									<td>DH001</td>
									<td>KH001</td>
									<td>Nguyễn Tuấn Vũ</td>
									<td>số 123, đường abc, phường Bình Thọ, quận Thủ Đức,
										tpHCM</td>
									<td>0988xxxxxx</td>
									<td>xxxx@gmail.com</td>
									<td>SH01</td>
									<td>Sherlock Holmes - Tập 1</td>
									<td>99000</td>
									<td>Chờ duyệt</td>
									<td><a href="#">Duyệt</a></td>
								</tr>
								<tr>
									<td>DH002</td>
									<td>KH002</td>
									<td>Lê Minh Hổ</td>
									<td>số 456, đường abc, phường Bình Thọ, quận Thủ Đức,
										tpHCM</td>
									<td>016xxxxxxxx</td>
									<td>xxxx@gmail.com</td>
									<td>SH02</td>
									<td>Sherlock Holmes - Tập 2</td>
									<td>99000</td>
									<td>Đã duyệt</td>
									<td><a href="#">Hủy</a></td>
								</tr>
								<tr>
									<td>DH003</td>
									<td>KH003</td>
									<td>Bùi Công Hiếu</td>
									<td>số 789, đường abc, phường Bình Thọ, quận Thủ Đức,
										tpHCM</td>
									<td>016xxxxxxx</td>
									<td>xxxx@gmail.com</td>
									<td>SH03</td>
									<td>Sherlock Holmes - Tập 3</td>
									<td>99000</td>
									<td>Hoàn thành</td>
									<td><a href="#"> </a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<hr>

			</div>

		</div>
	</div>
		
	<!-- Phần footer cho trang Web -->
	<%@ include file="/comp/Footer.jsp"%>
</body>
</html>