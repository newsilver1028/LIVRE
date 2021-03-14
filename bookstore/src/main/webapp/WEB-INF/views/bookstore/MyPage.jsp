<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MY PAGE</title>
</head>
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
<link href="/resources/css/modal.css" rel="stylesheet" type="text/css" media="screen" />
<div class="myprofile" align="center" style="font-family: 'Nanum Gothic', sans-serif; color:#3C342E">
<h3 style="color: #3C342E !important; margin-top:-30px; margin-bottom:50px; font-family: 'Nanum Gothic', sans-serif;"><b>MY PROFILE</b></h3>
<table id="table4" style=" text-align:left; margin-left:-100;">
<tbody>
<tr>
<td><img src="/resources/imgs/person.png" width="300px" height="300px;"></td>
<td>
<table id="table4" style=" text-align:left; margin-left:200px;">
<tr>
 <td>이름  :</td>
          <td> ${logInfo.usernikname }</td>
        </tr>
        <tr>
         <td>아이디  : </td>
          <td> ${logInfo.userName }</td>
        </tr>
       <tr>
        <td>이메일  :</td>
         <td> ${logInfo.usermail }</td>
        </tr>
        <tr>
          <td>전화번호  :</td>
          <td> ${logInfo.userpn }</td>
        </tr>
        <tr>
        <td>주소  :</td>
          <td>${logInfo.useradd }</td>
        </tr>
</table>

</table>


<form role="form" class="form-signin" action="/bookstore/modifyinfo" method="GET">
<input type="hidden" name="userName" value="${logInfo.userName }">
<input type="button" id="modifyinfo" class="btn btn-lg btn-primary btn-block" 
style="width: 70px !important; margin-buttom:100px !important; margin-left:800px; border: none; font-size:0.9em;" value="수정">
<hr style="border-top: 1px dashed #3C342E; width:90%; border-bottom:none; margin-top:50px;margin-bottom:100px;" >
</form>
</div>   

<div align="center" id="listform" style="font-family: 'Nanum Gothic', sans-serif; color:#3C342E">     
<h3 style="color: #3C342E !important; margin-top:-30px; margin-bottom:50px; font-family: 'Nanum Gothic', sans-serif;"><b>MY POST</b></h3>

<table id="table5">
<tbody>
   <th>이미지</th>
   <th>책 이름</th>
   <th>가격</th>
   <th>상태</th>
   <th>날짜</th>
   <th>송장번호</th>
   <th></th>
   <c:forEach var="store" items="${bookInfo }">
      <tr>
      <td><img src="<c:url value="/img/${store.url }"/>" width="30" height="40" alt="" /></td>
      <td><c:out value="${store.bookName }"/></td>
      <td>
      <c:out value="${store.price } 원"/></td>
      <td><c:choose>
      <c:when test="${store.dataList=='수취 요청' }">
      <c:out value="LIVRE에서 확인하지 않았습니다"/>
      </c:when>
      <c:when test="${store.dataList =='수취 승인' }">
      <c:out value="LIVRE에서 요청을 받았습니다 "/>
      </c:when>
         <c:otherwise>
         <c:out value="${store.dataList }"/>
         </c:otherwise>
      </c:choose></td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${store.updateDate }"/></td>
      <td><c:out value="${store.shippingNumber}"/></td>
      <td><c:choose>
         <c:when test="${store.dataList =='수취 승인' }">
         <input type="button" id="${store.bno }" name="ship"class="btn btn-lg btn-primary btn-block"
         style="width:120px !important; border: none; font-size:0.9em;" value="송장 번호 입력"></c:when>
         <c:when test="${store.dataList =='수취 요청' }">
         <div id="snsubmitwrapper2">
         <button type="submit" id="${store.bno }" name="move" class="btn btn-lg btn-primary btn-block"  
         style="float:left; margin-right:20px; width:70px !important; border: none; font-size:0.9em;" >수정</button>
         <input type="button" class="btn btn-lg btn-primary btn-block" id="${store.bno }" name="move" 
         style="margin-right:50px; width:70px !important; border: none; font-size:0.9em;" value="삭제"></div>
         </c:when>
         <c:otherwise>
         </c:otherwise>
         </c:choose>
         </td>
      </tr>
        </c:forEach>
        </tbody>
</table>
<form id="actionForm" action="/bookstore/list" method="get">
      <input type="hidden" name="${_csrf.parameterName }"
            value="${_csrf.token}" >
  </form>
      <hr style="border-top: 1px dashed #3C342E; width:90%; border-bottom:none; margin-top:80px;margin-bottom:100px;" >
</div>



<div class="modal hidden" id="modal">
  <div class="bg" id="bgbg"></div>
  <div class="modalBox">
    <p>게시물을 삭제하시겠습니까?</p>
    <button class="yesBtn" id="yes">확인</button>
     <button class="closeBtn" id="closeclose">취소</button>
  </div>
</div>
<div class="modal hidden" id="modalmodal">
  <div class="bg" id="bg"></div>
  <div class="modalBox" style="height:180px !important;">
    <p>운송장 번호를 입력해주세요</p><form id="actionForm2">
    <div align="center">
    <input type="text" name="shippingNumber" style="width: 300px !important;"
    class="form-control"><br>
    <input type="hidden" name="bno"></div>
    </form>

    <button class="yesBtn" id="yesyes">확인</button>
     <button class="closeBtn" id="close">취소</button>
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$("input[name='move']").css("background-color","#3C342E");
$("input[name='move']").mouseover(function(){$(this).css("background-color","#746B65");})
$("input[name='move']").mouseleave(function(){$(this).css("background-color", "#3C342E");})
$("button[name='move']").css("background-color","#3C342E");
$("button[name='move']").mouseover(function(){$(this).css("background-color","#746B65");})
$("button[name='move']").mouseleave(function(){$(this).css("background-color", "#3C342E");})
$("input[name='ship']").css("background-color","#3C342E");
$("input[name='ship']").mouseover(function(){$(this).css("background-color","#746B65");})
$("input[name='ship']").mouseleave(function(){$(this).css("background-color", "#3C342E");})
  

  const close2 = () => {
     document.querySelector("#modalmodal").classList.add("hidden");
  }
  const close = () => {
     document.querySelector("#modal").classList.add("hidden");
  }
  $("input[name='ship']").on("click",function(e){
       $("#yesyes").attr("id",$(this).attr("id"));
       document.querySelector("#modalmodal").classList.remove("hidden");});
     document.querySelector("#yesyes").addEventListener("click", function(e) {

                    e.preventDefault();// 기존 링크 이동 차단.
                    $("input[name='bno']").val($(this).attr("id"));
                    var formData = $("#actionForm2").serialize();   
                    var csrfHeaderName ="${_csrf.headerName}";
                    var csrfTokenValue ="${_csrf.token}";
                    $(document).ajaxSend(function(e,xhr,options){
                       xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                       });
        $.ajax({
           type : "POST",
           url : "/bookstore/snsubmit",
           data : formData,
           success : function(result){
              alert("운송장 번호를 성공적으로 입력했습니다");
              location.reload();}
      });
      });
     document.querySelector("#close").addEventListener("click", close2);
     document.querySelector("#bg").addEventListener("click", close2);
         
   

 $("input[name='move']").on("click",function(e){
    $("#yes").attr("id",$(this).attr("id"));
    document.querySelector("#modal").classList.remove("hidden");});
  document.querySelector("#yes").addEventListener("click", function(e) {
    
     var csrfHeaderName ="${_csrf.headerName}";
      var csrfTokenValue ="${_csrf.token}";
      $(document).ajaxSend(function(e,xhr,options){
         xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         });
   
   

      var bno = $(this).attr("id");
      var data = {bno : bno}   
      $.ajax({
         type : "POST",
         url : "/bookstore/mypagedelete",
         data : data,
         success : function(result){
            if(result != 'fail'){
               document.querySelector("#modal").classList.add("hidden");
               
               alert("게시물이 성공적으로 삭제되었습니다");
               location.reload();
               return;   
               
            } else {
               document.querySelector("#modal").classList.add("hidden");
               alert("이미 삭제된 게시물입니다.");
      
               return;   
            }
            }
});});
  document.querySelector("#closeclose").addEventListener("click", close);
  document.querySelector("#bgbg").addEventListener("click", close);

</script>

<script>

$(document).ready(function(e){
   $("#modifyinfo").css("background-color","#3C342E");
   
   
    $("#modifyinfo").on(
            "click",
            function(e) {
               e.preventDefault();        
               $(".form-signin").attr("action", "/bookstore/modifyinfo");
              
               $(".form-signin").submit();
            });// end_move_onClick
            
            $("button[type='submit']").on(
                    "click",
                    function(e) {
                       e.preventDefault();
                       
                       $("#actionForm").append("<input type='hidden' name='bno' "
                               + "value='" + $(this).attr("id")
                               + "'>");
                      
                              
                       $("#actionForm").attr("action", "/bookstore/modify");
                      
                       $("#actionForm").submit();
                    });// end_move_onClick

  
})
</script>
</html>