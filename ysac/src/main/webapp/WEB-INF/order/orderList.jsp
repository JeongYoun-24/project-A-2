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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!--부트 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <style>
        div {
            font-family: 'Noto Sans KR', sans-serif;
        }
    
        ul,
        ol,
        li {
            list-style: none;
        }
    
        a {
            text-decoration: none;
            color: #111;
        }
        div >.order{
        background-color: #f2f2f2;
        
      }
      div >.nav-link{
        color: #000000;

      }
      .groove{ border:5px groove; margin: 10px; }
      
    </style>
  </head>

  <body>
    <header>

    <!--배너-->
    <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59"
        style="background: #000000 ;">
        <a href="#none"><span style="color: #ffffff; " class="d-flex justify-content-center">신규회원 무료배송 + 1만원
                쿠폰팩</span></a>
    </div>


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
							    	<div class="mx-3 login">
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
        
        
   </div>
</header>
 
<main>
     <div class="container"> 
            <form action="#" method="#">
                <!--주문조회 헤드부분-->
               <div class="row">
                        <div class= "col-10 mt-5">
                            <h5>주문조회</h5>
                        </div>
                    
                    <div class="col-2 p-2 mt-5">
                        <div class="d-flex align-content-end"> 
                            <i class="bi bi-house-door-fill"></i>
                                <i class="bi bi-chevron-compact-right"></i>
                                    <a href="#"><span style="font-size: 15px; color:darkgray">마이쇼핑</span></a>
                                    <i class="bi bi-chevron-compact-right"></i>
                                    <a href="#"> <span style="font-size: 15px;">주문조회</span></a>
                              </div>
                    </div>
               </div>

                            <!--주문조회 네비바-->
                        
                    <div class="col">
                        <div class="container">
                          <nav>
                             <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
                                    role="tab" aria-controls="nav-home" aria-selected="true"><a href="#">주문내역조회(0)</a></button>
                                    <button class="nav-link " id="nav-home-tab2" data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
                                            role="tab" aria-controls="nav-home" aria-selected="false"><a href="#">취소/반품/교환내역(0)</a></button>
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                                        </div>
                                    </div>
                              </div>
                         </nav>
                        </div>
                    </div>
                                
                                <!--주문조회 기간 설정-->
                   <div class="box">
                     <div class="groove">
                         <div class="row">
                                <div class="col-2 m-3 p-1 d-flex justify-content-center">
                                    <form action="#">
                                        <select id="order_menu" name="order_menu" class="Select text-center" style="width: 200px; height:30px;font-size: 14px;color:#111 ;">
                                                <option value="입금전">전체주문처리상태</option>
                                                <option value="입금전">입금전</option>
                                                <option value="php">배송시작(취소/교환불가)</option>
                                                <option value="java">배송중</option>
                                                <option value="golang">배송완료</option>
                                                <option value="python">취소</option>
                                                <option value="c#">교환</option>
                                                <option value="C++">반품</option>
                                        </select>
                                    </form>
                                </div>
                                
                                    
                                                                            
                                    <div class="col-2 m-3 p-1">
                                            <a href="#"><img src="img2/btn_date1.gif" alt=""> </a></li>
                                            <a href="#"><img src="img2/btn_date2.gif" alt=""> </a></li>
                                            <a href="#"><img src="img2/btn_date3.gif" alt=""> </a></li>
                                            <a href="#"><img src="img2/btn_date4.gif" alt=""> </a></li>
                                            <a href="#"><img src="img2/btn_date5.gif" alt=""> </a></li>
                                    </div>
                                        <div class="col-3 m-3 d-flex justify-content-start">
                                                <p>
                                                <input type="date" value="2023-03-31" min="2023-01-01"  max="2023-12-31">
                                                <input type="date" value="2023-06-29" min="2023-01-01" max="2023-12-31">
                                                </p>
                                        </div> 
                                                <div class="col-1 m-3 float-lg-start">
                                                    <button type="button" class="btn btn-secondary btn-sm" href="#">조회</button>
                                                </div>
                         </div>
                     </div>
                </div>
                   <div class="text m-2">
                    <span style="font-size: 12px; color: #b7b7b8;">*기본적으로 최근3개월간의 자료가 조회되며,기간검색시 지난주문내역을 조회히실수 있습니다.</span><br>
                    <span style="font-size: 12px; color: #b7b7b8;">*주문번호를 클릭하시면 해당 주문에 대한 상세내역을 획인하실 수 있습니다.</span>
                   </div>
        </form>
    </div>
   


   <!--주문 상품 정보-->
        <div class="container">
            <div class="title m-2 p-1 mt-5">
                 <span style="font-size: 15px;">주문상품정보</span>
            </div>
               
             <table class= "table table-bordered">
                     <thead>
                         <tr>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">주문일자<br>[주문정보]</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">이미지</p></th>
                              <th scope="col" width="40%"><p style="font-size: 13px;" class="text-center">상품정보</p></th>
                              <th scope="col"width="5%"><p style="font-size: 13px;" class="text-center">수량</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">상품구매금액</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">주문처리상태</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">취소/교환/반품</p></th>

                          </tr>
                     </thead>
                        
                        <tbody> 
                            <tr>
                               <td colspan="7"style="height:100px;"> <span style="font-size: 13px;"class="d-flex justify-content-center p-5">주문내역이없습니다.</span></td>
                            </tr>    
                        </tbody>
             </table>
                    <div></div>



                    <div classs="container d-flex justify-content-center">
                         <hr style= "border: solid 3px #000;" class="mt-5">
                             <div class="row">
                                <div class="col">
                                    <img src="img2/forment_info_web@3x.jpg"style="width:100%; height="auto;">
                                </div>
                            </div>
                    </div>
      </div>
            
 </main>
                        
            
            
            
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
        </div>
    </footer>
            
        </body>
        </html>