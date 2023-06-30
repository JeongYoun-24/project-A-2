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
          <div class="main">
            <div>
                <nav class=" navbar navbar-expand-lg bg-body-tertiary">
                    <div class="alert">
                    
                    <a href="${ctxPath}/main.do"><img src="https://theforment.com/web/upload/images/logo_header_main.svg"  href="shoppingmall.html"></a>
                    
                    </div>
                    <div class="container-fluid">
                      <a class="navbar-brand" href="#"></a>
                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                      </button>
                      <div class="collapse navbar-collapse row" id="navbarNav">
                        <div class="col-8">
                        <ul class="navbar-nav ">
                          <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                             전제품보기
                            </a>
                            <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${ctxPath}/users/m_board.do">공지사항</a></li>
                              <li><a class="dropdown-item" href="#">PRDUCT</a></li>
                              <li><a class="dropdown-item" href="#">전체</a></li>
                              <li><hr class="dropdown-divider"></li>
                              <li><a class="dropdown-item" href="#">베스트</a></li>
                               <li><a class="dropdown-item" href="${ctxPath}/users/managerlogin.do">관리자 로그인</a></li>
                            </ul>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">선물제안</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" href="#">BEST SELLER SALE</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" href="#">cs센터</a>
                          </li>
                        </ul>
                      </div>
                      <div class="col-3">
                       <c:if test="${manager != null}">
                      	${manager} 님 방갑습니다.
                      <a href="${ctxPath}/order/logout.do" class="col-3 mx-4" >로그아웃</a>
                      </c:if> 
                      
                      
                      
                       <c:if test="${loginInfo!=null }">
                       <div class="row">
							    	<div class="mx-5 login">
							    	${loginInfo}님 방갑습니다.
							    	<a href="${ctxPath}/order/logout.do" class="col-3 mx-4" >로그아웃</a>
				                    <a  href="${ctxPath}/users/myinfo.do?user_id=${loginInfo}" class="mx-4"><svg  xmlns="http://www.w3.org/2000/svg" width="30" height="22" fill="currentColor" class="bi bi-person" viewBox="0 0 16 14">
				                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
				                      </svg></a>
				                      <input type="hidden" id="user_id" value="${loginInfo}">
				                      
									<!--  <a id="" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="20" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
				                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				                      </svg></a> -->
				                       <a id="" href="${ctxPath}/users/cart.do"  data-bs-target="#exampleModal"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="20" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
				                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				                      </svg></a>
				                      
				                </div>
						</div>	    
							    </c:if>
                      
                       <c:if test="${manager == null}">
                      	
                      
                     
                      <c:if test="${loginInfo==null }">
                           <ul class="navbar-nav login ">
                            <li class="nav-item">
                              <a class="nav-link " href="${ctxPath}/users/loginPage.do">LOGIN</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="#">JOIN</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link " href="#">ORDER</a>
                            </li>
                            <li class="nav-item ">
                              <a class="nav-link " href="#">CART</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link m-1" href="#"><i class="bi bi-search"></i></a>
                            </li>
                           </ul>
                        </div>
                        
                       </c:if> 
                   </c:if>     
                        
                        
                      </div>
                    </div>
                  </nav>
                </div>
   
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
                <c:when test="${doardList.size() == 0 || doardList == null}">
                  <tr>
                    <td colspan="1">1</td>
                    <td colspan="5">등록된 공지사항이 없습니다.</td>
                  </tr>
                </c:when>
                <c:when test="${doardList!=null}">
                    <c:forEach var="mem" items="${doardList}" varStatus="loop">                  
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
		location.href="${ctxPath}/order/M_board.do"
	})
	 
})
 </script>
 
</html>