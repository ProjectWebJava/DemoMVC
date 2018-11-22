<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Đăng nhập</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css" data-minify="1"/>
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
    $("#btn-search").click(function(){
        var id = $("#nameLogin").val().length;
        var pass= $("#passLogin").val().length;
        if (id == 0 || pass == 0) alert("Tên đăng nhập hoặc mật khẩu không được để trống");
    });
});
</script>
</head>
<body>
	
	<%@ include file="/comp/Header.jsp" %>
	<div class="container" id="content">
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
								href="login"> <strong itemprop="name">Đăng nhập</strong>
							</a>
								<meta itemprop="position" content="3"></li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<section>
			<div class="container">
				<div class="row">
					<div class="clearfix"></div>
					<div class="col-sm-12 col-xs-12 col-md-12">
						<div class="row">
							<div class="col-sm-6">
								<div class="board">
									<h3>Khách hàng mới?</h3>
									<span> <strong>Tại sao không đăng kí thành
											viên?</strong>
									</span> <br> <span>Thành viên có thể trải nghiệm và được
										thông báo một cách sớm nhất những chương trình khuyến mãi cũng
										như những đầu sách đang hot hiện nay.</span> <br>
									<br> <a
										href="http://localhost:8080/Web_Ban_Sach/SignUp.jsp"
										class="btn btn-primary"> Đăng kí ngay! </a>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="board">
									<h3>Đã có tài khoản</h3>
									<%
										String err = request.getParameter("err");
										if ("1".equals(err)) {
											out.print("<p>Tên đăng nhập không tồn tại!</p>");
										} else if ("0".equals(err)) {
											out.print("<p>Sai mật khẩu!</p>");
										}
									%>
									<form action="login" method="POST">
										<div class="form-group">
											<label class="control-label" for="nameLogin">Tên đăng
												nhập</label> <input type="text" name="nameLogin" value=""
												placeholder="Username" id="nameLogin" class="form-control">
										</div>
										<div class="form-group">
											<label class="control-label" for="passLogin">Mật khẩu</label>
											<input type="password" name="passLogin" value=""
												maxlength="10" placeholder="Password" id="passLogin"
												class="form-control">
										</div>
										<input type="submit" value="Đăng nhập" class="btn btn-primary"
											id="btn-search">
										<a class="forget-password" href="#form"><i class="fa fa-question-circle" id="QuenMK"></i></a>
									</form>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<div>
			<div class="forget" id="form">Quên mật khẩu
				<a class="close" href="#"><i class="fa fa-close" style="color: red; margin-right: 5px;"></i></a>
				<form class="forget-content" action="#" method="post">
					<label class="name"> <span>Tên đăng nhập</span> <input
						id="username" type="text" autocomplete="on" name="username"
						placeholder="Username..." value="" style="width: 90%;"/>
					</label>
					<button class="button submit-button" type="button">Khôi phục</button>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="/comp/Footer.jsp" %>	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('a.forget-password').click(function() {
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
				$('#over, .forget').fadeOut(300, function() {
					$('#over').remove();
				});
				return false;
			});
		});
	</script>
</body>
</html>