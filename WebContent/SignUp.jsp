<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Đăng ký tài khoản</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css" data-minify="1"/>
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
    $("#btn-Ok").click(function(){
        var id = $("#nameLogin").val().length;
        var name = $("#nameUser").val().length;
        var phone = $("#phone").val().length;
        var pass= $("#passLogin").val();
        var confirmPass = $("#confirmPass").val();
        if (id == 0 || name == 0 || 
        		pass.length == 0 || phone == 0|| confirmPass.length == 0) alert("Không được để trống trường nào!");
        if (pass.length > 0 && confirmPass.length > 0)
        	if (pass != confirmPass) alert("Mật khẩu không khớp!");
    });
});
</script>
</head>
<body>
	
	<%@ include file="/comp/Header.jsp" %>
	<div class="container" id="content">
		<section>
			<div class="container">
				<div class="row board">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<h3>Đăng ký tài khoản</h3>
						<h5>Chi tiết tài khoản</h5>
						<form action="" method="POST">
							<div class="form-group">
								<label class="control-label" for="nameLogin">Tên đăng
									nhập</label> <input type="text" name="nameLogin" value=""
									placeholder="User name" id="nameLogin">
							</div>
							<div class="form-group">
								<label class="control-label" for="nameUser">Tên người
									dùng</label> <input type="text" name="nameUser" value=""
									placeholder="Your name" name="nameUser" id="nameUser">
							</div>
							<div class="form-group">
								<label class="control-label" for="sex">Giới tính</label> <select
									class="form-control" name="sex" id="sex">
									<option>Nam</option>
									<option>Nữ</option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label" for="birth">Ngày sinh</label> <input
									type="date" name="birth" id="birth">
							</div>
							<div class="form-group">
								<label class="control-label" for="address">Địa chỉ</label> <input
									type="text" name="address" value="" placeholder="Your address"
									id="address">
							</div>
							<div class="form-group">
								<label class="control-label" for="phone">Số điện thoại
									liên hệ</label> <input type="text" name="phone" value=""
									placeholder="Your phone number" name="phone" id="phone">
							</div>
							<div class="form-group">
								<label class="control-label" for="pass">Mật khẩu đăng
									nhập</label> <input type="password" name="pass" value=""
									placeholder="Your password" name="pass" id="passLogin">
							</div>
							<div class="form-group">
								<label class="control-label" for="confirm-pass">Xác nhận
									mật khẩu</label> <input type="password" name="confirm-pass" value=""
									placeholder="Confirm your password" name="confirm-pass"
									id="confirmPass" onchange='checkPassword();'>
							</div>
							<input type="submit" value="Đăng ký" class="btn btn-primary"
								id="btn-Ok">
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
	<br>
	
	<%@ include file="/comp/Footer.jsp" %>
	
</body>
</html>