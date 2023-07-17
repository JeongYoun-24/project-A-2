<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         <c:set var="ctxPath" value="${pageContext.request.contextPath}" />
 	<c:set var="show" value="0"  />
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

        <header>
    <!--배너-->
     <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59" style="background: #000000 ;">
      <a href="#none" ><span style="color: #ffffff; "class="d-flex justify-content-center">신규회원 무료배송 + 1만원 쿠폰팩</span></a></div>
    
    <!--네비바-->
      <jsp:include page="../nav/nav.jsp"/>   
       

    </header>
    
        
    
   <!--제목부분-->
   <body>
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
                 <!--글작성부분-->
                 <body>
                    <div class="main">
                        <div class="container mt-3">
                        
                           
                            
                            <!-- 업로드(이미지파일)기능이 포함된 form  -->
                            <form action="${ctxPath}/m_boardInsert" 
                                  enctype="multipart/form-data"
                                  method="post" >
                                <div class="w-75 m-auto" >
                                    <h4 class="text-center">게시글 등록</h4>
                                    <hr>
                                </div>
                                <div class="w-75 m-auto" >
                                	<input type="hidden" name="hitcount" id="hitcount" value="1">
                                    <input type="hidden" name="m_board" id="m_board"  value="1000" >
                                    <div class="mb-3 row">
                                        <label for="id" class="col-sm-2 col-form-label">ID</label>
                                    <div class="col-sm-10">
                                    <input type="hidden" name="name" id="name" value="${manager} ">
                                        <input type="text" name="id" 
                                                class="form-control border rounded-1 p-2" id="id" value="${managerid}" placeholder="아이디">
                                    </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="title" class="col-sm-2 col-form-label">제목</label>
                                        <div class="col-sm-10">
                                          <input type="text" name="title"
                                                class="form-control border rounded-1 p-2" id="title" placeholder="제목">
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="content" class="col-sm-2 col-form-label">내용</label>
                                    <div class="col-sm-10">
                                        <textarea  name="content"  id="content" maxlength="4000"
                                            class="form-control border rounded-1 p-2" rows="10"></textarea>
                                    </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="img_name" class="col-sm-2 col-form-label">이미지</label>
                                        <div class="col-sm-10">
                                          <!-- jquery에서 show태그는 숨기기로 설정, 파일선택시 표시하기로 변경 -->
                                          <div id="show2">
                                              <div class="alert alert-light p-1" role="alert">
                                                  <label id="img_name2"></label>
                                              </div>
                                              <div class="alert alert-light" role="alert">
                                                <img src="#" id="preview" width="300">
                                              </div>
            
                                          </div>
                                          
                                          <input type="file"  name="img_name" id="img_name" 
                                                onchange="readURL(this)"
                                                class="form-control  p-2">
                                                
                                       
                                    </div>                                 
                                </div>
                    
                                
                                <div class="w-100 m-auto " >
                                    <hr>
                                    <div class="mb-3 row">
                                        <label for="" class="col-sm-2 col-form-label"> </label>
                                        <div class="col-sm-10">
                                            <div class=" d-flex justify-content-between  ">
                                                <div >
                                                    <button type="submit" id="m_btn" class="btn btn-outline-secondary btn-sm">저장</button>
                                                    <button type="button" id="btn_m" class="btn btn-outline-secondary btn-sm">목록</button>
                                                </div>
                                                <div>
                                                    <!-- <button type="button" class="btn btn-danger btn-sm">답글기</button> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <hr>
                                </div> 
                            </form>
                        </div>
                    </div>
</body>
<script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>
<script>
$(function () {
	$('#btn_m').click(function () {
		location.href="${ctxPath}/main.do";
	})
	
	$('#m_btn').click(function (e) {
		/* e.preventDefault(); */
		var m_board;
		var id;
		var title;
		var content;
		var name;
		var img_name;
		
		m_board =$('#m_board').val() 
		id = $('#id').val()
		title = $('#title').val()
		content = $('#content').val()
		name = $('#name').val()
		img_name = $('#img_name').val()
		
		console.log(m_board)
		console.log(id)
		console.log(title)
		console.log(content)
		console.log(name)
		console.log(img_name)
		
		/* $.ajax({  //페이지가 아닌 데이터만 보내기
			type: "post",
			async: true, //true=비동기
			url: "${ctxPath}/order/add_M_board.do",
			dataType :'text', //서버로부터 받은 데이터 타입
			data:{m_board,id,title,content,name,img_name }, //매개변수
			success : function(data,textStatus){
				
			
				
			},
			error: function(){
				
			},
			complete : function(){
				
			}
			
			
		}) //end */ 
		
		
		
	})
	
	
	
	
})

	$('#show2').hide()

	//제이쿼리를 이용하여 파일첨부시 미리 보기 기능
	
	function readURL(img_name){
		
		$('#show2').show()
		
		if(img_name.files && img_name.files[0]){
			//파일 입출력 처리하는 객체 생성
			var reader = new FileReader();

			reader.onload = function(e){
				//html에 소스 넘겨주기
				$('#preview').attr('src',e.target.result)
				
				//${show = "1"}

			}
			reader.readAsDataURL(img_name.files[0])
			
		}

	}
	
	 function list(){
		
		 location.href="${ctxPath}/main.do";
	    }
	    

</script>

</html>