<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ADMIN RECEIVE</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="../header.jsp"%>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
   <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Sunflower:wght@300&display=swap" rel="stylesheet">

<div align="center" id="divdiv" >
<h3 style="color: #3C342E !important; margin-top:30px; margin-bottom:30px; font-family: 'Nanum Gothic', sans-serif;"><b>RECEIVE</b></h3>
<div style="overflow:auto; height:1000px;">
<form id="actionForm" action="/bookstore/list" method="get">
<table id="table5" >
<tbody>
	<th>이미지</th>
	<th>주문번호</th>
	<th>책 이름</th>
	<th>판매자</th>
	<th>송장번호</th>
	<th>상태</th>
	<th>날짜</th>
	<c:forEach var="store" items="${list }">
		<tr>
		<td><img src="<c:url value="/img/${store.url }"/> "width="30px" height="40px" alt="" /><a href="${store.bno}"></a></td>
		<td><c:out value="${store.bno}"/></td>
		<td><c:out value="${store.bookName }"/></td>
		<td><c:out value="${store.writer }"/></td>	
		<td><c:out value="${store.shippingNumber }"/></td>
		<td>
			<select id="datalist" class="${store.bno }" name="dataList" form="actionForm" required>
					<option selected>${store.dataList}</option>
					<option value="수취 승인">수취 승인</option>
					<option value="판매 중">수취 완료</option>
					<option value="수취 취소">수취 취소</option>
				</select>
		 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
		 <input type="hidden" name="bno" value="${store.bno }">
				</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${store.updateDate }"/></td>	
		</tr>	
        </c:forEach>
        </tbody>
</table>
</form>
</div>
<input type="button" id="receive" class="btn btn-lg btn-primary btn-block" name="${store.bno }" style="margin-right:20px;width:70px !important; border: none; font-size:0.9em;" value="확인">
<hr style="border-top: 1px dashed #3C342E; width:90%; border-bottom:none; margin-top:80px;margin-bottom:100px;" >

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		$("#divdiv #receive").mouseover(function() {
			$(this).css("background-color", "#746B65");
		})
		$("#divdiv #receive").mouseleave(function() {
			$(this).css("background-color", "#3C342E");
		})
		$(document).ready(
				function(e) {

					$("#divdiv #receive").css("background-color", "#3C342E");

					$("#divdiv #receive").on(
							"click",
							function(e) {
								var bnoList = new Array();
								var dataList = new Array();
								var size = $("input[name='bno']").length;
								var arr = $("#table5 select[name='dataList']")
										.val();

								for (i = 0; i < size; i++) {
									bnoList.push($("input[name='bno']").eq(i)
											.attr("value"));
									dataList.push($(
											"."
													+ $("input[name='bno']")
															.eq(i)
															.attr("value"))
											.val());
								}
								var objParams = {
									"bno" : bnoList,
									"dataList" : dataList
								};
								var csrfHeaderName = "${_csrf.headerName}";
								var csrfTokenValue = "${_csrf.token}";
								$(document).ajaxSend(
										function(e, xhr, options) {
											xhr.setRequestHeader(
													csrfHeaderName,
													csrfTokenValue);
										});

								e.preventDefault();

								$.ajax({
									type : "POST",
									url : "/bookstore/refundorder",
									data : objParams,
									success : function(result) {
										location.reload();
									}
								})
							})

				})
	</script>