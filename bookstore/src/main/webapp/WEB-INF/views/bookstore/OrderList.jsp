<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div align="center">
<h3 style="color: #3C342E !important; margin-top:30px; margin-bottom:30px; font-family: 'Nanum Gothic', sans-serif;"><b>MY ORDER</b></h3>
<table id="table5">
<tbody>
	<th>선택</th>
	<th>이미지</th>
	<th>주문번호</th>
	<th>책 이름</th>
	<th>가격</th>
	<th>상태</th>
	<th>날짜</th>
	<c:forEach var="store" items="${list }">
		<tr><label>
		<td><input type="checkbox" id="${store.bno }" class="${store.dataList }" name="order" value="order"></td>
			<input type="hidden" value="${store.bno }"name="bnobno">
		<td><img src="<c:url value="/img/${store.url }"/> "width="30px" height="40px" alt="" /><a href="${store.bno}"></a></td>
		<td><c:out value="${store.bno}"/></td>
		<td><c:out value="${store.bookName }"/></td>
		<td><c:out value="${store.price }"/></td>
		<td><c:out value="${store.dataList }"/></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${store.updateDate }"/></td></label>
		</tr>
        </c:forEach>
        </tbody>
</table>

<table id="buttonwrapper3" style="float:right; margin:20px 250px 50px 10px;">
<tbody>
<tr>
<td><input type="button" id="cancelorder" class="btn btn-lg btn-primary btn-block"  style="margin-right:20px;width:70px !important; border: none; font-size:0.9em;" value="취소"> </td>
<td><input type="button" id="cancelorder" class="btn btn-lg btn-primary btn-block" 
			style="margin-right:20px;width: 70px !important; border: none; font-size:0.9em;" value="교환"></td>
<td><input type="button" id="cancelorder" class="btn btn-lg btn-primary btn-block" 
			style="width: 70px !important; border: none; font-size:0.9em;" value="반품"></td>
</tr>
</tbody>
        </table>


		<form id="actionForm" action="/bookstore/list" method="get">
      <input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />
      </form>
      <hr style="border-top: 1px dashed #3C342E; width:90%; border-bottom:none; margin-top:80px;margin-bottom:100px;" >
      </div>

<script>
	$("#buttonwrapper3 #cancelorder").mouseover(function() {
		$(this).css("background-color", "#746B65");
	})
	$("#buttonwrapper3 #cancelorder").mouseleave(function() {
		$(this).css("background-color", "#3C342E");
	})

	$(document)
			.ready(
					function(e) {

						$("#buttonwrapper3 #cancelorder").css(
								"background-color", "#3C342E");
						$("#buttonwrapper3 #cancelorder")
								.on(
										"click",
										function(e) {
											var bnoList = new Array();
											var size = $("input:checkbox[name='order']:checked").length;
											var dataList = new Array();

											for (i = 0; i < size; i++) {
												if ($(
														"input:checkbox[name='order']")
														.is(":checked") == true) {
													bnoList
															.push($(
																	"input[name='order']:checked")
																	.eq(i)
																	.attr("id"));
													if ($(this).val() == '취소') {
														dataList.push("결제 취소");
													} else if ($(this).val() == '교환') {
														dataList.push("교환 요청");
													} else if ($(this).val() == '반품') {
														dataList.push("반품 요청");
													}
												}
											}
											console.log(bnoList);
											var objParams = {
												"bno" : bnoList,
												"dataList" : dataList
											};
											var csrfHeaderName = "${_csrf.headerName}";
											var csrfTokenValue = "${_csrf.token}";
											$(document)
													.ajaxSend(
															function(e, xhr,
																	options) {
																xhr
																		.setRequestHeader(
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
										});

					});
</script>
