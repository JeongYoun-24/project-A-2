<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         <c:set var="ctxPath" value="${pageContext.request.contextPath}" />
 	<c:set var="show" value="0"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    
</head>
<body>


	<div class="main">
		<div class="container">
			<!-- 
			<form action="/web01/boardlist/insert.do" method="post">
			 -->
			
			<!-- 
			 -->
			<form action="/T_A/order/add_M_board.do" enctype="multipart/form-data" method="post">
			<div class="w-75 m-auto">
				<h4 class="text-center">게시글 등록</h4>
				<hr>
			</div>

			<div class="w-75 m-auto">
			   
				  <div class="mb-3 row">
					<label for="id" class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-10">
					<input type="hidden" name="m_board" value="1000" >
					<input type="hidden" name="name" value="관리자1" >
					  <input type="type"  name="id" class="form-control p-1" id="id">
					</div>
				  </div>

				  <div class="mb-3 row">
					<label for="title" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
					  <input type="text" name="title" class="form-control" id="title" >
					</div>
				  </div>

				  <div class="mb-3 row">
					<label for="content" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
					  <textarea class="form-control" name="content" id="content" rows="10"></textarea>
					</div>
				  </div>

				  
				  
				  <!-- 첨부파일 잇을 경우 없을 경우 구분 -->
				 <div class="mb-3 row">
                        <label for="img_name" class="col-sm-2 col-form-label">이미지</label>
                        <div class="col-sm-10">
                        	
                        	
                        	<div id = "show2">
                        		<div>
	                                <img src="#" alt="이미지" id="preview" >
	                            </div>
	                            
	                            <div>
	                                <label for="" id="previewName"></label>
	                            </div>
                        	</div>
	                            
                          
                          <input type="file" value="" name="img_name" onchange="readURL(this)" class="form-control border border-primary-subtle rounded rounded-4 p-2" id="img_name">
                        </div>
                      </div>
					
					
				<input type="submit" class="btn btn-primary"></button>
				<input type="submit" class="btn btn-primary" value="목록" onClick="list()"></button>

				  
			</div>
				
			
			</form>
			

		</div>
	</div>

<script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>
<script>

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
	    	location.href="${ctxPath}/users/m_board.do";
	    }
	    

</script>

</html>