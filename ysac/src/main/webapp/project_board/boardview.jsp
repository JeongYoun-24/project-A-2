<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>공지사항 상세 페이지</title>
          
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
          <!--부트 아이콘 -->
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            div{
                font-family: 'Noto Sans KR', sans-serif;
            }
            ul, ol, li { list-style: none; }
    
            a {
                text-decoration: none;
                color: #111;
            }
           
        </style>
        <body>

<header>
       <jsp:include page="../nav/nav.jsp"/>   
     
       
</header>
   
        <main>
      <!--제목부분-->
      
        <div class="container">
               <div class="row">
                   <div class="col-4 mt-5 d-flex justify-content-start">
                 <span>NOTICE</span>
                    </div>
             
                    <div class="col-4 mt-5 p-2 d-flex justify-content-between">
                        
                            <span><a href="#">NOTICE</a></span>
                            <span><a href="#">QNA</a></span>
                            <span><a href="#">FAQ</a></span>
                            <span><a href="#">MEMBERSHIP</a></span> 
                    </div>
              
                <div class="col-4 mt-5">
                     <div class="d-flex justify-content-end">
                        <i class="bi bi-house-heart"></i>
                        <i class="bi bi-arrow-right-short"> </i>
                        <span>NOTICE</span>
                          </div>
                 </div>
                      
                      
               </div> 
           </div>
                 
                    <!--게시판 내용부분-->
               <div class="container m-auto">
                  <table class="table table-bordered">
                    <thead>
                     	<tr> 
                          <th scope="col" width="10%">공지 번호</th>
                          <th scope="col"  width="70%">${boardfind.m_board}</th>
                        </tr>
                        <tr> 
                          <th scope="col" width="10%">제목</th>
                          <th scope="col"  width="70%">${boardfind.title}</th>
                        </tr>
                        
                        <tr>
                          <th scope="col" width="10%">작성자</th>
                          <th scope="col"  width="70%">${boardfind.name}</th>
                        </tr>
                        </thead>
                        
                        <tbody>
                          <tr>
                              <td colspan="4" width="100%" height="500">
                              
                                <div class="row" >
                                  <div class="col-3 justify-content-start"><p style="font-size: 12px;">작성일</p>
                                  ${boardfind.writedate}
                                     </div>
                                  <div class="col-3 justify-content-between"><p style="font-size:12px;">조회수</p>
                                  ${boardfind.hitcount}
                                    </div>
                                     <hr style="color: darkgray;">
                                  </div>
       		<div class="d-flex justify-content-center">
                                  <%-- <c:if test="${not empty boardfind.img_name && boardfind.img_name!=null }"> --%>
                                 
                             	<div>
                             		
                             	</div><%-- <c:if test="${not empty boardfind.img_name && boardfind.img_name!=null }">
	                                 <div>
	                                  <img class="w-75"  " alt="" src="${ctxPath}/boardImg.do?img_name=${boardfind.img_name}&m_board=${boardfind.m_board}">
	                                   <input type="hidden" id="preview" value="${boardfind.img_name}" readonly name="img_name" class="form-control border border-primary-subtle rounded rounded-4 p-2" id="img_name" disabled>
                                  	</div>
                                  	</c:if> --%>
                                 <%--  ${boardfind.content} --%>
                                 
              <div class="w-75 m-auto border border-1 rounded rounded-bottom-4 p-3">
                 <c:if test="${ boardfind.content != null }">
                 <div class="d-flex justify-content-center">${boardfind.content}</div>
                 
                  <c:if test="${not empty boardfind.img_name && boardfind.img_name!=null  }">
                  
                   	<div class="d-flex justify-content-center">
                   		<%-- <img alt="" width="450" src="${ctxPath}/download.do?imageFileName=${dto.imageFileName}&articleNo=${dto.articleNO}">이미지${dto.imageFileName} --%>
                   		<img class="w-75"  " alt="" src="${ctxPath}/boardImg?img_name=${boardfind.img_name}&m_board=${boardfind.m_board	}">
                   	</div>
                   	<div class="d-flex justify-content-center"> 
                   	
                   	</div>
                   
                    <div class="col-sm-10">
                      <input type="hidden" id="preview" value="${boardfind.img_name}" readonly name="img_name" class="form-control border border-primary-subtle rounded rounded-4 p-2" id="img_name" disabled>
                    </div>
                  </c:if>
                  </c:if>
             </div>
            

            </div>
                                  
                                  
                                  
                                  </div>
                                  
                                  
                                  
                                  </td>
                                  </tr>
                                </div>
                               </tbody> 
                            </table>
                            
     <div class="">
             <div class="d-flex align-content-start">
               <a href="${ctxPath}/users/m_boardList" class="btn" >목록</a>
          	
          	 <c:if test="${manager != null}">
           		 <div>
                 <input type="hidden" id="m_board" value="${boardfind.m_board}">
              	 <input type="hidden" id="id" value="${boardfind.id}">
                 <input type="hidden" id="title" value="${boardfind.title}">
                 <input type="hidden" id="content" value="${boardfind.content}">
                 <input type="hidden" id="name" value="${boardfind.name}">
                 <input type="hidden" id="img_name" value="${boardfind.img_name}">
              
                  </div>
                
             	<div class="mx-5"><button class="" id="updetebtn">수정</button>  </div>
             	
             <div class="mx-5"><button class="btn "  onclick="delete2()">삭제</button> </div> 
            
             	
             </c:if> 
           
           
           </div>
           
           
      </div> 
                    
                        <div class="d-flex m-auto">
                      <input class="form-control m-3" type="text" style= "font-size: 12px;" placeholder="관리자에게만 댓글작성권한이 있습니다." disabled> 
                          </div>
           <div class="container m-3 p-3">
                            <table class="table table-bordered ">
                              <thead>
                                <tr>
                                  <th scope="col" width="10%">이전글</th>
                                  <th scope="col" width="70%"></th>
                                </tr>
                          
                                <tr>
                                  <th scope="col" width="10%">다음글</th>
                                  <th scope="col" width="70%"></th>
                                </tr>
                          </thead>
                         </table>
            </div>
                          
        </div>
</main>
              <footer>
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
                  
                  
              </footer>
            </body>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
        crossorigin="anonymous"></script>          
 <script type="text/javascript">
 function delete2(){
		
		var isOK = confirm('삭제하시겠습니까?')
		if(isOK){
			location.href="${ctxPath}/delete_M_board?m_board=${boardfind.m_board}";
		}else{
			return;
		}
	}
 $(function () {
	$('#updetebtn').click(function () {
		location.href="${ctxPath}/modefy_M_board.do?m_board=${boardfind.m_board}"
		
	})
	 
})
 
/* 	$(function () {
		var m_board;
		var id ;
		var title;
		var content;
		var name;
		var img_name;
		
		$('#updetebtn').click(function () {
			m_board = $('#m_board').val()
			id = $('#id').val()
			title = $('#title').val()
			content = $('#content').val()
			name = $('#name').val()
			img_name = $('#img_name').val()
			
			console.log(m_board)
			console.log(id)
			console.log(title)
			console.log(content)
			console.log(name)
			console.log(img_name)
			location.href="${ctxPath}/order/modefy_M_board.do?m_board=${boardfind.m_board}"
			
			
		})
	}) */
 
      
   // 제이쿼리를 이용하여 파일 첨부시 미리보기 기능 구현 
      function readURL(img_name){
          if(img_name.files && img_name.files[0]){
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
              reader.readAsDataURL(img_name.files[0]);
              
          }

          
      }
      
      </script>      
            
            
            
            
            
            </html>