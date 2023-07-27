<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         <c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세 페이지 </title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
          <!--부트 아이콘 -->
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
</head>

<body>

 <!--네비바-->
        <jsp:include page="../nav/nav.jsp"/>   

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
                          <th scope="col" width="10%">문의 번호</th>
                          <th scope="col"  width="70%">${revfind.rev_code}</th>
                        </tr>
                        <tr> 
                          <th scope="col" width="10%">제목</th>
                          <th scope="col"  width="70%">${revfind.rev_title}</th>
                        </tr>
                        
                        <tr>
                          <th scope="col" width="10%">작성자</th>
                          <th scope="col"  width="70%">${revfind.user_id}</th>
                        </tr>
                        </thead>
                        
                        <tbody>
                          <tr>
                              <td colspan="4" width="100%" height="500">
                              
                                <div class="row" >
                                  <div class="col-3 justify-content-start"><p style="font-size: 12px;">작성일</p>
                                  ${revfind.rev_date}
                                     </div>
                                  <div class="col-3 justify-content-between"><p style="font-size:12px;">조회수</p>
                                  <%-- ${boardfind.hitcount} --%>
                                    </div>
                                     <hr style="color: darkgray;">
                                  </div>
       		<div class="d-flex justify-content-center">
                       
                             	<div>
                             		
                             	</div>
                                 
              <div class="w-75 m-auto border border-1 rounded rounded-bottom-4 p-3">
                 <c:if test="${ revfind.rev_content != null }">
                 <div class="d-flex justify-content-center">${revfind.rev_content}</div>
                 
                  <c:if test="${not empty revfind.rev_img && revfind.rev_img!=null  }">
                  
                   	<div class="d-flex justify-content-center">
                   		<%-- <img alt="" width="450" src="${ctxPath}/download.do?imageFileName=${dto.imageFileName}&articleNo=${dto.articleNO}">이미지${dto.imageFileName} --%>
                   		<%-- <img class="w-75"  " alt="" src="${ctxPath}/boardImg?img_name=${boardfind.img_name}&m_board=${boardfind.m_board	}"> --%>
                   	</div>
                   	<div class="d-flex justify-content-center"> 
                   	
                   	</div>
                   
                    <div class="col-sm-10">
                      <input type="hidden" id="preview" value="${revfind.rev_img}" readonly name="rev_img" class="form-control border border-primary-subtle rounded rounded-4 p-2" id="rev_img" disabled>
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
               <a href="${ctxPath}/rev/revList.do" class="btn" >목록</a>
          	
          	 <c:if test="${loginInfo == revfind.user_id}">
           		 <div>
           		 <form action="${ctxPath}/rev/update" method="get">
                 <input type="hidden"  name="rev_code" id="m_board" value="${revfind.rev_code}">
              	 <input type="hidden" id="id" value="${revfind.user_id}">
                 <input type="hidden" id="title" value="${revfind.rev_title}">
                 <input type="hidden" id="content" value="${revfind.rev_content}">
                 <%-- <input type="hidden" id="name" value="${revfind.name}"> --%>
                 <input type="hidden" id="img_name" value="${revfind.rev_img}">
              	
                  </div>
                
             	<div class="mx-5"><button class="" id="updetebtn">수정</button>  </div>
             	</form>
             <div class="mx-5"><button class="btn "  onclick="delete2()">삭제</button> </div> 
            
             	
             </c:if> 
           
           
           </div>
           
           
      </div> 
                    
                        <div class="d-flex m-auto">
                      <input class="form-control m-3" type="text" style= "font-size: 12px;" placeholder="관리자와작성자만 댓글삭제및 수정권한이 있습니다." disabled> 
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





		 <jsp:include page="../footer/footer.jsp"/>  
		
</body>
<script type="text/javascript">
function delete2() {
	
	location.href="${ctxPath}/rev/delete?rev_code=${revfind.rev_code}";

}


</script>


</html>