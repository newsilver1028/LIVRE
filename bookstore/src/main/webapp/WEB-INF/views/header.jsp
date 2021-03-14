<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="icon" type="image/png"  href="/resources/imgs/bookicon.png"/>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="http://fonts.googleapis.com/css?family=Oxygen:400,700,300"
   rel="stylesheet" type="text/css" />
<link href="/resources/css/style.css" rel="stylesheet" type="text/css"
   media="screen" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/stylebuttoncss.css">
</head>
<body>
   <div id="wrapper">
      <div id="menu-wrapper">
         <div id="menu" class="container" style="">
            <ul>
               <li class="menu" style="float:left;"><a href="#">MENU</a>
               <ul class="menuinfo">
               <li>
               <a class="submenu3" href="소설">소설</a>
               <a class="submenu3" href="에세이">에세이</a>
               <a class="submenu3" href="만화">만화</a>
               <a class="submenu3" href="동화">동화</a>
               <a class="submenu3" href="잡지">잡지</a>
               <a class="submenu3" href="문제집">문제집</a>
               
               </li>
               </li></ul>
               
               <li class="mypage" style="float:right;" ><sec:authorize access="hasRole('ROLE_USER')">
                  <a href="/bookstore/MyPage">MY PAGE</a></sec:authorize>                  
               <ul class="myinfo">
               <li><a class="submenu" href="/bookstore/MyPage">내 정보</a>
               <a class="submenu"  href="/bookstore/OrderList">주문 내역</a>
               <a class="submenu"  href="/bookstore/Cart">장바구니</a></li>
               </ul>
               </li>
               <li class="adminpage" style="float:right;">
               <sec:authorize access="hasRole('ROLE_ADMIN')">
                  <a href="/bookstore/AdminPage">ADMIN PAGE</a></sec:authorize>
                  <ul class="admininfo">
                  <li><a class="submenu2" href="/bookstore/AdminRefund">교환 / 반품</a>
                  <a class="submenu2" href="/bookstore/AdminShipping">배송 관리</a>
                  <a class="submenu2" href="/bookstore/AdminReceive">수취 관리</a>
                  </li>
                  </ul>
                  </li>
               <li style="float:right; height:300px;"><sec:authorize access="isAuthenticated()">
            <form role="form" action="/logoutform"method="post" id="formform">
            <input type="hidden" name="${_csrf.parameterName }"
                  value="${_csrf.token }" />
               <fieldset>
                  <a href="index.html" id="logout">LOGOUT
                  </a>
               </fieldset>
            </form>
                  </sec:authorize> <sec:authorize access="isAnonymous()">
                     <a href="/loginform">
                      Login
                     </a>
                  </sec:authorize></li>
            </ul>
            
         </div>
         <form method="get" class="submenuForm">
         <input type="hidden" name="hiddenmenu"/>
         </form>
      </div>
      <div id="logo" class="container">
      <sec:authorize access="hasRole('ROLE_USER')"><a href="/bookstore/salebook"><button class="learn-more" style="width:120px;height:40px;">SALE BOOK</button></a>
         </sec:authorize>
         <h1>
            <a href="/bookstore/list">LIVRE</a>
         </h1>
         <h4><small>Wake Up Your USED BOOK!</small></h4>

      </div>
      <div id="page" class="container">
         <div>
            <div class="entry"></div>
         </div>
      </div>

		<script src="https://code.jquery.com/jquery-3.4.1.js"
			type="text/javascript"></script>
<script>
   $(document)
   .ready(
         function(e) {
   $("#logout").on("click", function(e) {
       e.preventDefault();
      $("#formform").submit();
   });
   $(".menuinfo .submenu3").on("click", function(e) {
       e.preventDefault();
       $("input[name='hiddenmenu']").val($(this).attr("href"));
       $(".submenuForm").attr("action", "/bookstore/submenulist");
       
      $(".submenuForm").submit();
   });});
</script>

		<c:if test="${param.logout != null }">
			<script>
      $(document).ready(function() {
         alert("로그아웃");
         
      });
   
   </script>
		</c:if>