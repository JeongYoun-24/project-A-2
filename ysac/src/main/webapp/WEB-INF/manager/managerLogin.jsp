<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>관리자 로그인페이지</title>
        
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
                   
                    <a href="${ctxPath}/main.do">  <img src="https://theforment.com/web/upload/images/logo_header_main.svg"  href="shoppingmall.html"></a>
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
                     <div>
                      <a  href="${ctxPath}/order/users/manager.do" class="mx-4"><svg  xmlns="http://www.w3.org/2000/svg" width="30" height="22" fill="currentColor" class="bi bi-person" viewBox="0 0 16 14">
				        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
				        </svg></a>
                     </div>
                     
                      </c:if> 
                     
                      
                       <c:if test="${loginInfo!=null }">
                       <div class="row">
							    	<div class="mx-5 login">
							    	${loginInfo}님 방갑습니다.
							    	<a href="${ctxPath}/order/logout.do" class="col-3">로그아웃</a>
				                    
				                </div>
				                 <div class="col-3">
				                 
                             <ul class="navbar-nav login ">
                            
                              <li class="nav-item">
                               
                              </li>
                              <li class="nav-item">
                                <a  href="${ctxPath}/users/myinfo.do?user_id=${loginInfo}" class="mx-4"><svg  xmlns="http://www.w3.org/2000/svg" width="30" height="22" fill="currentColor" class="bi bi-person" viewBox="0 0 16 14">
				                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
				                      </svg></a>
				                         <input type="hidden" id="user_id" value="${loginInfo}">
                              </li>
                              <li class="nav-item">
                              <a id="" href="${ctxPath}/users/orderList.do"  data-bs-target="#exampleModal"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
								  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
								</svg></a>
                              </li>
                              <li class="nav-item mx-4 ">
                               <a id="" href="${ctxPath}/users/cart.do"  data-bs-target="#exampleModal"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="20" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
				                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				                      </svg></a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link m-1" href="#"><i class="bi bi-search"></i></a>
                              </li>
                             </ul>
                          </div>
				                
				                
						</div>	    
						</c:if>
                       
				                     
                      <c:if test="${loginInfo==null }">
                           <ul class="navbar-nav login ">
                            <li class="nav-item">
                              <a class="nav-link " href="${ctxPath}/users/loginPage.do">LOGIN</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="${ctxPath}/users/userForm.do">JOIN</a>
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
    
                  <!--로그인 페이지-->
   
    <div class="logins p-3 m-3">
        <div class="container  d-flex justify-content-center w-100">
            <form action="${ctxPath}/managerlogin.do" method="post" class="" >
                <div class=" row justify-content-around ">
                <h3  class="row mt-1 w-75">관리자 로그인 </h3>
                </div>
                    <div class=" row justify-content-around ">
                    <div class="row mt-1 w-75">
                        <input type="text" name="id" id="id" class="form-control m-1" placeholder="아이디">
                    </div>
                    <div id="id_message"></div>
                </div>
                    <div class=" row justify-content-around">
                    <div class="row mt-1 w-75 ">
                        <input type="password" name="pwd" id="pwd" class="form-control m-1" placeholder="비밀번호">
                    </div>
                  	<div id="pw_message"></div>
                </div>
                <div class="row justify-content-around">
                    <div class="row mt-1 w-75"> 
                        <input type="submit" id="btnLogin" value="로그인" class="btn btn-outline-dark m-1">
                    </div>
                   
                    
                          </div>
                          <div class="mt-1 w-75">
                          <div class="row">
                            <div class="col-2"></div>
                            <div class="col-10 text-end">
                                <a href="#" class="link-success link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">아이디찾기</a>
                                <a class = "text-secondary">|</a>
                                <a href="#" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">비밀번호찾기</a>
                              </div>
                            </div>
                        </div>
                      
                     </form> 
                      </div>
                   </div>
                   
                </div>
        </div>
      

<!--주소-->
    <div class="and bg-light">
        <div class="container ">
          <div class="content ">
            <div class=" p-5 ">
                  <img src="https://theforment.com/web/upload/images/logo_header_main.svg" alt="푸터로고">
             
           
                <a href="#"><span class="m-3">회사소개</a></span>
                <a href="#"><span class="m-3">서비스이용약관</a></span> 
                <a href="#"><span class="m-3">개인정보처리방침</a></span>
                <a href="#"><span class="m-3">전자금융거래약관 </a></span>

              </div>
          </div>
          <div class="d-flex justify-content-between ">
            <div class="container">
                <p>
                    <strong>(주)FORMENT</strong>
                    <br>
                    부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                    <br>
                    대표이사 : 홍길동
                    <br>
                    사업자등록번호 : 220-81-83676 사업자정보확인
                    <br>
                    통신판매업신고 : 강남 10630호 Fax : 02-589-8842
                </p>
              </div>
            
              <div class="container">
                <p>
                    <strong>고객센터</strong>
                    <br>
                    Tel : 1234-5678 (평일 09:00~18:00)
                    <br>
                    스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)
                    <br>
                    경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층
                    <br>
                    Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr
                    <br>
                </p>
              
              </div>
              </div>
            </div>
          </div>
        </div>     
            
          




</div>  
 <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
<script type="text/javascript">

function changeVideo(img){
$(".video_large").hide();
var video_id = $(img).attr('video_id');
document.getElementById(video_id).style.display='block';
}
 
$(function(){
	var path = $('#path').val()
	$('#formbtn').click(function() {
		location.href=path+"/users/userForm.do";
		
	})
	
	
	var user_id;
	var user_pw;
	var auto;
	
	
 
})
 
 
$(function(){
	var user_id;
	var user_pwd;
	var auto;
	
	$('#user_id').focus(function(){
		$(this).val('')
	});
	$('#user_pwd').focus(function(){
		$(this).val('')
		$('#pw_message').hide()
	});
	

})
</script>


</html>