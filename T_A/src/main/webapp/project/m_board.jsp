<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>shoppingmall</title>
       
       
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
        <!--배너-->
         <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59" style="background: #000000 ;">
          <a href="#none" ><span style="color: #ffffff; "class="d-flex justify-content-center">신규회원 무료배송 + 1만원 쿠폰팩</span></a></div>
        
        <!--네비바-->
          <div class="main">
            <div>
                <nav class=" navbar navbar-expand-lg bg-body-tertiary">
                    <div class="alert">
                    <img src="https://theforment.com/web/upload/images/logo_header_main.svg"  href="shoppingmall.html">
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
                            </ul>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">선물제안</a>
                          </li>
                         
                          <li class="nav-item">
                            <a class="nav-link active" href="#">정기배송</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" href="#">브랜드</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" href="#">cs센터</a>
                          </li>
                        </ul>
                      </div>
                   <c:if test="${loginInfo!=null }">
                      <div class="col-3">
                           <ul class="navbar-nav login ">
                            <li class="nav-item col-auto">
                              ${loginInfo}님 
							    	<a href="${ctxPath}/order/logout.do" class="col-3">로그아웃</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="${ctxPath}/users/myinfo.do">JOIN</a>
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
                     <c:if test="${loginInfo==null }">
                     <div class="col-3">
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
                        
                        
                        
                      </div>
                    </div>
                </nav>
            </div>
         </div>
      <body>
   
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
                          <th scope="col"  width="70%">제목</th>
                          <th scope="col" width="10%"> 작성자</th>
                          <th scope="col" width="10%"> 조회</th>
                        </tr>
                      </thead>
                      <tbody>
                            <td colspan="4">
                          등록된자료가없습니다.</td>
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
                </div>
            </body>
            </html>