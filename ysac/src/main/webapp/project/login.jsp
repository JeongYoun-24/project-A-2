<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>로그인 페이지</title>
        
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
        <jsp:include page="../nav/nav.jsp"/>   
    
                  <!--로그인 페이지-->
   
    <div class="logins p-3 m-3">
        <div class="container  d-flex justify-content-center w-100">
            <form action="#" method="post" class="" >
                <div class=" row justify-content-around ">
                <h3  class="row mt-1 w-75">LOGIN</h3>
                </div>
                    <div class=" row justify-content-around ">
                    <div class="row mt-1 w-75">
                        <input type="text" name="user_id" id="user_id" class="form-control m-1" placeholder="아이디">
                    </div>
                    <div id="id_message"></div>
                </div>
                    <div class=" row justify-content-around">
                    <div class="row mt-1 w-75 ">
                        <input type="password" name="user_pwd" id="user_pwd" class="form-control m-1" placeholder="비밀번호">
                    </div>
                  	<div id="pw_message"></div>
                </div>
                <div class="row justify-content-around">
                    <div class="row mt-1 w-75"> 
                        <input type="submit" id="btnLogin" value="로그인" class="btn btn-outline-dark m-1">
                    </div>
                    <div class="row  mt-1 w-75"> 
                        <a type="reset" id="formbtn"  class="btn btn-dark m-1"> 회원가입</a>
						<input type="hidden" value="${ctxPath}" id="path">
                    </div>
                    <div class="mt-1 w-75"> 
                        <div class="row">
                            <div class ="col-6 align-content-end"> 
                                  <input class="form-check-input" type="checkbox" 
                                            name="auto" value="off" id="auto">
                                  <label class="form-check-label" for="chk" m-1 form-control>아이디저장</label>
                                 
                              </div>
                            <!--   <div class ="col-6 align-content-around">
                                  <input class="form-check-input" type="checkbox" 
                                            name="chk2" value="로그인유지" id="chk2">
                                  <label class="form-check-label" for="chk2" m-1 form-control>로그인유지</label>
                                </div> -->
                             
                            </div>
                          </div>
                          <div class="mt-1 w-75">
                          <div class="row">
                            <div class="col-2"></div>
                            <div class="col-10 text-end">
                                <a href="${ctxPath}/users/loginID.do" class="link-success link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">아이디찾기</a>
                                <a class = "text-secondary">|</a>
                                <a href="${ctxPath}/users/loginPWD.do" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">비밀번호찾기</a>
                              </div>
                            </div>
                        </div>
                      </div>
                   </div>
                </div>
            </form>
        </div>
      

<!--주소-->
    <div class="and bg-light mt-5">
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
          <div class="d-flex justify-content-between  ">
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
		location.href=path+"/users/usersJoin";
		
	})
	
	
	var user_id;
	var user_pw;
	var auto;
	
	$('#btnLogin').click(function(e){
		e.preventDefault();
		$('#pw_message').show()
		user_id = $('#user_id').val();
		user_pwd = $('#user_pwd').val();
		auto = $('#auto').val();
		
	
		//html요소 값 => js 변수 저장 => json 형식 반환 => ajax으로전송
		var _jsonData = '{'+
				'"user_id": "'+user_id +'", '+
				'"user_pwd": "'+user_pwd+'",'+
				'"auto":"'+auto+
		'"}'
		
		console.log(_jsonData)
		
		$.ajax({  //페이지가 아닌 데이터만 보내기
			type: "post",
			async: true, //true=비동기
			url: "${ctxPath}/users/usersLogin",
			dataType : 'text', //서버로부터 받은 데이터 타입
			data:{ "logindata" : _jsonData}, //매개변수
			success : function(data,textStatus){
				
			var jsonMessage = JSON.parse(data);
				
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
			
			
		}) //end 
		
	});

 
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
		/* $('#pw_message').text(jsonMessage.message); */
	});
	
	$('#auto').click(function(){
		if ($(this).is(":checked")==true){
			$(this).val('on')
		} else {
			$(this).val('off')
		}
		console.log($(this).val())
	});

})
</script>


</html>