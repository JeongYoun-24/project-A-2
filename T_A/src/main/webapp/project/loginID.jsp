<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디찾기</title>
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
<header>
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
                        
                        
                        
                      </div>
                    </div>
                  </nav>
                    </div>
      
      
       </div>
</header>


<!--아이디찾기-->
<body>
    <div class="container">
        <form action="${ctxPath}/users/loginIDdate.do" method="post" class="d-flex justify-content-center">
            <div class="login row w-75 m-3 p-3 border justify-content-center rounded">
                <h3>아이디 찾기</h3>
                <c:choose>
                    <c:when test="${not empty user_id }">
                        <div class="d-flex justify-content-center">
                        <h5>아이디는 ${user_id}입니다.</h5>
                        </div>
                    </c:when>
                <c:otherwise>
                
                
                </c:otherwise>
                
                </c:choose>
                <div class="row">
                 <div class="card-body">
			     <!--  <form action="" class="form-signin" method="POST"> -->
			  		 <p class="text2"></p>
			        <input type="text" name="user_name" id="user_name" class="form-control" placeholder="이름" required autofocus><BR>
			        <input type="email" name="user_email" id="user_email" class="form-control" placeholder="이메일" required><br>
			        	<p class="check" id="check"></p><br/>
                <div class="row justify-content-around"> 
                        <input type="submit" value="아이디찾기" id="loingidbtn" class="btn btn-outline-secondary">  
                </div>
                <!--  </form> -->
                <div class=" m-2">
                    <div>
                    <a href="${ctxPath}/users/loginPWD.do" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">비밀번호찾기</a>|
                    <a href="${ctxPath}/users/loginPage.do" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">로그인</a>|
                    <a href="${ctxPath}/users/userForm.do" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원가입</a>
                    </div>
                </div>
                 
            </div>
        </div>
        </div>
        </form>
   </div> 

</body>
   <footer>
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
   

   </footer>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script>
    $(function () {
    	var user_name;
    	var user_email;
    	
    	
		$("#loingidbtn").click(function (e) {
			/* e.preventDefault(); */
			user_name = $('#user_name').val()
			user_email = $('#user_email').val()
			console.log(user_name)
			console.log(user_email)
			
		/* 	 $.ajax({  //페이지가 아닌 데이터만 보내기
				type: "post",
				async: true, //true=비동기
				url: "${ctxPath}/users/loginIDdate.do",
				dataType : 'text', //서버로부터 받은 데이터 타입
				data:{user_name, user_email}, //매개변수
				success : function(data,textStatus){
					
				 var jsonMessage = data;
					
					console.log(jsonMessage)
					console.log(jsonMessage.code)
					console.log(jsonMessage.message)
					
					$('#id_message').text('')
					$('#pw_message').text('')
					
					if(jsonMessage.code === 'id_fail'){
						$('#id_message').text(jsonMessage.message);
						
					}else if(jsonMessage.code === 'pw_fail'){
						$('#pw_message').text(jsonMessage.message);
						
					}else{
						 location.href="${ctxPath}/main.do" 
					} 
				},
				error: function(){
					
				},
				complete : function(){
					
				}
				
				
			}) */   //end
			
			
		})
	})
    
    
        $("#name").focusout(function(){
  			
              if($('#name').val() == ""){
                    $('#check').text('이름을 입력해주세요.');
                      $('#check').css('color', 'red');
            
              }else{
                  $('#check').hide();
              }
              });
              
               $("#email").focusout(function(){
              if($('#email').val() == ""){
                    $('#check').text('이메일을 입력해주세요');
                      $('#check').css('color', 'red');
              }else{
                  $('#check').hide();
              }
              });
    </script>
    
</html>