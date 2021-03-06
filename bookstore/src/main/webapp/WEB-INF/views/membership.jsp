<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>LIVRE MEMBERSHIP</title>
<meta charset="utf-8">
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ include file="./header.jsp"%>


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



<div align="center">

   <div style="width: 100%; background: #F1F2E9 !important;">
      <div class="card-title" style="margin-top: -30px;">
         <h2 class="card-title text-center" style="color: #3C342E !important;">LIVRE
            MEMBERSHIP</h2>
      </div>
      <div class="card-body" style="padding-bottom: 110px;">

         <form class="form-signin" role="form" action="/membership"
            method="POST">
               <input type="hidden" name="${_csrf.parameterName }"
      value="${_csrf.token}" /> <input type="hidden" name="usermail" />
      <input type="hidden" name="useradd"/>
            <div>
               <label><pre style="font-family: 'Nanum Gothic', sans-serif;">        이름 : <input type="text" id="name"
                        name="usernikname"
                        style="width: 300px !important; margin: 100 !important; display: inline !important;"
                        class="form-control" required autofocus>           </pre></label><br>
               <label><pre style="font-family: 'Nanum Gothic', sans-serif;">    생년월일 : <input type="date"
                        name="birth"
                        style="width: 300px !important; margin: 100 !important; display: inline !important;"
                        class="form-control" required autofocus>            </pre></label><br>
               <label><pre style="font-family: 'Nanum Gothic', sans-serif;">    전화번호 : <input type="tel"
                        name="userpn" placeholder="010-0000-0000"
                        pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"
                        style="width: 300px !important; margin: 100 !important; display: inline !important;"
                        class="form-control" required autofocus>           </pre></label><br>
               <label><pre style="font-family: 'Nanum Gothic', sans-serif;">                 이메일 : <input type="text"
                        id="email1"
                        style="width: 200px !important; margin: 100 !important; display: inline !important;"
                        class="form-control" required autofocus maxlength="20">  @  <input
                        list="questions" id="email2" placeholder="직접 입력"
                        style="width: 150px !important; display: inline !important;"
                        class="form-control" required autofocus>
                  </pre> <datalist id="questions">
                     <option value="naver.com" />
                     <option value="nate.com" />
                     <option value="daum.net" />
                     <option value="gmail.com" />
                     <option value="zum.com" />
                  </datalist> </label><br> 
                  <label> <span 
                  class="id_input_re_1" style="color:#3C342E; font-size:0.7em;display:none; font-family: 'Nanum Gothic', sans-serif;" >사용 가능한 아이디입니다.</span> <span
                  class="id_input_re_2" style="color:red; fone-size:0.7em;display:none; font-family: 'Nanum Gothic', sans-serif;">아이디가 이미 존재합니다.</span>
                  <br>
                  <pre style="font-family: 'Nanum Gothic', sans-serif;">  아이디 : <input type="text"
                        name="userName" id="id_input"
                        style="width: 300px !important; display: inline !important;"
                        class="form-control" required autofocus maxlength="15">     </pre></label>
                        <br> <label><pre style="font-family: 'Nanum Gothic', sans-serif;">      비밀번호 : <input
                        type="password" id="upw" name="userpw1"
                        style="width: 300px !important; display: inline !important;"
                        class="form-control" required maxlength="33">           </pre></label><br> 
                        <label><pre style="font-family: 'Nanum Gothic', sans-serif;">비밀번호 확인 : <input
                        type="password" id="upw" name="userpw"
                        style="width: 300px !important; display: inline !important;"
                        class="form-control" required>             </pre></label> <br> 
                        <label><pre style="font-family: 'Nanum Gothic', sans-serif;">                         주소 : <input
                        type="text" id="address2" name="useradd2"
                        style="width: 300px !important; margin: 100 !important; display: inline !important;"
                        class="form-control" required autofocus>  <input type="button" onclick="sample6_execDaumPostcode()" 
                           class="btn btn-lg btn-primary btn-block" id="findadd"
                              style="display:inline-block !important; margin:0px !important; width: 80px !important; border: none; font-size:0.8em !important; font-family: 'Nanum Gothic', sans-serif;"
                        value="주소 찾기"></pre></label><br>
                        <pre>     <input type="text" id="sample6_detailAddress" name="detailadd"
                        style="width: 300px !important; display: inline !important;"
                        class="form-control" required autofocus placeholder="상세주소"></pre>
         
            </div>
            <pre style="font-family: 'Nanum Gothic', sans-serif;">          <select  name="pwfind" style="height:37px" required>
               <option value="나의 취미는?">나의 취미는?</option>
               <option value="가장 여행가고 싶은 나라는?">가장 여행가고 싶은 나라는?</option>
               <option value="가장 좋아하는 색깔은?">가장 좋아하는 색깔은?</option>
               <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
               <option value="학창시절 가장 좋아하는 선생님은?">학창시절 가장 좋아하는 선생님은?</option>
            </select>  답변 : <input
                  type="text" name="answer"
                  style="width: 100px !important; display: inline !important;"
                  class="form-control" required maxlength="13">      </pre>
            <br>
            <button type="submit" id="btn-Yes" class="btn btn-lg btn-primary btn-block"
      style="width: 300px !important; border: none; font-family: 'Nanum Gothic', sans-serif;"
      >회 원 가 입</button>
      

   </form>
      </div>
   </div>
   

</div>

<div class="modal"></div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
   integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
   integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
   crossorigin="anonymous"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
   integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
   crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$("#findadd").css("background-color","#3C342E");
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address2").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>

   $("#btn-Yes").mouseover(function() {
      $(this).css("background-color", "#746B65");
   })
   $("#btn-Yes").mouseleave(function() {
      $(this).css("background-color", "#3C342E");
   })
   $(document).ready(
         function(e) {
            var csrfHeaderName ="${_csrf.headerName}";
            var csrfTokenValue ="${_csrf.token}";
            $(document).ajaxSend(function(e,xhr,options){
               xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
               });
            $('#id_input').on("propertychange change keyup paste input",
                  function() {
               
               var memberId = $('#id_input').val();         // .id_input에 입력되는 값
               var data = {memberId : memberId}            // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
               if(memberId==null){
                  $('.id_input_re_1').css("display","none");
                  $('.id_input_re_2').css("display", "none");   
                  }
               $.ajax({
                  type : "POST",
                  url : "/memberIdck",
                  
                  
                  data : data,
                  
                  success : function(result){
                     if(result != 'fail'){
                        $('.id_input_re_1').css("display","inline-block");
                        $('.id_input_re_2').css("display", "none");            
                     } else {
                        $('.id_input_re_2').css("display","inline-block");
                        $('.id_input_re_1').css("display", "none");            
                     }
                     
                  }// success 종료
               }); // ajax 종료   
               });
            
            $("#fff").on("click", function(e) {
               console.log($("input[type=date]").val());
            });
            $("#btn-Yes").css("background-color", "#3C342E");
            $("button[type='submit']").on(
                  "click",
                  function(e) {
                     e.preventDefault();
                        if($("input[name='usernikname']").val().length < 1) {
                              alert('이름을 입력해주세요.');
                              
                              $("input[name='usernikname']").focus();
                              return;}
                           else if($("input[name='birth']").val().length < 1) {
                                 alert('생년월일을 입력해주세요.');
                                 
                                 $("input[name='birth']").focus();
                                 return;}
                           else if($("input[name='userpn']").val().length < 1) {
                                    alert('전화번호를 입력해주세요.');
                                    $("input[name='userpn']").focus();
                                    return;}
                           else if ($("#email1").val()==null) {
                                       alert('이메일을 입력해주세요.');
                                       $("#email1").focus();
                                       return;}
                           else if($("#email2").val().length < 1) {
                                 alert('이메일를 입력해주세요.');
                                 
                                 $("#email2").focus();
                                 return;}
                           else if($("select[name='pwfind']").val().length < 1) {
                                 alert('질문을 선택해주세요.');
                                 
                                 $("input[name='pwfind']").focus();
                                 return;}
                           else if($("input[name='userName']").val().length < 1) {
                                 alert('아이디를 입력해주세요.');
                                 
                                 $("input[name='userName']").focus();
                                 return;}
                           else if($("input[name='userpw1']").val().length < 1) {
                                 alert('비밀번호를 입력해주세요.');
                                 
                                 $("input[name='userpw1']").focus();
                                 return;}
                           else if($("input[name='answer']").val().length < 1) {
                                 alert('비밀번호를 입력해주세요.');
                                 
                                 $("input[name='answer']").focus();
                                 return;}
                           else if($("input[name='userpw']").val().length < 1) {
                                 alert('비밀번호 확인을 입력해주세요.');
                                 
                                 $("input[name='userpw']").focus();
                                 return;}
                           else if($("input[name='useradd2']").val().length < 1) {
                                 alert('주소를 입력해주세요.');
                                 
                                 $("input[name='useradd2']").focus();
                                 return;}
                           else if($("input[name='detailadd']").val().length < 1) {
                                 alert('상세주소를 입력해주세요.');
                                 
                                 $("input[name='detailadd']").focus();
                                 return;}

                           
                     $("input[name=usermail]").val(
                           $("#email1").val() + "@"
                                 + $("#email2").val());

                     $("input[name=useradd]").val(
                           $("#address2").val() + 
                           " " + $("#sample6_detailAddress").val());
                     
                     console.log($("usermail").val());
                     if($("input[name=userpw]").val()!=$("input[name=userpw1]").val()){
                        alert("비밀번호를 확인하세요");
                        return false;}
                     if($('.id_input_re_2').css("display")==("inline-block")){
                        alert("아이디를 확인하세요");
                        return false;
                        }
                     $("form").submit();
                  });
         });
</script>
</body>
</html>