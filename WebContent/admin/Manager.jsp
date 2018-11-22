<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css" data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="lib/css/styleView.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>

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
					<li class="item" onclick='gotoPage("Manager/BangTin")'><a href="Manager/BangTin">Quản lý bảng tin</a></li>
					<li class="item" onclick='gotoPage("Manager/ThuChi")'><a href="Manager/ThuChi">Quản lý thu chi</a></li>
					<li class="item" onclick='gotoPage("Manager/DonHang")'><a href="Manager/DonHang">Quản lý đơn hàng</a></li>
					<li class="item" onclick='gotoPage("Manager/KhoSach")'><a href="Manager/KhoSach">Quản lý kho sách</a></li>
					<li class="item" onclick='gotoPage("Manager/KhachHang")'><a href="Manager/KhachHang">Quản lý khách hàng</a></li>
				</ul>
			</div>
			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
			</div>
		</div>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="/comp/Footer.jsp"%>
</body>
</html>