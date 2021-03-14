<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MY CART</title>
</head>
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
<div class="myprofile" align="center" style="font-family: 'Nanum Gothic', sans-serif; color:#3C342E">
<h3 style="color: #3C342E !important; margin-bottom:30px; font-family: 'Nanum Gothic', sans-serif;"><b>MY CART</b></h3>
<div align="center">

<table id="table5">
<tbody>
	<th>BOOK_COVER</th>
	<th>BOOK_NAME</th>
	<th>AUTHOR</th>
	<th>PRICE</th>
	<th>DELETE</th>
	<c:forEach var="cartList" items="${list }">
		<tr>
		<td><a href="${cartList.bno}" class="move" id="${cartList.url }"><img src="/img/${cartList.url}" width="30px" height="40px;"></a></td>
		<td>${cartList.bookName }</td>
		<td>${cartList.author }</td>
		<td>${cartList.price } \</td>
		<td><input type="button" id="remove" name="${cartList.bno}" value="DELETE" class="btn btn-lg btn-primary btn-block"
         style="margin-padding:10px; width: 70px !important; border: none; font-size:0.8em;  font-family: 'Nanum Gothic', sans-serif;"></td>
		</tr>
        </c:forEach>
        </tbody>
</table>
<hr style="border-top: 1px dashed #3C342E; width:90%; border-bottom:none; margin-top:80px;margin-bottom:100px;" >

</div>
 

<form id="actionForm" action="/bookstore/list" method="get">
      <input type="hidden" name="${_csrf.parameterName }"
            value="${_csrf.token}" />
      </form>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$("#table5 #remove").css("background-color", "#3C342E");
	$("#table5 #remove").mouseover(function() {
		$(this).css("background-color", "#746B65");
	})
	$("#table5 #remove").mouseleave(function() {
		$(this).css("background-color", "#3C342E");
	})
	$(document)
			.ready(
					function(e) {
						var csrfHeaderName = "${_csrf.headerName}";
						var csrfTokenValue = "${_csrf.token}";
						$(document).ajaxSend(
								function(e, xhr, options) {
									xhr.setRequestHeader(csrfHeaderName,
											csrfTokenValue);
								});
						$("#table5 #remove").on("click", function(e) {
							e.preventDefault();

							var bno = $(this).attr("name");
							console.log(bno);
							var data = {
								bno : bno
							}
							$.ajax({
								type : "POST",
								url : "/bookstore/removecart",
								data : data,
								success : function(result) {
									location.reload();
								}
							})
						})

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											$("#actionForm")
													.append(
															"<input type='hidden' name='bno' "
																	+ "value='"
																	+ $(this)
																			.attr(
																					"href")
																	+ "'>"
																	+ "<input type='hidden' name='url' "
																	+ "value='"
																	+ $(this)
																			.attr(
																					"id")
																	+ "'>");
											/* 제목 링크에 걸린 bno 값을 가져와서,
											 * form 에 hidden 값으로 추가.
											 */
											$("#actionForm").attr("action",
													"/bookstore/get");				/* 목록으로 이동 처리를  get 이동으로 변경.*/
											$("#actionForm").submit();				/* 폼 전송. */
										});// end_move_onClick
					})
</script>