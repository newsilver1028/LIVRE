<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>FIND MY PW</title>
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
	
<title>아이디 찾기</title>

</head>
<body>

	<div class="wrapper" align="center" style="height:328px">
		<form class="form-signin" role="form" method="POST">
			<label><pre style="font-family: 'Nanum Gothic', sans-serif;">아이디 : <input type="text" name="userName"
						id="id_input"
						style="width: 300px !important; display: inline !important;"
						class="form-control" required autofocus></pre></label><br>

			<pre style="font-family: 'Nanum Gothic', sans-serif;">
			                <select  name="pwfind" style="height:37px" required>
               <option value="나의 취미는?">나의 취미는?</option>
               <option value="가장 여행가고 싶은 나라는?">가장 여행가고 싶은 나라는?</option>
               <option value="가장 좋아하는 색깔은?">가장 좋아하는 색깔은?</option>
               <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
               <option value="학창시절 가장 좋아하는 선생님은?">학창시절 가장 좋아하는 선생님은?</option>
            </select>  답변 : <input
					type="text" name="answer"
					style="width: 100px !important; display: inline !important;"
					class="form-control" required autofocus>      </pre>
			<br>
			<input type="hidden" id="nono">
			<pre style="font-family: 'Nanum Gothic', sans-serif;"><button id="findPW" class="btn btn-lg btn-primary btn-block" 
				style="width: 300px !important; border: none; margin-left:48px !important;" type="submit">비밀번호
				찾기</button></pre>
<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token}" /> <input type="hidden" name="findpw" />
		</form>
	</div>

			<script>
			$("#findPW").css("background-color","#3C342E");
		$("#findPW").mouseover(function(){$(this).css("background-color","#746B65");})
		$("#findPW").mouseleave(function(){$(this).css("background-color", "#3C342E");})
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
					var formData = $(".form-signin").serialize();
					console.log(formData);
					$.ajax({
						type : "POST",
						url : "/findPW",
						
						data : formData,
						
						success : function(result){
							if(result != "fail"){
								self.location="/noticePW?"+$("input[name=userName]").val();
								return "/noticePW";	
								
							} else {
								alert("맞지않는 유저 정보입니다");
								return false;	
							}
							}
					});
					
					
		});});
		</script>

</body>
</html>