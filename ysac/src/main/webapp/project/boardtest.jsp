<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
     <c:set var="ctxPath" value="${pageContext.request.contextPath}" />
     <c:set var="ctxPath2" value="<%=request.getContextPath() %>" />
     
     
     
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
        crossorigin="anonymous"></script>
    
    </head>
<body>

		<jsp:include page="../nav/nav.jsp"/>   

    <div class="main">
        <div class="container ">
            <div class="w-75 m-auto border rounded-top-4 mt-5 text-primary ">
                <h3 class="text-center mt-3 mb-3"><i>게시판 상세 글 </i> </h3>
            </div>
             <c:choose>
				<c:when test="${not empty loginInfo.id }">
				${loginInfo.id}님 로그인중
				</c:when>
            
            </c:choose>
            
            <div class="w-75 m-auto border border-1 rounded rounded-bottom-4 p-3">
                <div class="mb-3 row">
                    <label for="no" class="col-sm-2 col-form-label">글번호</label>
                    <div class="col-sm-10">
                      <input type="text" value="${boardfind.m_board}" name="articleNO" readonly  class="form-control border border-primary-subtle rounded rounded-4 p-2" id="articleNO" >
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="id" class="col-sm-2 col-form-label">글 작성자 ID</label>
                    <div class="col-sm-10">
                      <input type="text" value="${boardfind.id}" readonly name="id" class="form-control border border-primary-subtle rounded rounded-4 p-2" id="id">
                    </div>
                  </div>
                  
                  <div class="mb-3 row">
                  <c:if test="${not empty boardfind.img_name && boardfind.img_name!=null }">
                  
                    <label for="imageFileName" class="col-sm-2 col-form-label">이미지</label>
                   	<div class="col-sm-10">
                   		<%-- <img alt="" width="450" src="${ctxPath}/download.do?imageFileName=${dto.imageFileName}&articleNo=${dto.articleNO}">이미지${dto.imageFileName} --%>
                   		<img class="w-75"  " alt="" src="${ctxPath}/boardImg.do?img_name=${boardfind.img_name}&m_board=${boardfind.m_board	}">
                   	</div>
                   
                    <div class="col-sm-10">
                      <input type="hidden" id="preview" value="${boardfind.img_name}" readonly name="img_name" class="form-control border border-primary-subtle rounded rounded-4 p-2" id="img_name" disabled>
                    </div>
                  </c:if>
                  </div>
                  
                  
                  
                  
                  <div class="mb-3 row">
                    <label for="title" class="col-sm-2 col-form-label">글 제목</label>
                    <div class="col-sm-10">
                      <input type="text" value="${boardfind.title}" readonly name="title" class="form-control border border-primary-subtle rounded rounded-4 p-2" id="title">
                    </div>
                  </div>
                  
                  <div class="mb-3 row">
                    <label for="content" class="col-sm-2 col-form-label">글 내용</label>
                    <div class="col-sm-10">
                      <!-- <input type="text" class="form-control" id="inputPassword"> -->
                      <textarea name="content" value="${boardfind.content}" readonly id="content" cols="50" rows="10" class="form-control border border-primary-subtle rounded rounded-4 p-2">${dto.content}</textarea>
                    </div>
                  </div>
                  
                 
                  
                 
                  
                  <div class="mb-3 row">
                    <label for="writeDate" class="col-sm-2 col-form-label">등록 일자</label>
                    <div class="col-sm-10">
                      <input type="text"  value="${boardfind.writedate}" name="writeDate" readonly class="form-control border border-primary-subtle rounded rounded-4 p-2" id="writeDate">
                    </div>
                    
                  </div>
            
                <div class="d-flex justify-content-between ">
                   
                    <div class="row">
                        
                      <div>
                            
                            <button class="btn btn-outline-primary" onclick="List()">목록</button>
                           
                            
                       <!--   <c:choose>
                         	<c:when test="${loginID == dto.id }"> 
                          	<button class="btn btn-outline-primary" onclick="modify()">수정</button>
                            <button class="btn btn-outline-primary" onclick="delete2()">삭제</button>
                          	작성자아이디와 로그인아이디  일치
                         	
                         	</c:when>
                         	<c:otherwise>
                         	<button class="btn btn-outline-primary" disabled onclick="modify()">수정</button>
                            <button class="btn btn-outline-primary" disabled onclick="delete2()">삭제</button>
                         	작성자아이디와 로그인아이디  불일치
                         	
                         	</c:otherwise>
                         	
                         </c:choose>
                            -->
                         <!--    
                            <button class="btn btn-outline-primary" onclick="modify()">수정</button>
                            <button class="btn btn-outline-primary" onclick="delete2()">삭제</button>
                             -->
                       </div>
                         
                    </div> 
                    <div class="">
                    <a  href="${ctxPath}/orcle/reply.do?parentNO=${dto.articleNO}" class="btn btn-outline-primary">답글</a>
                    </div>

                </div>

            </div>


        </div>

    </div>

		<!-- Modal -->
		<div class="modal fade" id="delModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="delOK">확인</button>
		      </div>
		    </div>
		  </div>
		</div>

</body>
<script type="text/javascript">
function delete2(){
	
	var isOK = confirm('삭제하시겠습니까?')
	if(isOK){
		location.href="${ctxPath}/orcle/deleteboard.do?articleNO=${dto.articleNO}";
	}else{
		return;
	}
}
function List() {
	
	location.href="${ctxPath}/orcle/boardList.do"
	
}

function modify() {
	
	location.href="${ctxPath}/orcle/modifyboard.do?articleNO=${dto.articleNO}"
		
}
function deleteboard() {
	
	
	location.href="${ctxPath}/orcle/deleteboard.do?articleNO=${dto.articleNO}"
}




//제이쿼리를 이용하여 파일 첨부시 미리보기 기능 구현 
function readURL(imageFileName){
    if(imageFileName.files && imageFileName.files[0]){
        // 파일 입출력 처리하는 객체 생성 
        var reader = new FileReader();
        // .onload : 입력이 정상적으로 완료되면 처리하는 
        reader.onload = function(e){
          //  var str = imageFileName.value;	
         //   var idx = str.lastindexOf('\\')
          //  var name = str.substring(idx+1)
            
            $('#preview').attr('src',e.target.result)
          /*   $('#previewName').text(imageFileName.value) */

        }
        reader.readAsDataURL(imageFileName.files[0]);
        
    }

    
}


</script>




</html>