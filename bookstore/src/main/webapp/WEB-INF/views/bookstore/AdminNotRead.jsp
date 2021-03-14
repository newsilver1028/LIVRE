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
<link href="/resources/css/modal.css" rel="stylesheet" type="text/css"
   media="screen" />



<div align="center" style="height:600px; overflow: auto; position:relative;">
<div id="imgwrapper" style="width:300px !important; margin-left:-500px; display:inlint-block !important;">
      <div id="slider-wrap">
          <ul id="slider">
<c:forEach var="url" items="${url }">
<li>
<img src="<c:url value="/img/${url}"/>" width="300" height="400" alt="" /></li>
</c:forEach>
</ul>
 <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
 </div>
</div>
<div id="tablewrapper">
<table id="table1">
<tbody>
            <caption style="caption-side:top;">
      ${salebook.bookName }
      </caption>
        <tr>
          <td>저자</td>
        </tr>
        <tr>
          <td>출판사</td>
        </tr>
        <tr>
          <td>가격</td>
        </tr>
        <tr>
        <td>기타 사항</td>
        </tr>
</table>
<table id="table2">
<tbody>

        <tr>
          <td>${salebook.author }</td>
        </tr>
        <tr>
          <td>${salebook.publisher }</td>
        </tr>
        <tr>
          <td>${salebook.price } 원</td>
        </tr>
        <tr>
        <td><textarea id="etc" cols="40" rows="4" readonly>${salebook.etc }</textarea></td>
        </tr>
</table>
<input type="button" id="buy" name="buy" style="border-radius:6px;" value="바로구매">
<input type="button" id="cart" name="cart" style="border-radius:6px;" value="장바구니">
<form action="/bookstor/cart" id="actionForm"method="POST">

<input type="hidden" id="bno" name="bno" value="${salebook.bno }">

</form>
</div>

</div>

<div class="modal hidden">
  <div class="bg"></div>
  <div class="modalBox">
    <p>장바구니에 물품을 추가하시겠습니까?</p>
    <button class="yesBtn">확인</button>
     <button class="closeBtn">취소</button>
  </div>
</div>