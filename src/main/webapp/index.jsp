<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="WEB-INF/pages/common/head.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="copyright" content="Copyright 2016" />
<meta name="Author" content="陈镪" />
<meta name="keywords" content="网上订货系统--订单管理,库存管理,采购管理,财务管理,系统管理" />
<meta name="description" content="系统登陆页面" />
<title>网上订货系统登录页面</title>
<link rel="stylesheet" type="text/css" href="${baseurl}static/css/login/style.css" />
<style type="text/css">
	.download{margin:20px 33px 10px;*margin-bottom:30px;padding:5px;border-radius:3px;-webkit-border-radius:3px;
		-moz-border-radius:3px;background:#e6e6e6;border:1px dashed #df0031;font-size:14px;font-family:Comic Sans MS;
		font-weight:bolder;color:#555}
	.download a{padding-left:5px;font-size:14px;font-weight:normal;color:#555;text-decoration:none;letter-spacing:1px}
	.download a:hover{text-decoration:underline;color:#36F}
	.download span{float:right}
</style>
</head>

<body>
	<div class="main">
		<div class="header hide"> 管理系统  </div>
		<div class="content">
			<div class="title hide">管理系统登录</div>
			<form name="login" action="#" method="post">
				<fieldset>
				
					<!--USERNAME -->
					<div>
						<div class="input">
							<input class="input_all name" name="name" id="username" placeholder="用户名" type="text"
								   style="padding-left:46px;padding:25px 46px 40px;"
								   onFocus="this.className='input_all name_now';"
								   onBlur="this.className='input_all name'" maxLength="24" />
						</div>
						<div id="username_span"style="display:none;margin:25px 0px 40px 0px;padding:0px 0px 0px 0px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="userspan"></span>
						</div>
							
					</div>
					
					<!-- PASSWORD -->
					<div>
						<div class="input">
							<input class="input_all password" name="password" id="password" type="password"
								   style="padding-left:46px;padding:25px 46px 40px;"
								   placeholder="密码" onFocus="this.className='input_all password_now';"
								   onBlur="this.className='input_all password'" maxLength="24" />
						</div>
						
						<div id="password_span"style="display:none;margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="passwordspan"></span>
						</div>

						<div style="margin-bottom:12px">
							<div id="randiv" style="display:none;margin-left:98px;">
							</div>
							<span id="errorspan" style="margin-left:95px;"></span>
						</div>

					</div>

					<!-- LOGIN -->
					<!--
						<div class="enter">
							<input class="button hide" name="submit" type="submit" value="登录" />
						</div>
					-->
					<div>
						<a href="#" id="login" class="button hide">登录</a>
					</div>
					
				</fieldset>
			</form>
		</div>
	</div>
<script type="text/javascript" src="${baseurl}static/js/login/placeholder.js"></script>
<script type="text/javascript">
		$("#login")
				.click(
						function() {

							var uname = $("#username");
							var pwd = $("#password");
							var display = $("#randiv").css('display');

							if (display == 'none') {
								if ($.trim(uname.val()) == "") {
									$('#username_span').css('display','block');
									$("#passwordspan").html("");
									$("#userspan")
											.html(
													"<font color='red'>用户名不能为空！</font>");
									uname.focus();
								} else if ($.trim(pwd.val()) == "") {
									$('#username_span').css('display','none');
									$('#password_span').css('display','block');
									$("#userspan").html("");
									$("#passwordspan").html(
											"<font color='red'>密码不能为空！</font>");
									pwd.focus();
								} else {
									$('#password_span').css('display','none');
									$("#userspan").html("");
									$("#passwordspan").html("");
									$.ajax({
										url : '${baseurl}admin/Login/ajaxLogin.do',// 跳转到 action
										data : {
											username : uname.val(),
											password : pwd.val(),
										},
										type : 'post',
										cache : false,
										dataType : 'json',
										success : function(data) {
											if (data.msg == 'account_error') {
										console.log("account_erroe.");
												$("#errorspan")
														.html(
																"<font color='red'> 用户不存在！</font>");
												rcode_flag = 1;
												$("#randiv").show();
											} else if (data.msg == 'password_error') {
												$("#errorspan")
														.html(
																"<font color='red'> 密码错误！</font>");
												rcode_flag = 1;
												$("#randiv").show();
											} else {
												//location.href = "${baseurl}admin/Login/home.do?username="+uname.val();
												document.write("<form action='${pageContext.request.contextPath}/admin/Login/home.do' method='post' name='form1' style='display:none'>");
												document.write("<input type='hidden' name='username' value="+uname.val()+">");
												document.write("</form>");
												document.form1.submit();
											}
										},
										error : function() {
											// view("异常！");
											alert("异常！");
										}
									});
								}
							} else {
								$("#errorspan").html("");
								if ($.trim(uname.val()) == "") {
									$("#passwordspan").html("");
									$("#userspan")
											.html(
													"<font color='red'>用户名不能为空！</font>");
									uname.focus();
								} else if ($.trim(pwd.val()) == "") {
									$("#userspan").html("");
									$("#passwordspan").html(
											"<font color='red'>密码不能为空！</font>");
									pwd.focus();
								} else {
									$("#userspan").html("");
									$("#passwordspan").html("");
									$.ajax({
										url : '${baseurl}admin/Login/ajaxLogin.do',// 跳转到 action
										data : {
											username : uname.val(),
											password : pwd.val(),
										},
										type : 'post',
										cache : false,
										dataType : 'json',
										success : function(data) {
											if (data.msg == 'account_error') {
												$("#errorspan")
														.html(
																"<font color='red'> 用户不存在！</font>");
												rcode_flag = true;
											} else if (data.msg == 'password_error') {
												$("#errorspan")
														.html(
																"<font color='red'> 密码错误！</font>");
												rcode_flag = true;
											} else {
												//location.href = "${baseurl}admin/Login/home.do?username="+uname.val();
												document.write("<form action='${pageContext.request.contextPath}/admin/Login/home.do' method='post' name='form1' style='display:none'>");
												document.write("<input type='hidden' name='username' value="+uname.val()+">");
												document.write("</form>");
												document.form1.submit();
											}
										},
										error : function() {
											// view("异常！");
											alert("异常！");
										}
									});
								}
							}
						});
	</script>
</body>
</html>