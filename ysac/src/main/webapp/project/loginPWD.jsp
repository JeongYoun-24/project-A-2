<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>비밀번호 찾기</title>
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
       <jsp:include page="../nav/nav.jsp"/>   
</header>
<body>
    <div class="container">
        <form action="${ctxPath}/users/loginPWD.do" method="post" class="d-flex justify-content-center">
            <div class="login row w-75 m-3 p-3 border justify-content-center rounded">
                <h3>비밀번호찾기</h3>
                <c:choose>
                    <c:when test="${not empty user_pwd }">
                        <div class="d-flex justify-content-center">
                        <h5>비밀번호는 ${user_pwd}입니다.</h5>
                        </div>
                    </c:when>
                <c:otherwise>
                
                
                </c:otherwise>
                
                </c:choose>
                <div class="row">
                 <div class="card-body">
			      
			  		 <p class="text2"> </p>
			        <input type="text" name="user_id" id="user_id" class="form-control" placeholder="아이디" required><br>
        			<!-- <input type="text" name="user_name" id="user_name" class="form-control" placeholder="이름" required><br> -->
        			<input type="email" name="user_email" id="user_email" class="form-control" placeholder="이메일" required>
			        	<p class="checks" id="checks"></p><br/>
                <div class="row justify-content-around"> 
                        <input type="submit" value="비밀번호찾기" class="btn btn-outline-secondary">  
                </div>
                
                <div class=" m-2">
                    <div>
                    <a href="${ctxPath}/users/loginID.do" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">아이디찾기</a>|
                    <a href="${ctxPath}/users/usersLogin" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">로그인</a>|
                    <a href="${ctxPath}/users/usersJoin" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원가입</a>
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
   
    </div> 
</footer>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">

        	//아이디 정규식
		var idJ = /^[a-z0-9]{5,20}$/;
		
        $("#member_id").focusout(function(){
       if($('#member_id').val() == ""){
             $('#checks').text('아이디를 입력해주세요.');
            $('#checks').css('color', 'red');
       }
       });
        
        $("#member_id").focusout(function(){
            if(!idJ.test($(this).val())){
            $('#checks').text('5~20자의 영문 소문자, 숫자만 사용가능합니다');
            $('#checks').css('color', 'red');
        }
         });
        
        $("#name").focusout(function(){
       if($('#name').val() == ""){
             $('#checks').text('이름을 입력해주세요.');
               $('#checks').css('color', 'red');
       }
       });
       
        $("#email").focusout(function(){
       if($('#email').val() == ""){
             $('#checks').text('이메일을 입력해주세요');
               $('#checks').css('color', 'red');
       }
       });
</script>
</html>