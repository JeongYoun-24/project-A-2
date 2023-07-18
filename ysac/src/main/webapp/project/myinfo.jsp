<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      
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
   .add{
   width: ;
   height: 20px;
   
   }
   
   
</style>
</head>
<body>
<header>
 <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59" style="background: #000000 ;">
  <a href="#none" ><span style="color: #ffffff; "class="d-flex justify-content-center">신규회원 무료배송 + 1만원 쿠폰팩</span></a></div>

	<<jsp:include page="../nav/nav.jsp"/>   
		

</header>


  
        
            <div class="main">
                <div class="container">
                    <div class="m-3 p-3">
                    <h4>회원정보 수정</h4>
                </div>
                    <div class="d-flex  p-3 bg-light">
                    <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif">
                    <div class="d-flex align-content-center">
                    <span style="font-size: 15px;" class="d-flex text-center">저희 쇼핑몰을 이용해주셔서 감사합니다.<strong>${loginInfo}님은</strong> <strong>[웰컴]</strong>회원이십니다.</span>
                 </div>
                </div>
           
           
              <!-- 테이블-->
            <div class="row">
            <div class="info col-10 mt-3">
                 <span>회원 기본정보</span>
                </div>
            <div class="info col-2 mt-3 text-end">
           <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
           <span>필수 입력사항</span>
        </div>
    </div>
        <div class="container w-100">
            <form action="#" method="post" class="" >
                
                <div class=" form">
                <table class="table table-bordered">
                    
                    <tbody>
                        <tr>
                        <th scope="row">
                            <span class="m-2 mt-auto">아이디</span>
                            <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                        </th>
                        
                        <td>
                            <input type="user_id" name="user_id" id="user_id" value="${users.user_id}" disabled="disabled">
                            <span>(영문소문자/숫자,4~16자)</span>
                        </td>
                    </tr>
                    <tr>
                    <th scope="row">
                        <span class="m-2">비밀번호</span>
                        <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                    </th>
                    <td>
                        <input type="password" name="user_pwd" id="user_pwd" value="">
                        <span>(영문 대소문자/숫자/특수문자 중2가지 이상 조합,8자~16자)</span>
                    </td>
                </tr>

                <tr>
                <th scope="row">
                    <span class="m-2">비밀번호확인</span> 
                    <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                
                </th>
                <td>
                    <input type="password" name="user_pwd2" id="user_pwd2" value="">
                </td>
            </tr>

            <tr>
            <th scope="row">
                <span class="m-2">이름</span>
                <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
            </th>
            <td>
                <input type="user_name" name="user_name" id="user_name"value="${users.user_name}">
            </td>

            <tr>
                <th scope="row">
                    <span class="m-2">주소</span>
                    <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                </th>
                <td>
                    <!-- <input type="adress" name="adress1" id="sample4_postcode" placeholder="우편번호"label="주소">  <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif"><br>  
                    <input  class="btn btn-outline-dark mb-1" style="height: 50px;" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                    <input type="adress"  class="mt-2"name="adress2" id="sample4_roadAddress" placeholder="도로명주소" value="">    
                   기본주소<br>
                    <input type="adress" class="mt-2" name="adress3" id="sample4_detailAddress" value="">나머지주소(선택가능) -->
               		<input name="zip_code"  class="add" style="height: 35px; width: 380px;" type="adress" id="sample4_postcode" placeholder="우편번호">
                    <input  class="btn btn-outline-dark mb-1" style="height: 35px;" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input name="address"  class="mt-2 add" style="height: 35px; width: 510px;" type="adress" id="sample4_roadAddress" placeholder="도로명주소"><br>
                    <input name="DetAddress"  class="mt-2 add"  style="height: 35px; width:510px ; " type="adress" id="sample4_detailAddress" placeholder="상세주소">
               
               
                </td>
        </tr>
                        
        
        
        <tr>
            <th scope="row">
                <span class="m-2">휴대전화</span>
            <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
        </th>
        <td>
            <select id=phone1 name="phone1" fw-filter="isNumber" fw-label="휴대전화">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>

            </select> -

            <input type="text" name="phone2" id="phone2" fw-filter="isNumber" maxlength="4" value type="text"> -
            <input type="text" name="phone3" id="phone3" fw-filter="isNumber" maxlength="4" value type="text" ><br>
            <input class="form-check-input" type="radio" name="radio1" id="radio1">수신함
         
            <input class="form-check-input" type="radio" name="radio2" id="radio2">수신안함
            

                <p style="font-size: 3%;">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받을수 있습니다.</p>

        </td>
        </tr>
        <tr>
            <th scope="row">
                <span class="m-2">이메일</span>
                
            </th>
            <td>
                <input type="user_email" name="user_email" id="user_email"value="${users.user_email}"><br>
                <div class="email_check">
                <input class="form-check-input" type="radio" name="radio1" id="radio3">수신함
            
                <input class="form-check-input" type="radio" name="radio2" id="radio4">수신안함
                

                    <p style="font-size: 3%;">쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받을수 있습니다.</p>
                </div>
            </td>
            </tr>
        </div>
               
                        <tr>
                        <th scope="row">
                            <span class="m-2 mt-auto">성별</span>
                            <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                        </th>
                        
                        <td>
                            <input class="form-check-input" type="radio" name="radio1" id="radio5">여자
            
                <input class="form-check-input" type="radio" name="radio2" id="radio6">남자
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <span class="m-2 mt-auto">생년월일</span>
                            <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif">
                        </th>
                        
                        <td>
                            <input type="text" name="birthdate" id="birthdate" fw-filter="isNumber" maxlength="8" value="">
                                    <span>(예)19990101)</span>
                                </td>
                            </tr>
                      </tbody>
                   </table>
                  </div>
               </form>   
              </div>
              <div class="row">
              <div class="d-flex justify-content-center">
               <div class="col-3">
               
            </div>
                <div class="col-3">
                <button type= "button" id="formbtn" class="btn btn-outline-dark w-50" value="onClick">회원정보수정</button>
            </div>
                <div class="col-3">
            <button type= "button" class="btn btn-outline-secondary w-50" value="onClick">취소</button>
        </div>
        
         <div class="col-3">
            <button type= "button" id="deletebtn" class="btn btn-outline-secondary w-50" value="onClick">회원탈퇴</button>
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

    
</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    
    
<script type="text/javascript">
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

$(function () {
	$('#deletebtn').click(function() {
		var user_id;
		user_id = $('#user_id').val()
		console.log(user_id)
		
	
		
		
		 $.ajax({
			type: "Delete",
			url: "${ctxPath}/users/usersInfo",
			data:{"user_id":user_id}, //매개변수
			success : function(data,textStatus){
				 var jsonMessage = data;
	
			},
			error: function(){
				
			},
			complete : function(){
				
			}
		 })
		
		
		
	/* 	location.href="${ctxPath}/users/U_delete.do?user_id=${users.user_id}" */
	})
	
	
	var user_id;
	var user_pwd;
	var user_name;
	var user_email;
	var phone1;
	var phone2;
	var phone3;
	var phone ;
	var p = "-";
	var sample4_roadAddress ; // 도로명 주소
	var sample4_detailAddress;  // 상세주소 
	var p2 = " ";
	var address;  // 주소 합친거
	var birthdate ; // 생년월일
	
	$('#formbtn').click(function(e) {
		e.preventDefault();
		user_id = $('#user_id').val();
		user_pwd = $('#user_pwd').val();
		user_name = $('#user_name').val();
		user_email = $('#user_email').val();
		phone = $('#phone1').val()+p+$('#phone2').val()+p+$('#phone3').val();
		address = $('#sample4_roadAddress').val()+p2+$('#sample4_detailAddress').val()
		birthdate = $('#birthdate').val()
		console.log(user_id)
		console.log(user_pwd)
		console.log(user_name)
		console.log(user_email)
		console.log(phone)
		console.log(address)
		console.log(birthdate)
		
		 $.ajax({  //페이지가 아닌 데이터만 보내기
		type: "post",
		 async: true, //true=비동기 
			url: "${ctxPath}/users/usersInfo",
			data:{user_id,user_pwd ,user_name,user_email,phone,address,birthdate}, //매개변수
			success : function(data,textStatus){
				 var jsonMessage = data;
				
				
				$('#id_message').text('');
				
				
				if(jsonMessage.code === 'id_fail'){
					alert('수정 실패');
		//			$('#id_message').text(jsonMessage.message);
				
				}else{
					alert('수정 성공');
					location.href="${ctxPath}/main.do"
					 
				} 
				
				
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