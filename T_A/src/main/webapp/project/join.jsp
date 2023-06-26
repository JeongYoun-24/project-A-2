<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
        
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
                    <img src="https://theforment.com/web/upload/images/logo_header_main.svg" href="shoppingmall.html">
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
                            <a class="nav-link active" href="#">BEST SELLER SALE</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" href="#">cs센터</a>
                          </li>
                        </ul>
                      </div>
                      <div class="col-3">
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
                      </div>
                    </div>
                  </nav>
                    </div>


<!--회원가입 페이지-->
   
    <div class="join">
        <div class="container w-50">
            <form action="${ctxPath}/users/userForm" method="post" class="" >
                <div class=" row justify-content-start ">
                <h3  class="row mt-1 w-75 m-3 p-2">JOIN</h3>
                <hr>
                </div>
                <table class="table">
                    <tbody>
                    <tr>
                        <th scope="row">
                            아이디
                            <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                        
                        </th>
                        
                        <td>
                            <div class="row g-3 align-items-center">
                                <div class="col-auto">
                                  <label for="user_id" class="col-form-label"></label>
                                </div>
                                <div class="col-auto">
                                  <input type="user_id" id="user_id" class="form-control" aria-labelledby="">
                                </div>
                                <div class="col-auto">
                                  <span id="user_id" class="form-text">(영문 대,소문자/숫자,4~16자)
                                   
                                  </span>
                                  
                                </div>
                                 
                        </td>
                    </tr>
                    <tr>
                    <th scope="row">
                        비밀번호
                        <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                    </th>
                    <td>
                        <div class="row g-3 align-items-center">
                            <div class="col-auto">
                              <label for="inputPassword6" class="col-form-label"></label>
                            </div>
                            <div class="col-auto">
                              <input type="password" id="user_pwd" class="form-control" aria-labelledby="passwordHelpInline">
                            </div>
                            <div class="col-auto">
                              <span id="passwordHelpInline" class="form-text">(영문 대,소문자/숫자,4~16자)
                               
                              </span>
                            </div>
                          </div>
                    </td>
                </tr>

                <tr>
                <th scope="row">
                    비밀번호확인
                    <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                
                </th>
                <td>
                 <div class="row g-3 align-items-center">
                            <div class="col-auto">
                              <label for="user_pwd2" class="col-form-label"></label>
                            </div>
                            <div class="col-auto">
                              <input type="password" id="user_pwd2" class="form-control" aria-labelledby="">
                            </div>
                            <div class="col-auto">
                              <span id="" class="form-text">
                              </span>
                            </div>
                          </div>
                </td>
            </tr>

            <tr>
            <th scope="row">
                이름
                <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
            </th>
            <td>
                <div class="row g-3 align-items-center">
                    <div class="col-auto">
                      <label for="user_name" class="col-form-label"></label>
                    </div>
                    <div class="col-auto">
                      <input type="text" id="user_name" class="form-control" aria-labelledby="">
                    </div>
                    <div class="col-auto">
                      <span id="" class="form-text">
                      </span>
                    </div>
                  </div>
            </td>
        </tr>
        <tr>
            <th scope="row">
            휴대전화
            <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
        </th>
        <td>
            <select id="phone1" name="phone1" fw-filter="isNumber" fw-label="휴대전화">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>

            </select> -

            <input type="tel " name="phone2" id="phone2" fw-filter="isNumber" maxlength="4" value type="text"> -
            <input type="tel" name="phone3" id="phone3" fw-filter="isNumber" maxlength="4" value type="text" >

        </td>
        </tr>
        <tr>
            <th scope="row">
            이메일
            
        </th>
        <td>
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                  <label for="email" class="col-form-label">이메일</label>
                </div>
                <div class="col-auto">
                  <input type="email" id="user_email" class="form-control" aria-describedby="">
                </div>
                <div class="col-auto">
                  <span id="" class="form-text">
                   
                  </span>
                </div>
              </div>
        </td>
        </tr>
        <tr>
            <th scope="row">
            평생회원
            <div class="radio"> 
        </th>
        <td>
            <input class="form-check-input" type="radio" name="radio1" id="radio1">동의함
         
                <input class="form-check-input" type="radio" name="radio2" id="radio2">동의하지않음
                

                    <p style="font-size: 3%;">평생회원으로 가입하시면, 즉시 사용가능한 감사쿠폰 1,000원을 드려요!</p>
                </td>
                </tr>                 
            </tbody>
            </table>
    
            <div id="radio3" class="p-2">
                <h5>회원가입약관동의</h5>
                <input class="form-check-input" type="radio" name="radio3" id="radio3">
                <label class="form-check-label" for="flexRadioDefault1">
                만 14세 이상입니다.(필수)*
                </label>
            
            <div class="radio4">
                <input class="form-check-input" type="radio" name="radio4" id="radio4">
                <label class="form-check-label" >
                서비스이용약관(필수)* <a href="#">전체보기</a>
                </label>
            </div>
            
            <div id="radio5">
                <input class="form-check-input" type="radio" name="radio5" id="radio5" >
                <label class="form-check-label" for="flexRadioDefault2">
                개인정보수집및 이용동의 (필수)*
                <a href="#">전체보기</a>
                </label>
            </div>
            </div>
            <hr>
            <div class="p-2">
                <h5>쇼핑정보 수신동의</h5>
            
                        <div id="radio6">
                        
                            <input class="form-check-input" type="radio" name="radio6" id="radio6" >
                            <label class="form-check-label">
                            동의함-이메일수신(선택)  <a href="#">전체보기</a>
                            <p style="font-size: 3px;"> sms,이메일 수신에 모두 동의해주시면 적립금 1,00원을 즉시지급 해드려요! 유익한 이벤트소식도 받아보실수 있어요</ㅔ>
                            </label>
                        </div>
                        </div>
                        <div class="d-flex justify-content-center">
                        <button type="submit" id="formbtn" class="btn btn-outline-dark w-50" value="onClick">가입하기</button>
                    </div>

    </div>
</form>


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
                
    </body>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
    <script type="text/javascript">
    $(function () {
    	var user_id;
    	var user_pwd;
    	var user_name;
    	var user_email;
    	var phone1;
    	var phone2;
    	var phone3;
    	var phone ;
    	var p = "-";
    	
		$('#formbtn').click(function(e) {
			e.preventDefault();
			user_id = $('#user_id').val();
			user_pwd = $('#user_pwd').val();
			user_name = $('#user_name').val();
			user_email = $('#user_email').val();
			phone = $('#phone1').val()+p+$('#phone2').val()+p+$('#phone3').val();
			
			console.log(user_id)
			console.log(user_pwd)
			console.log(user_name)
			console.log(user_email)
			console.log(phone)
			var _jsonData	={"user_id " :user_id ,"user_pwd":user_pwd , "user_name" : user_name,"user_email ": user_email,"phone" :phone};
			console.log(_jsonData)	
			
			$.ajax({  //페이지가 아닌 데이터만 보내기
			type: "POST",
			/* async: true, //true=비동기 */
			url: "${ctxPath}/users/userinsert.do",
			data:{ "formdata" : _jsonData }, //매개변수
			success : function(data,textStatus){
				
				  var jsonMessage = JSON.parse(data);
				
				console.log(jsonMessage) 
				/* console.log(jsonMessage.code)
				console.log(jsonMessage.message)  */
				
				
			},
			error: function(){
				
			},
			complete : function(){
				
			}
			
			
		}) //end 
			
			
			
			
			
			
		})

		
	})
    
    
    
    </script>
    
    
    
    
    </html>