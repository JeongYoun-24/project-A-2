<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>쇼핑몰 메인</title>
       
       
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
        <!--배너-->
         <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59" style="background: #000000 ;">
          <a href="#none" ><span style="color: #ffffff; "class="d-flex justify-content-center">신규회원 무료배송 + 1만원 쿠폰팩</span></a></div>
        
        <!--네비바-->
         <jsp:include page="../nav/nav.jsp"/>   
   
        <!--제목부분-->
     <div class="main">
        <div class="container">
               <div class="row">
                   <div class="col-4 mt-5 d-flex justify-content-start">
                 <span>NOTICE</span>
                    </div>
             
                    <div class="col-4 mt-5 p-2 d-flex justify-content-between">
                        
                            <span>NOTICE</span>
                            <span>Q&A</span>
                            <span>FAQ</span>
                            <span>MEMBERSHIP</span> 
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
                  </div>
               <div class="container">
                  <table class="table table-bordered">
                    <thead>
                        <tr>
                          
                          <th scope="col" width="10%">공지</th>
                          <th scope="col"  width="60%">제목</th>
                          <th scope="col" width="10%"> 작성자</th>
                          <th scope="col" width="10%"> 조회</th>
                          <th scope="col" width="10%"> 작성일자</th>
                        </tr>
                      </thead>
                      
                      <tbody>
             <c:choose>
                <c:when test="${boardList.size() == 0 || boardList == null}">
                  <tr>
                    <td colspan="1">1</td>
                    <td colspan="5">등록된 공지사항이 없습니다.</td>
                  </tr>
                </c:when>
                <c:when test="${boardList!=null}">
                    <c:forEach var="mem" items="${boardList}" varStatus="loop">                  
                  <tr>
                      <th scope="row">${loop.index+1}</th>
                      <td>
                       <a href="${ctxPath}/users/m_boardview.do?m_board=${mem.m_board}"  
                          class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">${mem.title}</a>
                      </td>
                       <td>${mem.name}>
                      
                      <td>${mem.hitcount}</td>
                      <td>${mem.writedate}</td> 
                    </tr>
                  </c:forEach>
                </c:when>
               
               
               
              </c:choose>
                           
                     <!--  <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td colspan="2">Larry the Bird</td>
                        <td>@twitter</td>
                      </tr>-->
                    </tbody> 
                  </table>
           <c:if test="${manager != null}">
            <div>
              	<button class="btn border" id="m_btn">공지사항 및 이벤트 쓰기 </button>
            </div>
        
          </c:if>      
           
       </div>
                
          <footer>
          
          </footer>      
                
 </body>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
 <script type="text/javascript">
 $(function () {
		$('#m_btn').click(function () {
			location.href="${ctxPath}/m_boardInsert"
		})
		 
	})
 </script>
 
</html>