<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>  
<title>LIVRE LOGIN</title>
<meta charset="utf-8">
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  


  <h2 class="card-title text-center" style="color: #3C342E !important; margin-top:-30px; margin-bottom:50px;">LIVRE LOGIN</h2>
  
  
<div align="center" style="font-family: 'Nanum Gothic', sans-serif;">
  

	<div style="width:100%;
	background: #F1F2E9 !important; ">
		<div class="card-title" style="margin-top:-30px;">
			
		</div>
		<div class="card-body"style="padding-bottom:110px;">
      <form class="form-signin" role="form" action="/login"
			method="POST">
        <label for="inputEmail" class="sr-only" >Your ID</label>
        <input type="text" name="userName" style="width: 300px !important;"class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="inputPassword" class="sr-only" style="margin-bottom:30px !important;">Password</label>
        <input type="password" id="upw" name="userpw" style="width: 300px !important;"
        class="form-control" placeholder="Password" required><br>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" 
        style="width: 300px !important; border: none
        " type="submit">로 그 인</button>
        <input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token}" />
		<input type="button" id="btn-Yes2"
		class="btn btn-lg btn-primary btn-block" 
        style="width: 300px !important; margin-buttom:100px !important;  margin-top:8px !important; border: none; font-family: 'Nanum Gothic', sans-serif;" value="회원가입">
         
         <input type="button" id="findID" class="btn btn-lg btn-primary btn-block" 
        style="width: 300px !important; margin-buttom:100px !important;  border: none
        " value="아이디 찾기">
                
         <input type="button" id="findPW" class="btn btn-lg btn-primary btn-block" 
        style="width: 300px !important; margin-buttom:100px !important;  border: none
        " value="비밀번호 찾기">
              </form>
      
		</div>
	</div>
</div>
	<div class="modal">
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
  	<script>
  	$("#btn-Yes").mouseover(function(){$(this).css("background-color","#746B65");})
	$("#btn-Yes").mouseleave(function(){$(this).css("background-color", "#3C342E");})
	$("#btn-Yes2").mouseover(function(){$(this).css("background-color","#746B65");})
	$("#btn-Yes2").mouseleave(function(){$(this).css("background-color", "#3C342E");})
	$("#findID").mouseover(function(){$(this).css("background-color","none");})
	$("#findID").mouseleave(function(){$(this).css("background-color", "none");})
	$("#findPW").mouseover(function(){$(this).css("background-color","none");})
	$("#findPW").mouseleave(function(){$(this).css("background-color", "none");})
	$(document).ready(function(e){
		$("#btn-Yes").css("background-color","#3C342E");
		$("#btn-Yes2").css("background-color","#3C342E");
		$("input[type='button']")
		.on(
				"click",
				function(e) {
					self.location="/membership";
					
		});
		$("#findID").css("background-color","#3C342E");
		$("#findID")
		.on(
				"click",
				function(e) {
					self.location="/findID";
});
		$("#findPW").css("background-color","#3C342E");
		$("#findPW")
		.on(
				"click",
				function(e) {
					self.location="/findPW";
});});
  	
  	</script>
  </body>
</html>