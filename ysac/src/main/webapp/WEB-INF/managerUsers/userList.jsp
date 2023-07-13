<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
	
	 <c:set var="boardList" value="${articlesMap.dtoList}"/>
       <c:set var="totArticles" value="${articlesMap.totArticles}"/>
       <c:set var="section" value="${articlesMap.section}"/>
       <c:set var="pageNum" value="${articlesMap.pageNum}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
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
회원 리스트 페이지 
<header>
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
                           </c:if> 
                   		</c:if>     
                         
                           
                        </div>
                        
                      
                        
                        
                      </div>
                    </div>
                  </nav>
                </div>


</header>

<main>
	<%--  ${articlesMap} <br>  --%>
  <%--  ${boardList} <br>  --%> 
	<%--  totArticles =		${totArticles} <br>
	section =		${section}<br>
	pageNum =		${pageNum}<br>
	lastPage =		${lastPage}<br>
	totSection =	${totSection}<br>  --%>
	
	


	 <div class="conteniner">
 		<div>
 			<div class="d-flex justify-content-end">
 				<nav class="navbar navbar-expand-lg bg-body-tertiary" style="height: 40px">
				  
				      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
				       
				        <li class="nav-item dropdown">
				          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            검색 기능 설정
				          </a>
				          <ul class="dropdown-menu">
				            <li><button class="dropdown-item" id="id_btn">아이디로 검색</button> </li>
				            <li><button class="dropdown-item" id="name_btn">이름으로 검색</button></li>
				            <li><button class="dropdown-item" id="email_btn">이메일로 검색</button></li>
				          </ul>
				        </li>
				      </ul>
					</nav>
					<div id="btn1">
                      	<form class="d-flex"  action="" method="post" role="search">
                        <input class="form-control me-2" name="code" id="code" type="text" placeholder="아이디 검색창" >
                        <button class="btn btn-outline-dark " id="code2" style="width: 70px;" type="submit">검색</button>
                      </form>
                   </div>
                    <div id="btn2">
                     	<form class="d-flex"  action="" method="post" role="search">
                        <input class="form-control me-2" name="code02" id="code02" type="text" placeholder="이름 검색창" >
                        <button class="btn btn-outline-dark " id="code3" style="width: 70px;" type="submit">검색</button>
                      </form>
                   </div>
                    <div id="btn3">
                     	<form class="d-flex"  action="" method="post" role="search">
                        <input class="form-control me-2" name="code03" id="code03" type="text" placeholder="이메일 검색창" >
                        <button class="btn btn-outline-dark " id="code4" style="width: 70px;" type="submit">검색</button>
                      </form>
                   </div>
                       
                      <input type="hidden" value="${ctxPath}" id="path">
                    </div>
					
 			</div>
 			
 			
 			
 		</div>
 		
 		
 		<div class="container">
 				<div>
          
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th scope="col">회원 번호</th>
                        <th scope="col">아이디</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">이름</th>
                        <th scope="col">이메일</th>
                        <th scope="col">가입일자</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach var="article" items="${boardList}" varStatus="articleNum">
                    
                     <tr>
                        <th scope="row">${articleNum.count} </th>
                         <td>${article.recNum}</td>
                        <td>${article.user_id}</td>
                        
                        
                        <td>
                        
							<a href="${ctxPath}/orcle/viewArticle.do" class="link-body-emphasis link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover">${article.phone}</a>
                        	
                        </td>
                        <td>${article.user_name}</td>
                        <td>${article.user_email}</td>
                        <td>${article.regdate}</td>
                        
                        
                      </tr>
                      
                    </c:forEach>
					<tr>
                        <td colspan="4">
                            페이징
                        </td>
                      </tr>
                       
                    </tbody>
                  </table>


              
                  
                  
		</div>
 				
 			<div>
 			
 			
 			</div>
 		
 		
 		</div> 
 				
 		       <div class="w-75 m-auto d-flex justify-content-center " ><%-- ${lastPage } --%>
            
            	<c:if test="${totArticles != null }">
                <nav aria-label="...">
                
                    <ul class="pagination">
                       	<c:forEach var="page" begin="1" end="${lastPage}" step="1" >
		                     <!--  section 2이상이고 1page이면 이전 버튼 활성화 -->	
	                       	 <c:if test="${section > 1 && page==1 }">
		                      	<li class="page-item ">
		                        	<a class="page-link" href="${ctxPath}/order/users/manager.do?pageBlock=${section-1}&pageNum=1"><span aria-hidden="true">&laquo;</span></a>
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" href="${ctxPath}/order/users/manager.do?pageBlock=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:when>
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	<a class="page-link" href="${ctxPath}/order/users/manager.do?pageBlock=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:otherwise>
   	                    	 </c:choose>
   	                    	

                      	</c:forEach>
	                      	
                        <!--  다음 버튼 : 현재 section번호가 전체 section 번호 보다 작은 경우만 표시-->
                      	<c:if test="${section < totSection}">
	                      <li class="page-item">
	                        <a class="page-link" href="${ctxPath}/order/users/manager.do?pageBlock=${section+1}&pageNum=1"><span aria-hidden="true">&raquo;</span></a>
	                      </li>
                      	</c:if>
                    </ul>
                </nav>
              </c:if>
                
                
               
            </div>
          
          
  
  
  
  
  
  

      
      
       
  
  </div>


</main>

<footer></footer>


</body>
<script type="text/javascript">
  	var code ;
  
  	
  	
  	$(function () {
  		
  	//$('#btn1').hide();
  		$('#btn2').hide();
  		$('#btn3').hide();
  		
  		$('#id_btn').click(function () {
  			$('#btn1').show();
  			$('#btn2').hide();
  			$('#btn3').hide();
  	  		
  			
		})
  		$('#name_btn').click(function () {
  			$('#btn1').hide();
  	  		$('#btn2').show();
  	  		$('#btn3').hide();
  			
		})
		$('#email_btn').click(function () {
  			$('#btn1').hide();
  	  		$('#btn2').hide();
  	  		$('#btn3').show();
  			
		})
  		
  		//$('#email_btn')
  		
  		$('#code2').click(function (e) {
  			
			e.preventDefault();
			code = $('#code').val()
			console.log(code)
			var path = $('#path').val()
			
			if($('#code').val().length > 0){
				
			 //location.href= "${ctxPath}/view.do?id="+code;
			 location.href=path+"/order/users/manager_list.do?user_id="+code;
			}
			
		}) // 아이디 검색 
  		
		$('#code3').click(function (e) {
			e.preventDefault();
			code = $('#code02').val()
			console.log(code)
			var path = $('#path').val()
			
			if($('#code02').val().length > 0){
				
			 //location.href= "${ctxPath}/view.do?id="+code;
			 location.href=path+"/order/users/manager_list.do?user_name="+code;
			}
			
		}) // 이름 검색 
		
		$('#code4').click(function (e) {
			e.preventDefault();
			code = $('#code03').val()
			console.log(code)
			var path = $('#path').val()
			
			if($('#code03').val().length > 0){
				
			 //location.href= "${ctxPath}/view.do?id="+code;
			 location.href=path+"/order/users/manager_list.do?user_email="+code;
			}
		}) // 이메일 검색 
		
		
		
	})
  
  
  </script>

</html>