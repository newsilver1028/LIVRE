<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MODIFY BOOK INFORMATION</title>
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="../header.jsp"%>


<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">





<div align="center" style="font-family: 'Nanum Gothic', sans-serif;">

   <div class="card-title">
      <h4 class="card-title text-center" style="color:">수정하실 책의 정보를 입력해주세요</h4>
   </div>
   <div class="card-body">
      <form role="form" class="form-signin" action="/bookstore/updatebook"
         method="POST">
         <input type="hidden" name="${_csrf.parameterName }"
            value="${_csrf.token}" />
             <input type="text" class="form-control"
            name="bookName" placeholder="책 제목" style="width: 500px !important;"
            required autofocus maxlength="33" value="${salebook.bookName }"><BR> <input type="text"
            style="width: 500px !important;" name="author" class="form-control"
            placeholder="글쓴이" maxlength="33" value="${salebook.author }" required autofocus><BR>
             <input
            type="text"  value="${salebook.publisher}" style="width: 500px !important;" name="publisher"
            class="form-control" placeholder="출판사" maxlength="33" required autofocus><BR>

         <input type="number" value="${salebook.price }" class="form-control" name="price"
            placeholder="판매 가격" step="1000"
            style="width: 500px !important; margin-bottom: 20px !important;">
         <input type="hidden" value="${salebook.bno }"name="bno">
			<div class="yes">
            <label><input type="checkbox" class="checks" name="genre1" value="소설" onclick="oneCheckbox(this)" >소설</label>
            <label><input type="checkbox" class="checks" name="genre2" value="에세이" onclick="oneCheckbox(this)">에세이</label>
            <label><input type="checkbox" class="checks" name="genre3" value="만화" onclick="oneCheckbox(this)">만화</label>
            <label><input type="checkbox" class="checks" name="genre4" value="동화" onclick="oneCheckbox(this)">동화</label>
            <label><input type="checkbox" class="checks" name="genre5" value="잡지" onclick="oneCheckbox(this)">잡지</label>
            <label><input type="checkbox" class="checks" name="genre6" value="문제집" onclick="oneCheckbox(this)">문제집</label>
            <input type="hidden" name="genre" value="${salebook.genre }">
            </div>
         <p>
            표지 사진 <small>(직접 찍은 사진 첨부)</small>
         </p>
         <input type="file" name="uploadFile" multiple>
         <div class="uploadResult" style="display:inline !important;">
            <ul style="list-style:none !important;"></ul>
         </div>
         <textarea style="width: 500px !important;"
            name="etc" class="form-control" placeholder="기타 사항" rows="3" maxlength="130">${salebook.etc }</textarea>
         <BR> <input type="hidden" name="writer"  value="${salebook.writer}">
         <button id="backlist"
            style="width: 250px !important; background-color: #3C342E !important; border: none"
            class="btn btn-lg btn-primary btn-block" onclick="history.back()">돌아가기</button>
         <button id="btn-Yes"
            style="width: 250px !important; background-color: #3C342E !important; border: none"
            class="btn btn-lg btn-primary btn-block"
             data-oper='modify' type="submit">수정하기</button>

      </form>

   </div>
</div>

<div class="modal"></div>


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
<script type="text/javascript">

    function oneCheckbox(a){

        var obj = $(".yes .checks");

        for(var i=0; i<obj.length; i++){

            if(obj[i] != a){

                obj[i].checked = false;

            }

        }

    }

</script>

<script>
$("#btn-Yes").mouseover(function(){$(this).css("background-color","#746B65");})
$("#btn-Yes").mouseleave(function(){$(this).css("background-color", "#3C342E");})
$("#backlist").mouseover(function(){$(this).css("background-color","#746B65");})
$("#backlist").mouseleave(function(){$(this).css("background-color", "#3C342E");})
   $(document)
         .ready(
               function(e) {
                  if($("input[name='genre']").val()=="소설"){
                       $("input[name='genre1']").prop("checked",true);
                       }
                   if($("input[name='genre']").val()=="에세이"){
                      $("input[name='genre2']").prop("checked",true);
                       }
                   if($("input[name='genre']").val()=="만화"){
                      $("input[name='genre3']").prop("checked",true);
                       }
                   if($("input[name='genre']").val()=="동화"){
                      $("input[name='genre4']").prop("checked",true);
                       }
                   if($("input[name='genre']").val()=="잡지"){
                      $("input[name='genre5']").prop("checked",true);
                       }
                   if($("input[name='genre']").val()=="문제집"){
                      $("input[name='genre6']").prop("checked",true);
                       }
                  var csrfHeaderName ="${_csrf.headerName}";
                  var csrfTokenValue ="${_csrf.token}";
                  $(document).ajaxSend(function(e,xhr,options){
                     xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                     });
                  var formObj = $("form");								/* 문서중 form 요소를 찾아서 변수에 할당. */
                  $('button').on("click", function(e) {
                     													/* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를 전달하면서 */
                     e.preventDefault();								/* 기본 이벤트 동작 막기. */
                     var operation = $(this).data("oper");
                     console.log(operation);
                        if($("input[name='bookName']").val().length < 1) {
                              alert('책이름을 입력해주세요.');
                              
                              $("input[name='bookName']").focus();
                              return;}
                           else if($("input[name='author']").val().length < 1) {
                                 alert('글쓴이를 입력해주세요.');
                                 
                                 $("input[name='author']").focus();
                                 return;}
                           else if($("input[name='publisher']").val().length < 1) {
                                    alert('출판사를 입력해주세요.');
                                    $("input[name='publisher']").focus();
                                    return;}
                          
                           else if($("input[name='price']").val().length < 1) {
                                 alert('가격을 입력해주세요.');
                                 
                                 $("input[name='price']").focus();
                                 return;}
                           else if   ($(".yes input[type='checkbox']:checked").val()==null) {
                                 alert('장르를 선택해주세요.');
                                 $("input[name='genre']").focus();
                                 return;}
                        $("input[name='genre']").val($(".yes input[type='checkbox']:checked").val());
                        $("form").submit();
                      
                          
                     if (operation === 'remove') {
                        formObj.attr("action", "/bookstore/remove");	/* form에 액션 속성을 변경. */
                     } else if (operation === 'list') {
                        formObj.attr("action","/bookstore/list")
                        .attr("method","get");
                        
                        var pageNumTag=$("input[name='pageNum']");
                        var amountTag=$("input[name='amount']");
                        var keywordTag=$("input[name='keyword']");
                        var typeTag=$("input[name='type']");
                        
                        formObj.empty();
                        formObj.append(pageNumTag);
                        formObj.append(amountTag);         
                        formObj.append(keywordTag);
                        formObj.append(typeTag);   
                     }
                     else if(operation === 'modify'){
                        var str="";
                        $(".uploadResult ul li").each(function(i,obj){
                           var jobj=$(obj);
                           console.dir(jobj);
                           console.log("-----------------");
                           console.log(jobj.data("filename"));
                           
                           str+="<input type='hidden' name='photoList[";
                           str+=i+"].fileName' value='"+jobj.data("filename")
                           str+="'>";
                           
                           str+="<input type='hidden' name='photoList[";
                           str+=i+"].uuid' value='"+jobj.data("uuid")
                           str+="'>";
                           
                           str+="<input type='hidden' name='photoList[";
                           str+=i+"].uploadPath' value='"+jobj.data("path")
                           str+="'>";
                           
                           str+="<input type='hidden' name='photoList[";
                           str+=i+"].fileType' value='"+ Boolean(!jobj
                                 .data("type"));
                           str+="'>";
                        });
                        formObj.append(str);
                     }
                     
                     formObj.submit();									/* 위의 조건이 아니라면 수정 처리. */
                  }); // end_submit_button


                  /* 첨부파일 목록, 삭제, 추가. */
                  (function(){
                     var bno='<c:out value="${salebook.bno}"/>'; 		/* 화면상에 공유된 bno 값 가져와 사용 준비.*/
                     $.getJSON("/bookstore/getAttachList"
                           ,{bno:bno}, function(arr){
                              console.log(arr);
                              
                              var str="";
                              $(arr).each(function(i,attach){
                                 var fileCallPath
                                 = encodeURIComponent(attach.uploadPath
                                       +"/"+attach.uuid+"_"+attach.fileName);
                                 
                                 str+="<li data-path='";
                                 str+=attach.uploadPath+"' data-uuid='";
                                 str+=attach.uuid+"' data-filename='";
                                 str+=attach.fileName+"' data-type='";
                                 str+=attach.fileType+"'><div>";
                                 str+="<img src='/resources/imgs/attach.png'>";
                                 str+="<span>"+attach.fileName+"</span>&nbsp;&nbsp;";
                                 str+="<b data-file='"+fileCallPath;
                                 str+="' data-type='file'>[x]</b>";
                                 
                                 str+="</div></li>";
                              });
                              $(".uploadResult ul").html(str);
                           });
                  })();
                  // 첨부파일 목록 표시 스크립트
                  
                  
                  /* 첨부파일의 x 버튼을 눌렀을때 처리 스크립트 */
                  $(".uploadResult").on("click","b",function(e){
                     console.log("delete file");
                     
                     var targetFile=$(this).data("file");
                     var type=$(this).data("type");
                     var targetLi=$(this).closest("li");
                     
                     $.ajax({
                        url : '/deleteFile',
                        data : {
                           fileName : targetFile,
                           type : type
                        },
                     
                        dataType : 'text',
                        type : 'POST',
                        success : function(result){
                           alert(result);
                           targetLi.remove();
                        }
                     })
                  });
                  // 첨부파일의 x 버튼을 눌렀을때 처리 스크립트
                  
                  /* 첨부파일 등록과 표시 시작 */  
                  var regex = new RegExp(
                        "(.*?)\.(jpg|png|gif|psd|svg|JPG|PNG|GIF|PSD|SVG|JPEG|jpeg)");

                  var maxSize = 5242880;

                  function checkExtension(fileName, fileSize) {
                     if (fileSize >= maxSize) {
                        alert("파일 크기 초과");
                        return false;
                     }
                     if (regex.test(fileName)) {
                        return true;
                     } else {
                        alert("jpg, png, gif, psd, svg파일만 업로드할 수 있습니다");
                        return false;
                     }
                     return true;
                  }
                  
                  $("input[type='file']").change(function(e){
                     var formData = new FormData();
                     var inputFile=$("input[name='uploadFile']");
                     var files=inputFile[0].files;
                     for(var i=0;i<files.length;i++){
                        if(!checkExtension(files[i].name
                              ,files[i].size)){
                           return false;
                        }
                        formData.append("uploadFile",files[i]);
                     }
                     
                     $.ajax({
                        url:'/uploadAjaxAction',
                        processData:false,
                        contentType:false,
                        data:formData,
                        
                        type:'POST',
                        dataType:'json',
                        success:function(result){
                           console.log(result);
                           showUploadResult(result);
                           /* 첨부파일 업로드 결과를 json으로 받으면,
                            * 그 내용을 화면에 표시.
                            */
                         
                        }
                     });// end_ajax
                  });// end_change
                  
                  function showUploadResult(uploadResultArr){
                     if(!uploadResultArr 
                           || uploadResultArr.length==0){ 					/*json 처리 결과가 없다면 함수 종료. */
                        return;
                     }
                     var uploadUL=$(".uploadResult ul");
                     var str="";

                     $(uploadResultArr).each(function(i,obj){
                        var fileCallPath
                        = encodeURIComponent(obj.uploadPath
                              +"/"+obj.uuid+"_"+obj.fileName);

                        var fileLink
                        =fileCallPath.replace(new RegExp(/\\/g),"/");
                        
                        str+="<li data-path='";
                        str+=obj.uploadPath+"' data-uuid='";
                        str+=obj.uuid+"' data-filename='";
                        str+=obj.fileName+"' data-type='";
                        str+=obj.image+"'><div>";
                        str+="<img src='/resources/imgs/attach.png'>";
                        str+="<span>"+obj.fileName+"</span> ";
                        str+="<b data-file='"+fileCallPath;
                        str+="' data-type='file'>[x]</b>";
                        str+="</div></li>";
                     });
                     uploadUL.append(str);
                  }// end_showUploadResult
                  // 첨부파일 서버 공간에 등록 및 목록 갱신
                  
                  // 수정 버튼을 눌렀을때 첨부파일 정보 숨김값으로 폼 전송 처리.
                     

                 
               });
</script>