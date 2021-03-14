<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

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

<%@ include file="./header.jsp"%>

<div class="row" align="center" style="font-family: 'Nanum Gothic', sans-serif;">
	<div class="col-lg-12">
		<div class="card-title" style="margin-top:-30px;">
			<h2 class="card-title text-center" style="color: #3C342E !important;">LIVRE LOGOUT</h2>
		<div class="card-body"style="padding-bottom:245px;">
      		<form class="form-signin" role="form" action="/logoutform"
			method="POST">
					<h2>${error }</h2>
					<h3>${logout }</h3>
			<div class="panel-body" >
				
					<fieldset>				
						<a href="index.html" class="logout">logout
						</a>
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" />
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(".logout").on("click", function(e) {
		 e.preventDefault();
		$("form").submit();
	});
</script>

<c:if test="${param.logout != null }">
	<script>
		$(document).ready(function() {
			alert("로그아웃");
		});
	</script>
</c:if>
