<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>FIND MY ID</title>
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="./header.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Sunflower:wght@300&display=swap" rel="stylesheet">
	



<body>
	<div align="center" style="height:350px">
	<form class="form-signin" role="form" method="POST" action="/findid">
		<label><pre style="font-family: 'Nanum Gothic', sans-serif;">       이름 : <input type="text" id="name"
					name="usernikname"
					style="width: 300px !important; margin: 100 !important; display: inline !important;"
					class="form-control" required autofocus>           </pre></label> <br>
		<label><pre  style="font-family: 'Nanum Gothic', sans-serif;">       생년월일 : <input type="date" name="birth"
					style="width: 300px !important; margin: 100 !important; display: inline !important;"
					class="form-control" required autofocus>                  </pre></label> <br>
		<label><pre  style="font-family: 'Nanum Gothic', sans-serif;">     전화번호 : <input type="tel" name="userpn"
					placeholder="010-0000-0000"
					pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"
					style="width: 300px !important; margin: 100 !important; display: inline !important;"
					class="form-control" required autofocus>                </pre></label> <br>
		<label><pre  style="font-family: 'Nanum Gothic', sans-serif;">             이메일 : <input type="text" id="email1"
					style="width: 200px !important; margin: 100 !important; display: inline !important;"
					class="form-control" required autofocus>  @  <input
					list="questions" id="email2" placeholder="직접 입력"
					style="width: 150px !important; display: inline !important;"
					class="form-control" required autofocus>
						</pre> <datalist id="questions">
				<option value="naver.com" />
				<option value="nate.com" />
				<option value="daum.net" />
				<option value="gmail.com" />
				<option value="zum.com" />
			</datalist> </label> <br>
			<input type="hidden" name="usermail" />
		<button id="findID" class="btn btn-lg btn-primary btn-block" 
		style="width: 300px !important; border: none; "type="submit">아이디 찾기</button>
		<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token}" /> <input type="hidden" name="findid" />
		</form>
	</div>
	
	<script>
	$("#findID").css("background-color","#3C342E");
	$("#findID").mouseover(function(){$(this).css("background-color","#746B65");})
	$("#findID").mouseleave(function(){$(this).css("background-color", "#3C342E");})
$(document).ready(function(e){
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue ="${_csrf.token}";
	$(document).ajaxSend(function(e,xhr,options){
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		});
		$("button[type='submit']")
		.on(
				"click",
				function(e) {
					e.preventDefault();
					$("input[name=usermail]").val(
							$("#email1").val() + "@"
									+ $("#email2").val());
					var formData = $(".form-signin").serialize();
					console.log(formData);
					$.ajax({
						type : "POST",
						url : "/findID",
						 
						data : formData,
						success : function(result){
							if(result != "fail"){
								alert(result);
								self.location="/loginform";
								return "/loginform";	
								
							} else {
								alert("맞지않는 유저 정보입니다");
								return false;	
							}
							}
		});
		});
		});

		</script>
</body>
</html>