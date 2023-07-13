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
	<div>
		 <div >  
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                  <div class="container-fluid">
                    <a class="navbar-brand" href="#">회원정보</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                          <a  href="${ctxPath}/orcle/main.do" class="nav-link active" aria-current="page">메인</a>
                        </li>
                       
                        <li class="nav-item">
                          <a class="nav-link" href="#">공지사항</a>
                        </li>
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                          </a>
                          <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">글쓰기</a></li>
                            <li><a class="dropdown-item" href="#">글 페이지 </a></li>
                            
                            <li><a class="dropdown-item" href="#">동영상</a></li>
                          </ul>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link disabled">Disabled</a>
                        </li>
                      </ul>
                      <div>
                  <div>
				 	<nav class="navbar navbar-expand-lg bg-body-tertiary">
				  
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
				</div>
                          
                      </div>
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
                </nav>
          </div>
		 
		 
	</div>


	<div class="conteniner">
 		
 		
 		
 		<div class="container">
 				<div>
          
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th scope="col">회원 번호</th>
                        <th scope="col">아이디</th>
                        <th scope="col">비밀번호</th>
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
                        <td>${article.id}</td>
                        
                        
                        <td>
                        	<%-- <c:choose>
	                        	<c:when test="${article.level > 1 }">
	                        		<c:forEach begin="1" end="${article.level}" step="1">
		                        		<span style="padding-left:20px"></span>
		                        	</c:forEach>
		                        	
		                        	
		                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
								  </svg>
	                        	</c:when>
                        	</c:choose> --%>
							<a href="${ctxPath}/orcle/viewArticle.do" class="link-body-emphasis link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover">${article.pwd}</a>
                        	
                        </td>
                        <td>${article.name}</td>
                        <td>${article.email}</td>
                        <td>${article.joinDate}</td>
                        
                      </tr>
                      
                    </c:forEach>
					<tr>
                        <td colspan="4">
                            페이징
                        </td>
                      </tr>
                       
                    </tbody>
                  </table>


                  <div class="w-75 m-auto d-flex justify-content-between">
                  <c:if test="${totArticles != null}">
                  
				  <nav aria-label="...">
					<ul class="pagination">
					
					<c:choose>
					
				  
					<c:when test="${totArticles >= 100}">
						<c:forEach var="page" begin="1" end="10" step="1" varStatus = "loop">
						
					 <c:if test="${section > 1 && page == 1 }">
					 
						 <li class="page-item ">
							 <a class="page-link" href="${ctxPath}/orcle/boardList.do?pageBlock=${section-1}&pageNum=${(section-1)*10+1}" aria-label="Previous">
	                                  <span aria-hidden="true">&laquo;</span>
	                                </a> 
	                     </li>
					  </c:if> 
					  <c:choose>
							   <%-- 링크한 페이지가 현재 페이지 일 경우 스타일 적용 --%>
							   
							   <c:when test="${page == pageNum }">
							 <li class="page-item active aria-current="page">
								<a class="page-link" href="${ctxPath}/List.do?pageBlock=${section}&pageNum=${page}"> ${(section-1)*10 + page}</a>
							  </li>
							  </c:when>
							  <c:otherwise>
							  
								 <li class="page-item" >
									<a class="page-link" href="${ctxPath}/List.do?pageBlock=${section}&pageNum=${page}"> ${(section-1)*10 + page}</a>
								  </li>
							  </c:otherwise>
						   
						  </c:choose>
					 
						  <c:if test="${page == 10}">
						  
							   <li class="page-item">
                                <a class="page-link" href="${ctxPath}/List.do?pageBlock=${section+1}&pageNum=${(section)*1}" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
						  </c:if>
						  
						  </c:forEach>	  
							
					  </c:when>
					  
					  
					  <%-- 등록된 게시글 개수가 100인 경우 --%>
					  <c:when test="${totArticles == 100 }">
							  <c:forEach var="page" begin="1" end="10" step="1" varStatus = "loop">
									<li class="page-item ">
									<a class="page-link" href="${ctxPath}/orcle/boardList.do?pageBlock=${section}&pageNum=${page}"> ${page}</a>
								  </li>
					   
							  </c:forEach>
							  
					  </c:when>
					   <%-- 등록된 게시글 개수가 100보다 작은 경우 --%>
					   
					   <c:when test="${totArticles < 100 }">
							   <c:forEach var="page" begin="1" end="${totArticles/10+1 }" step="1" varStatus = "loop">
							   <c:choose>
							   <%-- 링크한 페이지가 현재 페이지 일 경우 스타일 적용 --%>
							   
								   <c:when test="${page == pageNum }">
										<li class="page-item disabled">
										<a class="page-link" href="${ctxPath}/list.do?pageBlock=${section}&pageNum=${page}"> ${page}</a>
									 </li>
								   </c:when>
								   
								   <c:otherwise>
									   <li class="page-item ">
										<a class="page-link" href="${ctxPath}/list.do?pageBlock=${section}&pageNum=${page}"> ${page}</a>
									 </li>
								   
								   </c:otherwise>
							   </c:choose>
								  
								 
							  </c:forEach>
							  
					   </c:when>
					  
					 </c:choose>
					  
					</ul>
				</nav>
                    </c:if>
                    
                   
                  </div>
		</div>
 				
 			<div>
 			
 			
 			</div>
 		
 		
 		</div>
 				
 		       
          
          
  
  
  
  
  
  
 <!--
  
  <div class="main">
      <div class="container ">
    <h2 align="center" class="mt-3 p-3 border rounded-2">회원 목록</h2>
          <div class="d-flex justify-content-end p-3">
              <a href="${ctxPath}/addForm.do" class="link- link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원가입</a>
          </div>
          <div >  
              <nav class="navbar navbar-expand-lg bg-body-tertiary">
                  <div class="container-fluid">
                    <a class="navbar-brand" href="#">회원정보</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                          <a  href="${ctxPath}/orcle/main.do" class="nav-link active" aria-current="page">메인</a>
                        </li>
                       
                        <li class="nav-item">
                          <a class="nav-link" href="#">공지사항</a>
                        </li>
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                          </a>
                          <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">글쓰기</a></li>
                            <li><a class="dropdown-item" href="#">글 페이지 </a></li>
                            
                            <li><a class="dropdown-item" href="#">동영상</a></li>
                          </ul>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link disabled">Disabled</a>
                        </li>
                      </ul>
                      <div>
                  <div>
				 	<nav class="navbar navbar-expand-lg bg-body-tertiary">
				  
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
				</div>
                          
                      </div>
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
                </nav>
          </div>
  
 <!-- <div>
 	<nav class="navbar navbar-expand-lg bg-body-tertiary">
  
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
</div> 
  
  
  
  
  
  
          <table class="table mt-3 w-75 m-auto">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">아이디</th>
                  <th scope="col">비밀번호</th>
                  <th scope="col">이름</th>
                  <th scope="col">이메일</th>
                  <th scope="col">가입일자</th>
                </tr>
              </thead>
              <tbody>
              <c:choose>
                <c:when test="${memberList.size() == 0 || memberList == null}">
                  <tr>
                    <td colspan="6">1</td>
                  </tr>
                </c:when>
                <c:when test="${memberList!=null}">
                    <c:forEach var="mem" items="${memberList}" varStatus="loop">                  
                  <tr>
                      <th scope="row">${loop.index+1}</th>
                      <td>${mem.recNum}</td>
                      <td>
                       <a href="${ctxPath}/view.do?id=${mem.id}"  
                          class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">${mem.id}</a>
                      </td>
                      <td><input type="password" value="${mem.pwd}"></td>
                      <td>${mem.name}</td>
                      <td>${mem.email}</td>
                      <td>${mem.joinDate}</td>
                    </tr>
                  </c:forEach>
                </c:when>
              </c:choose>
              </tbody>
            </table>
        
            
      </div>
        -->
      
      
          <div class="d-flex justify-content-center mt-5 "> 
               <c:if test="${totArticles != null}">
                  
				  <nav aria-label="...">
					<ul class="pagination">
					
					<c:choose>
					
				  
					<c:when test="${totArticles >= 100}">
						<c:forEach var="page" begin="1" end="10" step="1" varStatus = "loop">
						
					 <c:if test="${section > 1 && page == 1 }">
					 
						 <li class="page-item ">
							 <a class="page-link" href="${ctxPath}/orcle/boardList.do?pageBlock=${section-1}&pageNum=${(section-1)*10+1}" aria-label="Previous">
	                                  <span aria-hidden="true">&laquo;</span>
	                                </a> 
	                     </li>
					  </c:if> 
					  <c:choose>
							   <%-- 링크한 페이지가 현재 페이지 일 경우 스타일 적용 --%>
							   
							   <c:when test="${page == pageNum }">
							 <li class="page-item active aria-current="page">
								<a class="page-link" href="${ctxPath}/List.do?pageBlock=${section}&pageNum=${page}"> ${(section-1)*10 + page}</a>
							  </li>
							  </c:when>
							  <c:otherwise>
							  
								 <li class="page-item" >
									<a class="page-link" href="${ctxPath}/List.do?pageBlock=${section}&pageNum=${page}"> ${(section-1)*10 + page}</a>
								  </li>
							  </c:otherwise>
						   
						  </c:choose>
					 
						  <c:if test="${page == 10}">
						  
							   <li class="page-item">
                                <a class="page-link" href="${ctxPath}/List.do?pageBlock=${section+1}&pageNum=${(section)*1}" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
						  </c:if>
						  
						  </c:forEach>	  
							
					  </c:when>
					  
					  
					  <%-- 등록된 게시글 개수가 100인 경우 --%>
					  <c:when test="${totArticles == 100 }">
							  <c:forEach var="page" begin="1" end="10" step="1" varStatus = "loop">
									<li class="page-item ">
									<a class="page-link" href="${ctxPath}/orcle/boardList.do?pageBlock=${section}&pageNum=${page}"> ${page}</a>
								  </li>
					   
							  </c:forEach>
							  
					  </c:when>
					   <%-- 등록된 게시글 개수가 100보다 작은 경우 --%>
					   
					   <c:when test="${totArticles < 100 }">
							   <c:forEach var="page" begin="1" end="${totArticles/10+1 }" step="1" varStatus = "loop">
							   <c:choose>
							   <%-- 링크한 페이지가 현재 페이지 일 경우 스타일 적용 --%>
							   
								   <c:when test="${page == pageNum }">
										<li class="page-item disabled">
										<a class="page-link" href="${ctxPath}/list.do?pageBlock=${section}&pageNum=${page}"> ${page}</a>
									 </li>
								   </c:when>
								   
								   <c:otherwise>
									   <li class="page-item ">
										<a class="page-link" href="${ctxPath}/list.do?pageBlock=${section}&pageNum=${page}"> ${page}</a>
									 </li>
								   
								   </c:otherwise>
							   </c:choose>
								  
								 
							  </c:forEach>
							  
					   </c:when>
					  
					 </c:choose>
					  
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
			 location.href=path+"/idlist.do?id="+code;
			}
			
		}) // 아이디 검색 
  		
		$('#code3').click(function (e) {
			e.preventDefault();
			code = $('#code02').val()
			console.log(code)
			var path = $('#path').val()
			
			if($('#code02').val().length > 0){
				
			 //location.href= "${ctxPath}/view.do?id="+code;
			 location.href=path+"/idlist.do?name="+code;
			}
			
		}) // 이름 검색 
		
		$('#code4').click(function (e) {
			e.preventDefault();
			code = $('#code03').val()
			console.log(code)
			var path = $('#path').val()
			
			if($('#code03').val().length > 0){
				
			 //location.href= "${ctxPath}/view.do?id="+code;
			 location.href=path+"/idlist.do?email="+code;
			}
			
		}) // 이메일 검색 
		
		
		
	})
  
  
  </script>

</html>