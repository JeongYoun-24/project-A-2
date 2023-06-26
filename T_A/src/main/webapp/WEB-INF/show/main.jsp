<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
<style>


        a{
            text-decoration: none;
            color: black;
        }
        .img1 img{
           width: 286px;
           height: 300px;
        }
    .box1 img{
      width: 200px;
      height: 200px;
    }
    .TE div{
      font-size: 14px;
    }

</style>

</head>
<body>
    
<header class="">
    <div class="">
        <div>
          <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFLcEXAvNiQ7Jb7kkhT8hnS_i3AZCBpdPH4w&usqp=CAU" style="width: 100px;" alt="">
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">모델</a>
                  </li>
                  <li class="nav-item">
                   <a class="nav-link active" aria-current="page" href="#" >6시 핫딜</a>
                  </li>
                  <li class="nav-item">
                    <button class="btn nav-link  nav-item" type="button" data-bs-toggle="collapse" data-bs-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">추천</button>
                  </li>
                  

                  <li class="nav-item">
                    <a class="nav-link" href="#">더 알아보기</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      종류
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">긴팔</a></li>
                      <li><a class="dropdown-item" href="#">반팔</a></li>
                      <li><a class="dropdown-item">반바지</a></li>
                      <li><a class="dropdown-item" href="#">긴바지</a></li>
                    </ul>
                  </li>
                 <c:choose>
                 	<c:when test="${manager!=null}">
	                 	<li class="nav-item">
	                    	<a href="#" class="nav-link ">공지사항</a>
                  		</li>
                 	</c:when>
                 	
                 	<c:otherwise>
                 		<li class="nav-item">
                    		<a href="#" class="nav-link ">공지사항</a>
                  		</li>
                 	
                 	</c:otherwise>
                 
                 </c:choose>
                 
                  <div>
                    
                  </div>
                  
                </ul>
            </div>
           <div>
           		
           </div>
            
            <div class="d-flex mx-5 mt-1" id="log1">
              <input type="text" class="form-control mx-2 mt-1" v-on:props="gogo" v-model="goin" id="ob" style="height: 30px;" >
              <button class="rounded border  mt-1" id="gobtn" value="goin" style="width: 70px; height: 30px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
              </svg></button>
            </div>


                <div>
                	<c:if test="${loginInfo==null}">
                
				                <div class="mx-5 login">
				                    <a href="${ctxPath}/order/login.do">LOGIN</a>
				                    <a  href="/mod2html/salogin.html" class="mx-4"><svg  xmlns="http://www.w3.org/2000/svg" width="30" height="22" fill="currentColor" class="bi bi-person" viewBox="0 0 16 14">
				                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
				                      </svg></a>
				                    <a id="loginBtn" href="" data-bs-toggle="modal" data-bs-target="#exampleModal"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="20" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
				                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				                      </svg></a>
				                </div>
				    </c:if>
							    <c:if test="${loginInfo!=null }">
							    	<div class="mx-5 login">
							    	${loginInfo}님 방갑습니다.
							    	<a href="${ctxPath}/order/logout.do">로그아웃</a>
				                    <a  href="#" class="mx-4"><svg  xmlns="http://www.w3.org/2000/svg" width="30" height="22" fill="currentColor" class="bi bi-person" viewBox="0 0 16 14">
				                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
				                      </svg></a>
									<!--  <a id="" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="20" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
				                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				                      </svg></a> -->
				                       <a id="" href="#"  data-bs-target="#exampleModal"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="20" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
				                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				                      </svg></a>
				                      장바구니
				                </div>
							    
							    </c:if>
							    
						<c:if test="${manager!=null}">
           					${manager}님 으로 로그인중입니다.
           					<a href="${ctxPath}/order/logout.do">로그아웃</a>
           				</c:if>
							    
							    
				    
                    <div>
                        
                    </div>
                </div>
                <!-- <form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
                  <button class="btn btn-outline-primary" style="width: 70px;" type="submit">검색</button>
                </form> -->
                
              </div>
            </div>
          </nav>
              
        </div>
        <div>
                

        </div>


    </div>
    <div>
      
    </div>
    

    <div class="row">
      
      <div class="col">
        <div class="collapse multi-collapse" id="multiCollapseExample2">
          <div class="d-flex justify-content-center">오늘의 추천</div>
          <div class="card card-body box1" >

            <div class="col row p-3 m-3">
              <div class="card col-3" style="width: 18rem;">
                  <img src="https://nimg.lfmall.co.kr/file/product/prd/D8MW/2023/320/D8MWXX00591_01.jpg?1684462690000" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">IOLO</h5>
                    <p class="card-text">쿨 린넨 하프 크루넥_민트</p>
                    <p>￦149000</p>
                    <a href="#" class="btn btn-outline-dark">더알아보기</a>
                  </div>
              </div>
              <div class="card col-3" style="width: 18rem;">
                <img src="https://nimg.lfmall.co.kr/file/product/prd/EEQW/XXXX/320/EEQWXX00066_01.jpg?1684478448000" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">CHANEL</h5>
                  <p class="card-text">[판매자샵-중고명품] 샤넬 AP2183 램스킨 블랙 레더 CC 금장 로고 퀄팅패턴 라지 클러치</p>
                  <p>￦1790000</p>
                  <a href="#" class="btn btn-outline-dark">더알아보기</a>
                </div>
              </div>
              <div class="card col-3" style="width: 18rem;">
                <img src="https://nimg.lfmall.co.kr/file/product/prd/CU95/XXXX/1500/CU95XX04351_00.jpg?2023-05-01T08:12:38.000+09:00" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">발렌티노</h5>
                  <p class="card-text">[중고명품] [구구스]중고명품 발렌티노 스니커즈(NO 9020598)/p>
                  <p>￦349000</p>
                  <a href="#" class="btn btn-outline-dark">더알아보기</a>
                </div>
              </div>
              <div class="card col-3" style="width: 18rem;">
                <img src="https://nimg.lfmall.co.kr/file/product/prd/U027/2023/320/U027XX00516_01.jpg?1685110082000" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">GUCCL</h5>
                  <p class="card-text">구찌 쥬얼리 YBC455248001 455248 BLIND FOR LOVE 반지</p>
                  <p>￦322000</p>
                  <a href="#" class="btn btn-outline-dark">더알아보기</a>
                </div>
              </div>
              <div class="card col-3" style="width: 18rem;">
                <img src="https://nimg.lfmall.co.kr/file/product/prd/DBG3/2020/320/DBG3XX00033_00.jpg?1684456193000" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">SONY</h5>
                  <p class="card-text">소니 블루투스 노이즈캔슬링 무선 헤드폰 WH-1000XM4 헤드셋</p>
                  <p>￦35200</p>
                  <a href="#" class="btn btn-outline-dark">더알아보기</a>
                </div>
              </div>
              <div class="card col-3" style="width: 18rem;">
                <img src="https://nimg.lfmall.co.kr/file/product/prd/DM/2023/320/DMPA3B301BK_01.jpg?1684487470000" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">DAKS MEN</h5>
                  <p class="card-text">[23SS] [Active Pants] 기능성 링클프리 블랙 경량 슬랙스</p>
                  <p>￦128900</p>
                  <a href="#" class="btn btn-outline-dark">더알아보기</a>
                </div>
              </div>


            </div>
                 

          </div>
        </div>
      </div>


    </div>





</header>

<main>
${loginInfo}
    <div class=" ">
        <div>
            <div id="carouselExampleCaptions" class="carousel slide " >
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href=""><img id="bgimg01" src="https://img.lfmall.co.kr/v2/real/origin/card/2023/5/1685085625719.jpg" class="d-block w-100" alt=""></a>
                      <div class="carousel-caption d-none d-md-block">
                        <h5>First slide label</h5>
                        <p>Some representative placeholder content for the first slide.</p>
                      </div>
                    </div>
                    <div class="carousel-item">
                        <a href=""><img id="bgimg02" src="https://img.lfmall.co.kr/v2/real/origin/card/2023/5/1684991585095.jpg" class="d-block w-100" alt=""></a>
                      <div class="carousel-caption d-none d-md-block">
                        <h5>Second slide label</h5>
                        <p>Some representative placeholder content for the second slide.</p>
                      </div>
                    </div>
                    <div class="carousel-item">
                        <a href=""><img id="bgimg03" src="https://img.lfmall.co.kr/v2/real/origin/card/2023/5/1684991477675.jpg" class="d-block w-100" alt=""></a>
                        <div class="carousel-caption d-none d-md-block">
                          <h5>Third slide label</h5>
                          <p>Some representative placeholder content for the third slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <a href=""><img id="bgimg04" src="https://img.lfmall.co.kr/v2/real/origin/card/2023/5/1684995599380.jpg" class="d-block w-100" alt=""></a>
                        <div class="carousel-caption d-none d-md-block">
                          <h5>stop</h5>
                          <p>올 여름은 슈즈 와 함께</p>
                        </div>
                      </div>
                      <div class="carousel-item">
                        <a href=""><img id="bgimg05" src="https://img.lfmall.co.kr/v2/real/origin/card/2023/5/1684995643193.jpg" class="d-block w-100" alt=""></a>
                        <div class="carousel-caption d-none d-md-block">
                          <h5>Third slide label</h5>
                          <p>Some representative placeholder content for the third slide.</p>
                        </div>
                      </div>


                  </div>
                  <div class="" id="text1">

                  </div>

                <button  class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">뒤</span>
                </button>
                <button id="gg" class="carousel-control-next"  type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">앞</span>
                </button>
            </div>

        </div>

    </div>

    <div>
        <div>
            <div class="container text-center mt-5">
              <div>
                 <div class="text-center position-sticky top-0 ">
                    <h4>Best Pick</h4>
                 </div>
                 <div>
                  <ul class="nav justify-content-center">
                    <li class="nav-item">
                      <button id="BestBtn1" class="btn">전체</button>
                    </li>
                    <li class="nav-item">
                      <button id="BestBtn2"  class="btn">여성</button>
                    </li>
                    <li class="nav-item">
                      <button id="BestBtn3" class="btn">남성</button>
                    </li>
                    <li class="nav-item">
                      <button id="BestBtn4"  class="btn">스포츠</button>
                    </li>
                    <li class="nav-item">
                      <button id="BestBtn5" class="btn">명품</button>
                    </li>
                    <li class="nav-item">
                      <button id="BestBtn6"  class="btn">키즈</button>
                    </li>
                  </ul>

                 </div>

              </div>
              <!-- 전체 사진 -->
              <div class="" id="Best1">
                <div class="row img1">
                    <div class="col">
                      <a href=""><img id="img01" src="https://nimg.lfmall.co.kr/file/product/prd/E3P2/2023/320/E3P2XX00124_00.jpg?1684827511000" alt=""></a>
                      <a href=""><img id="img00"  src="https://nimg.lfmall.co.kr/file/product/prd/B00O/2023/320/EPTS3E003IV_01.jpg?1684914678000" alt=""></a>
                    </div>
                    <div class="col">
                      <div class="card" style="width: 18rem;">
                          <img src="https://nimg.lfmall.co.kr/file/product/prd/D8MW/2023/320/D8MWXX00591_01.jpg?1684462690000" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">IOLO</h5>
                            <p class="card-text">쿨 린넨 하프 크루넥_민트</p>
                            <p>￦149000</p>
                            <a href="#" class="btn btn-outline-dark">더알아보기</a>
                          </div>
                        </div>
                  </div>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                           <a href="/mod2html/sang.html"> 
                            <img id="img02" src="https://nimg.lfmall.co.kr/file/product/prd/B00L/2023/320/DWTS3B313IV_01.jpg?1683880372000" class="card-img-top" alt="...">
                            <img id="img_02" src="https://nimg.lfmall.co.kr/file/product/prd/B00L/2023/640/DWTS3B313IV_00.jpg?2023-05-12T17:32:52.000+09:00" class="card-img-top" alt="">
                          </a>
                            <!-- <img id="img_02" src="https://nimg.lfmall.co.kr/file/product/prd/ECZW/2023/320/ECZWXX00560_00.jpg?1680750397000" class="card-img-top" alt="..."> -->
                            
                            <div class="card-body">
                              <h5 class="card-title">OUTDOOR PRODUCTS</h5>
                              <p class="card-text">스몰 로고 티셔츠 SMALL LOGO T-SHIRT / WO136RCSSZ01GN</p>
                              <P>￦39900</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img id="img03" src="https://nimg.lfmall.co.kr/file/product/prd/D8A0/2023/320/D8A0XX02238_01.jpg?1684386092000" class="card-img-top" alt="...">
                            <!-- <img id="img_03" src="https://nimg.lfmall.co.kr/file/product/prd/D8A0/2023/320/D8A0XX02238_01.jpg?1684386092000" class="card-img-top" alt="..."> -->
                            
                            <div class="card-body">
                              <h5 class="card-title">BRENTWOOD</h5>
                              <p class="card-text">[비즈브리즈] 써머비즈 경량 자켓_BRUAM23711BEX</p>
                              <P>￦196000</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    
                </div>
                <div class="row img1 mt-5">
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img id="img04" src="https://nimg.lfmall.co.kr/file/product/prd/C006/2023/320/VCTS3E900BK_01.jpg?1674720079000" class="card-img-top" alt="...">
                            <!-- <img id="img_04" src="https://nimg.lfmall.co.kr/file/product/prd/C006/2023/320/VCTS3E900BK_01.jpg?1674720079000" class="card-img-top" alt="..."> -->
                            
                            <div class="card-body">
                              <h5 class="card-title">VINCE WOMEN</h5>
                              <p class="card-text">[23SS] [100% 피마 면] 블랙 단색 면 5부소매티셔츠</p>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img id="img05" src="https://nimg.lfmall.co.kr/file/product/prd/D8A0/2023/320/D8A0XX02100_01.jpg?1680672465000" class="card-img-top" alt="...">
                            <!-- <img id="img_05" src="https://nimg.lfmall.co.kr/file/product/prd/D8A0/2023/320/D8A0XX02100_01.jpg?1680672465000" class="card-img-top" alt="..."> -->
                            
                            <div class="card-body">
                              <h5 class="card-title">BRENTWOOD</h5>
                              <p class="card-text">[워셔블] 마이크로 조직 폴리 써커 자켓_BRJCM23415BUX</p>
                              <P>￦217000</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img id="img06" src="https://nimg.lfmall.co.kr/file/product/prd/EDBN/2023/320/EDBNXX00163_01.jpg?1685412324000" class="card-img-top" alt="...">
                            <img id="img_06" src="https://nimg.lfmall.co.kr/file/product/prd/EDBN/2023/640/EDBNXX00163_00.jpg?2023-06-02T11:33:26.000+09:00" class="card-img-top" alt="...">
                            
                            <div class="card-body">
                              <h5 class="card-title">MONGDOL</h5>
                              <p class="card-text">[썸머데님] 린넨라이크 스트레이트 화이트 코튼팬츠 MDPT032WHITE</p>
                              <P>￦75000</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img id="img07" src="https://nimg.lfmall.co.kr/file/product/prd/B00O/2023/320/EPSH3E012WT_01.jpg?1684916435000" class="card-img-top" alt="...">
                            <img id="img_07" src="https://nimg.lfmall.co.kr/file/product/prd/B00O/2023/640/EPSH3E012WT_00.jpg?2023-05-24T17:20:35.000+09:00" class="card-img-top" alt="...">
                            
                            <div class="card-body">
                              <h5 class="card-title">스탠다이얼</h5>
                              <p class="card-text">[23SS] [LF몰단독]Trimming Pocket Shirt_WHITE</p>
                              <P>￦55000</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    
                  </div>
                  <div class="row img1 mt-5">
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img id="img08" src="https://nimg.lfmall.co.kr/file/product/prd/EDBN/2023/320/EDBNXX00109_01.jpg?1681201423000" class="card-img-top" alt="...">
                            <!-- <img id="img_07" src="https://nimg.lfmall.co.kr/file/product/prd/EDBN/2023/320/EDBNXX00109_01.jpg?1681201423000" class="card-img-top" alt="..."> -->
                            
                            <div class="card-body">
                              <h5 class="card-title">MONGDOL</h5>
                              <p class="card-text">벨티드 원턱 버뮤다팬츠 블랙 MDPT028BLACK</p>
                              <P>￦67900</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img id="img09" src="https://nimg.lfmall.co.kr/file/product/prd/E5NM/2023/320/E5NMXX00458_01.jpg?1678246270000" class="card-img-top" alt="...">
                            <img id="img_09"   src="https://nimg.lfmall.co.kr/file/product/prd/E5NM/2023/640/E5NMXX00458_00.jpg?2023-03-08T12:31:10.000+09:00" alt="">
                            <div class="card-body">
                              <h5 class="card-title">페이퍼보이</h5>
                              <p class="card-text">[SET] 비기닝83 반팔 & 하프팬츠 셋업</p>
                              <P>￦39900</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img id="img10"  src="https://nimg.lfmall.co.kr/file/product/prd/MA/2023/320/MAPA3B905BK_01.jpg?1684902888000" class="card-img-top" alt="...">
                            <img id="img_10"  src="https://nimg.lfmall.co.kr/file/product/prd/DM/2023/640/DMPA3B301BK_03.jpg?2023-05-19T18:11:10.000+09:00" alt="">
                            <div class="card-body">
                              <h5 class="card-title">MAESTRO MEN</h5>
                              <p class="card-text">[23SS] [LF몰단독][타임리스][AIR경량] 썸머 블랙 울 팬츠</p>
                              <P>￦104900</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img src="https://nimg.lfmall.co.kr/file/product/prd/EEJ5/2023/320/EEJ5XX00195_00.jpg?1682415233000" class="card-img-top" alt="...">
                            
                            <div class="card-body">
                              <h5 class="card-title">TILLIDIE</h5>
                              <p class="card-text">Shirring point stripe blouse_Pink</p>
                              <P>￦68900</P>
                              <a href="#" class="btn btn-outline-dark">더알아보기</a>
                            </div>
                          </div>
                    </div>
                    
                  </div>
              </div>   <!--전체사진  -->
              



            </div>     

        </div>

    </div>


<!-- 모달  -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">로그인 페이지 이동 </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        로그인 후 사용 가능한 서비스입니다.
      </div>
      <div class="modal-footer">
        <button id="moBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">로그인 페이지 이동</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>

</main>
<hr>
<footer class="mt-5 d">
  <div class="d-flex justify-content-center">
    <img src="/mode/modeHTML/img1/1234.PNG" alt="">
  </div>
    <div class="container d-flex">
      <div class="p-3 ">
        <div>
            <label for="">고객서비스 센터</label>
        </div>
        <div>
            <label for=""><h4 style="text-shadow: 1px 1px ;">1544-1111(유료)</h4></label>
        </div>
        <div>
            <label for=""><h6 style="font-size: 12px;">상담시간 : 월~금 9:00~18:00(주말,공유일 휴무)</h6></label>
        </div>
        <div class="row mt-3">
          <a class="col-6" href="" style="font-size: 14px;">1:1상담</a>
          <a class="col-6" href="" style="font-size: 14px;">고객제안</a>
        </div>
      </div> 

      <div class="p-3 TE border" style="width: 300px;">
        <div class="">
          <label for="">CUSTOMER SERVICE</label>
        </div>
        <div class="mt-2">회원가입</div>
        <div class="mt-2">배송/교환/반품</div>
        <div class="mt-2" >1:1상담</div>
      
      </div>

      <div class="p-3" style="width: 300px;">
        <div><label for="" >NEWS (고객 공지사항)</label></div>
        <div><a href="#">[공지]</a></div>
        <div><a href="#">[공지]</a></div>
        <div><a href="#">[공지]</a></div>
        <div><a href="#">[공지]</a></div>
      </div>  

      <div>
        <div>
          <div class="dropdown">
            <a class="btn btn-light border" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              FAMILY SITE
            </a>
          
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </div>
        </div>


      </div> 

   
    </div><!--container"  -->

</footer>
</body>
<script>
  new Vue({
      el : 'log1',

  })
  $('').hover(function(){

},function(){

  
})
$(function(){
  $('#carouselExampleCaptions').mouseover(function(){
    
    setTimeout(function(){
      $("#gg").trigger("click");

  },2000)

  })

})





$('#img01').hover(function(){// 첫번째 사진 이벤트 ----
  setTimeout(function(){
    $('#img01').hide()
		$("#img00").show()

  },500),
  setTimeout(function(){
    $('#img00').hide()
		$("#img01").show()

  },100)
  

})
$('#img00').hover(function(){
  setTimeout(function(){
    $('#img00').hide()
		$("#img01").show()

  },500),
  setTimeout(function(){
    $('#img01').hide()
		$("#img00").show()

  },100)
  

}) // 첫번째 사진 이벤트 ----
$('#img02').hover(function(){// 두번째 사진 이벤트 ----
  setTimeout(function(){
    $('#img02').hide()
		$("#img_02").show()

  },500),
  setTimeout(function(){
    $('#img_02').hide()
		$("#img02").show()

  },100)
  

})
$('#img_02').hover(function(){
  setTimeout(function(){
    $('#img_02').hide()
		$("#img02").show()

  },500),
  setTimeout(function(){
    $('#img02').hide()
		$("#img_02").show()

  },100)
  

}) // 두번째 사진 이벤트 ----


$('#img06').hover(function(){// 6번째 사진 
  setTimeout(function(){
    $('#img06').hide()
		$("#img_06").show()

  },500),
  setTimeout(function(){
    $('#img_06').hide()
		$("#img06").show()

  },100)

})
$('#img_06').hover(function(){
  setTimeout(function(){
    $('#img_06').hide()
		$("#img06").show()

  },500),
  setTimeout(function(){
    $('#img06').hide()
		$("#img_06").show()

  },100)

})// 6번째 사진 
$('#img07').hover(function(){// 7번째 사진 
  setTimeout(function(){
    $('#img07').hide()
		$("#img_07").show()

  },500),
  setTimeout(function(){
    $('#img_07').hide()
		$("#img07").show()

  },100)

})
$('#img_07').hover(function(){
  setTimeout(function(){
    $('#img_07').hide()
		$("#img07").show()

  },500),
  setTimeout(function(){
    $('#img07').hide()
		$("#img_07").show()

  },100)

})// 8번째 사진 
$('#img09').hover(function(){// 9번째 사진 
  setTimeout(function(){
    $('#img09').hide()
		$("#img_09").show()

  },500),
  setTimeout(function(){
    $('#img_09').hide()
		$("#img09").show()

  },100)

})
$('#img_09').hover(function(){
  setTimeout(function(){
    $('#img_09').hide()
		$("#img09").show()

  },500),
  setTimeout(function(){
    $('#img09').hide()
		$("#img_09").show()

  },100)

})// 9번째 사진 
$('#img10').hover(function(){// 10번째 사진 
  setTimeout(function(){
    $('#img10').hide()
		$("#img_10").show()

  },500),
  setTimeout(function(){
    $('#img_10').hide()
		$("#img10").show()

  },100)

})
$('#img_10').hover(function(){
  setTimeout(function(){
    $('#img_10').hide()
		$("#img10").show()

  },500),
  setTimeout(function(){
    $('#img10').hide()
		$("#img_10").show()

  },100)

})// 10번째 사진 




$(function(){// 이미지 더미
  $('#img00').hide()
  $('#img_02').hide()
  $('#img_06').hide()
  $('#img_07').hide()
  $('#img_09').hide()
  $('#img_10').hide()



})
$(function(){
  // $('#Best1').hide()

$("#BestBtn1").click(function(){
  $('#Best1').show()
  $('#Best2').hide()
  $('#Best3').hide()
  $('#Best4').hide()
  $('#Best5').hide()
  $('#Best6').hide()
  
})


})




$(function(){
  $('#loginBtn').click(function(){
    alert("로그인후 이용가능합니다.")
    location.href="${ctxPath}/order/login.do"
  })

  $('#img1').on({
    mouseover : function(){

      $("#text1").append("dddd")
      $(this).prev().toggle() 
      $(this).next().toggle()
    }

  })


})





</script>




</html>