<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ADMIN PAGE</title>
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
   

<div style="overflow:auto; height:1000px;">
<div align="center" id="divdiv">
<h3 style="color: #3C342E !important; margin-top:30px; margin-bottom:30px; font-family: 'Nanum Gothic', sans-serif;"><b>ALL POST LIST</b></h3>

<form id="actionForm" action="/bookstore/list" method="get">
<table id="table5" >
<tbody>
   <th>게시판</th>
   <th>이미지</th>
   <th>주문번호</th>
   <th>책 이름</th>
   <th>판매자</th>
   <th>상태</th>
   <th>날짜</th>
   <th></th><th></th>
    <c:forEach var="store" items="${adminList}">
      <tr>
      <td><c:if test="${store.tf==0 }"><pre></pre></c:if>
      <c:if test="${store.tf==1 }"><pre>√</pre></c:if>
      </td>
      <td><img src="<c:url value="/img/${store.url }"/> "width="30px" height="40px" alt="" /></td>
      <td><c:out value="${store.bno}"/></td>
      <td><a href="${store.bno}" class="movemove" id="${store.url }"><c:out value="${store.bookName }"/></a></td>
      <td><c:out value="${store.writer }"/></td>
      <td><c:out value="${store.dataList }"></c:out></td>      
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${store.updateDate }"/></td>   
         <td><button type="submit" id="${store.bno }" name="move" class="btn btn-lg btn-primary btn-block"  
         style="width:70px !important; border: none; font-size:0.9em;" >수정</button></td>
         <td><input type="button" class="btn btn-lg btn-primary btn-block" id="${store.writer }" name="move" 
         style="width: 70px !important; border: none; font-size:0.9em;" value="삭제"></td>   
         </tr>
         </c:forEach>
        </tbody>
</table>
</form>

<hr style="border-top: 1px dashed #3C342E; width:90%; border-bottom:none; margin-top:50px;margin-bottom:50px;" >
</div>     
 </div> 
  
  
      <form id="actionForm" action="/bookstore/list" method="get">
      <input type="hidden" name="${_csrf.parameterName }"
            value="${_csrf.token}" />
      </form>
      
      
 


<div class="modal hidden">
  <div class="bg"></div>
  <div class="modalBox">
    <p>게시물을 삭제하시겠습니까?</p>
    <button class="yesBtn">확인</button>
     <button class="closeBtn">취소</button>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$("input[name='move']").css("background-color","#3C342E");
$("input[name='move']").mouseover(function(){$(this).css("background-color","#746B65");})
$("input[name='move']").mouseleave(function(){$(this).css("background-color", "#3C342E");})
$(".movemove").css("color","#3C342E");
$(".movemove").mouseover(function(){$(this).css("color","#746B65");})
$(".movemove").mouseleave(function(){$(this).css("color", "#3C342E");})
$("button[name='move']").css("background-color","#3C342E");
$("button[name='move']").mouseover(function(){$(this).css("background-color","#746B65");})
$("button[name='move']").mouseleave(function(){$(this).css("background-color", "#3C342E");})
  const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  }

  const close = () => {
     document.querySelector(".modal").classList.add("hidden");
  }


 $("input[type='button']").on("click",open);
  document.querySelector(".yesBtn").addEventListener("click", function(e) {
    
     var csrfHeaderName ="${_csrf.headerName}";
      var csrfTokenValue ="${_csrf.token}";
      $(document).ajaxSend(function(e,xhr,options){
         xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
         });
   
   

      var bno = $("input[name='bno']").val();
      var data = {bno : bno}   
      $.ajax({
         type : "POST",
         url : "/bookstore/mypagedelete",
         data : data,
         success : function(result){
            if(result != 'fail'){
               document.querySelector(".modal").classList.add("hidden");
               
               alert("게시물이 성공적으로 삭제되었습니다");
               location.reload();
               return;   
               
            } else {
               document.querySelector(".modal").classList.add("hidden");
               alert("이미 삭제된 게시물입니다.");
      
               return;   
            }
            }
});},close);
  document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);

</script>

<script>

$(document).ready(function(e){   
            $("button[type='submit']").on(
                    "click",
                    function(e) {
                       e.preventDefault();
                       $("#actionForm").append("<input type='hidden' name='bno' "
                               + "value='" + $(this).attr("id")
                               + "'>");
                            
                       $("#actionForm").attr("action", "/bookstore/Adminmodify"); 			/*목록으로 이동 처리를  get 이동으로 변경.*/
                       $("#actionForm").submit();											/* 폼 전송.*/
                    });// end_move_onClick
                    $(".movemove").on(
                            "click",
                            function(e) {
                               e.preventDefault();
                               $("#actionForm")
                                     .append("<input type='hidden' name='bno' "
                                           + "value='" + $(this).attr("href")
                                           + "'>"
                                           +"<input type='hidden' name='url' "
                                           + "value='" + $(this).attr("id")
                                           + "'>");
                               /* 제목 링크에 걸린 bno 값을 가져와서,
                                * form 에 hidden 값으로 추가.
                                */
                                
                               $("#actionForm").attr("action", "/bookstore/get");		/* 목록으로 이동 처리를  get 이동으로 변경. */
                               $("#actionForm").submit();// 폼 전송.
                            });// end_move_onClick

  
})
</script>
</html>