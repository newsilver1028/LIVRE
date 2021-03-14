<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="./header.jsp"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8">
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
<title>NOTICE PW</title>
</head>
<body>
<div class="wrapper" align="center" style="height:328px; font-family: 'Nanum Gothic', sans-serif;">
<label><pre style="font-family: 'Nanum Gothic', sans-serif;">새로운 비밀번호 : <input
type="password" id="upw" name="userpw1"
								style="width: 300px !important; display: inline !important;"
								class="form-control" required></pre></label><br>
<div align="center">
<form class="form-signin" role="form" method="POST"action="/update">
<input type="hidden" value=""name="userName">
            <label><pre style="font-family: 'Nanum Gothic', sans-serif;">               비밀번호 확인 : <input
								type="password" id="upw2" name="userpw"
								style="width: 300px !important; display: inline !important;"
								class="form-control" required>           </pre></label> 
								
								<button type="submit" id="noticePW" class="btn btn-lg btn-primary btn-block" 
		style="width: 300px !important; border: none;" >비밀번호 변경</button>
		
		<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token}" /> <input type="hidden" name="noticepw" />
</form>
</div>
</div>
	<script>
	$("#noticePW").css("background-color","#3C342E");
	$("#noticePW").mouseover(function(){$(this).css("background-color","#746B65");})
	$("#noticePW").mouseleave(function(){$(this).css("background-color", "#3C342E");})
			$(document).ready(function(e){
				let getLink = window.location.search;
				
				$("input[name=userName]").val(getLink);
				console.log($("input[name=userName]").val());
			     
                $("#noticePW")
                      .on(
                            "click",
                            function(e) {
                               e.preventDefault()
                               if($("#upw").val()!=$("#upw2").val()){
                               alert("비밀번호 확인이 맞지않습니다");
								return false;	}
                               $(".form-signin").submit();
                               });
				$(document).ajaxSend(function(e,xhr,options){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
					});
		});
		
		</script>
</body>
</html>