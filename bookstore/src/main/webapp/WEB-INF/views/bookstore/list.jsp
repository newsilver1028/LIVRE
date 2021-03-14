<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>LIVRE</title>
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="../header.jsp"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<form id="searchForm" action="/bookstore/list" method="get">
	&nbsp;&nbsp;&nbsp;<select name="type"
		style="border-radius: 4px; margin-top: -88px; margin-right: 420px; float: right; height: 35px; border: 1px solid #CBCBCB; outline: none;">
		<option value="" ${pageMaker.cri.type==null?"selected":"" }>
			--</option>
		<option value="B" ${pageMaker.cri.type eq "B"?"selected":"" }>
			책이름</option>
		<option value="A" ${pageMaker.cri.type eq "C"?"selected":"" }>
			저자</option>
		<option value="P" ${pageMaker.cri.type eq "W"?"selected":"" }>
			출판사</option>
	</select><input type="text" class="form-control" name="keyword"
		value="${pageMaker.cri.keyword }"
		style="margin-top: -90px; width: 270px; margin-right: 140px; float: right;" /><input
		type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<button class="btn btn-warning" id="searchbt"
		style="border: none; outline: none; color: white; margin-top: -90px; margin-right: 60px; float: right;">Search</button>
</form>

<div align="center"
	style="font-family: 'Nanum Gothic', sans-serif; color: #3C342E">

	<table class="table table-bordered" id="dataTable"
		style="float: right; width: 100%; cellspacing: 0">

		<c:forEach var="store" items="${list }">
			<div id="three-column" class="container"
				style="display: inline-block !important; margin: 30px !important; width: 400px !important;">
				<div class="tbox1">
					<div class="box-style box-style01">
						<div class="content" style="margin-left: 10px !important;">
							<div class="image" style="margin-bottom: 10px !important;">
								<a href="${store.bno}" class="move" id="${store.url }"> <img
									src="<c:url value="/img/${store.url }"/>" width="300"
									height="400" alt="" />
								</a>
							</div>
							<div id="valuewrapper" style="margin-left: 10px !important;">
								<c:out value="책 제목 : ${store.bookName }" />
								<br>
								<c:out value="글쓴이 : ${store.author }"></c:out>
								<br>
								<c:out value="출판사 : ${store.publisher }" />
								<br>
								<c:out value="가격 : ${store.price } 원" />
								<br>
								<fmt:formatDate pattern="yyyy-MM-dd"
									value="${store.updateDate }" />

							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</table>
	<form id="actionForm" action="/bookstore/list" method="get">
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token}" />
	</form>
	<div style="float: right !important; margin-right: 700px;">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item previous"><a
					href="${pageMaker.startPage-1 }" class="page-link">Prev</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }">
				<li
					class='page-item 
			${pageMaker.cri.pageNum==num?"active":"" }'>
					<a href="${num }" class="page-link">${num }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="page-item next"><a href="${pageMaker.endPage+1 }"
					class="page-link">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>

<form id="actionForm2" action="/bookstore/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
</form>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$("#searchbt").css("background-color", "#3C342E");
	$("#searchbt").mouseover(function() {
		$(this).css("background-color", "#746B65");
	})
	$("#searchbt").mouseleave(function() {
		$(this).css("background-color", "#3C342E");
	})
	$(document)
			.ready(
					function(e) {

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
											
											$("#actionForm").attr("action",
													"/bookstore/get");
											
											$("#actionForm").submit();
										});// end_move_onClick

										
						var actionForm = $("#actionForm2");
						$(".page-item a").on(
								"click",
								function(e) {
									e.preventDefault();
									
									console.log("click");
								
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									/* 액션폼 인풋태그에 페이지넘 값을 찾아서,
									 * href로 받은 값으로 대체함.
									 */
									actionForm.submit();
								}); // end_page

						var searchForm = $("#searchForm");
						$("#searchForm button").on(
								"click",
								function(e) {
									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색 종류를 선택하세요.");
										return false;
									}
									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요.");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val(1);
									e.preventDefault();
									searchForm.submit();
								});
					})
</script>
</html>