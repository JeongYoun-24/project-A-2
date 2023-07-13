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
       
    </style>
</head>
<body>
             <!--네비바-->
             <div class="main">
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
                          <c:if test="${loginInfo!=null }">
                          <div class="col-3">
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
                          <c:if test="${loginInfo==null }">
                          
                          <div class="col-3">
                               <ul class="navbar-nav login ">
                                <li class="nav-item">
                                  <a class="nav-link " href="${ctxPath}/users/loginPage.do">LOGIN</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link" href="">JOIN</a>
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
    
    <!--상품-->    
   
    <div class="row m-3">
        <div class=" image col-6 m-auto">
<!--             <img src="https://www.theforment.com/web/product/big/202305/9a89fd2ce12405b9cc15c43e965fa378.jpg" class="img-thumbnail" alt="..."> -->
        	 <img class="w-100"  style="width: 650px" alt="" src="${ctxPath}/product_img.do?pro_img=${proList.pro_img}&product_code=${proList.product_code}">
        	<input type="hidden" value="${proList.pro_img}">
        
        </div>
        <div class="col-6">
            <div class="detail_name d-flex justify-content-between">
                <h3>${proList.pro_name}</h3>
            <div class="sns_pop">
                <img class="w-50" src="https://www.theforment.com/web/upload/images/ico_share2.png"  alt>
            
            
            </div>
            </div>
            <div class="price_wrap">
                <ul class="prdPriceInfo">
                    <!-- <li class="displaynone ploduct_sale_price">
                        <span class="prdSalePrice">49000.00</span>
                        원
                    </li> -->
                    <li class="product_price">
                        <span class="prdPrice">${proList.pro_price}</span>
                        원
                    </li>
                    <!-- <li class="product_custom">
                        <span class="prdCustom">61,500</span>
                        <span id="rate" class="rate20">20%</span>
                    </li> -->
                </ul>
                <br>
                <div class=" fragrance_info">${proList.pro_info}</div>
                <input type="hidden" id="info" value="${proList.pro_info}"> 
                <br>
               <!--  <div class="simple_desc">
                    젖은 대지 위 깊은 나무 내음의 역동적인 고요함
                    <br>
                    Global Director Perfumer. Christian Provenzano
                    <br>
                    <br>
                    카다멈과 소나무 잎의 섬세하고 정교한 허브 스파이스 노트로 비 온 뒤 축축하게 젖은 숲속의 
                    정적을 깨우며 자연의 생명력은 담은 향기를 발산합니다. 존재감있는 샌달우드의 깊은 내음이 
                    자연이 품은 경이로운 에너지와 함께 영감의 순간을 선물합니다.
                </div> -->
               <!--  <div class="additional_description_translated">
                    <div class="desc_trans_cont on">
                        <br>
                        자연으로 부터 시작되는 영감을 위한 포맨트 첫번째 컬렉션인
                        <br>
                        Natural Collection 은 신전한 영감을 통한 지친하루의 터닝포인트가
                        <br>
                        됩니다.
                        <i class="v_more">더보기</i>
                        <br>
                        <hr>
                    </div>
                </div> -->
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                          향노트
                        </button>
                      </h2>
                      <div id="flush-collapseOne" class="accordion-collapse collapse"  aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <br>
                            TOP: 카다멈 | 소나무
                            <br>
                            MID: 아이리스 | 바이올렛 | 오키드
                            <br>
                            BASE: 샌달우드 | 레더 | 머스크 | 앰버
                        </div>
                      </div>
                      <hr>
                      <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingTwo">
                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                            배송 안내/쇼핑 팁
                          </button>
                        </h2>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                          <div class="accordion-body">
                            <p>
                            . 배송비:3000원(50,000 이상 구매 시 무료)
                            <br>
                            . 평일 16시 이전 결제 완료시 당일출고 
                            <br>  
                              (주문량 폭주시 출고가 지연될 수 있습니다.)
                            </p>
                            <p>
                                <a href="#" class="link-secondary">. 무이자 할부 혜택 보기</a>
                            </p>
                          </div>
                        </div>
                        </div>
                        <br>
                        <br>
                        <!--구매 선택옵션-->
                        <div class="row">
                            <div class="col-3">
                            <p class="text-secondary text-center">향 선택</p>
                            </div>
                            <div class="col-9">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>-[필수]옵션을 선택해 주세요-</option>
                                <option value="1">상탈레인</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">
                        <p class="text-secondary text-center">옵션 선택</p>
                        </div>
                        <div class="col-9">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>-[필수]옵션을 선택해 주세요-</option>
                            <option value="1">퍼퓸1개</option>
                            <option value="2">퍼퓸 + 바질 테라스 퍼퓸 샤워(+스톤디퓨저 증정)(+19,000원)</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
                <br>
                <hr>
                <!--상품 구매, 장바구니이동버튼-->
                <div class="row">
                    <div class="col-6">
                        <button type="button" class="btn btn-outline-secondary btn-lg">장바구니</button>
                    </div>
                    <div class="col-6 ">
                        <button type="button" class="btn btn-dark btn-lg">구매하기</button>
                    </div>
                </div>
            </div> 
        </div>
    </div>
 </div>
<!--리뷰-->
<div class="review m-5">
    <h1 class="">REVIEW</h1>
    <div class="photo">
        <h3 class="m-2">포토리뷰</h2>
    </div>
    <div class="d-flex justify-content-between"> 
        <div class="review2 m-3">
            <h3>리뷰</h3>
        </div>
        <div class="">
            <button class="btn btn-dark">리뷰 작성하기</button>
        </div>
    </div>
    <hr>
    
</div>
<div>
	<div>
	 
               <div class="container">
                  <table class="table table-bordered">
                    <thead>
                        <tr>
                          
                          <th scope="col" width="10%">리뷰번호</th>
                          <th scope="col"  width="20%">제목</th>
                          <th scope="col" width="50%"> 이미지</th>
                          <th scope="col" width="10%">작성자</th>
                          <th scope="col" width="10%"> 작성일자</th>
                        </tr>
                      </thead>
                      
                      <tbody>
             <c:choose>
                <c:when test="${RevList.size() == 0 || RevList == null}">
                  <tr>
                    <td colspan="1">1</td>
                    <td colspan="5">등록된 리뷰가 없습니다.</td>
                  </tr>
                </c:when>
                <c:when test="${RevList!=null}">
                    <c:forEach var="mem" items="${RevList}" varStatus="loop">                  
                  <tr>
                      <th scope="row">${loop.index+1}</th>
                      <td>
                       <a href=""  
                          class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">${mem.rev_content}</a>
                      </td>
                       <td>${mem.rev_img}>
                      
                      <td>${mem.user_id}</td>
                      <td>${mem.rev_date}</td> 
                    </tr>
                  </c:forEach>
                </c:when>
              
               
               
              </c:choose>
                   
                     
          </tbody> 
       </table>
             
           
       </div>
	
	
	</div>

</div>



<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>

<script type="text/javascript">
function readURL(img_name){
    if(img_name.files && img_name.files[0]){
        // 파일 입출력 처리하는 객체 생성 
        var reader = new FileReader();
        // .onload : 입력이 정상적으로 완료되면 처리하는 
        reader.onload = function(e){
          //  var str = imageFileName.value;	
         //   var idx = str.lastindexOf('\\')
          //  var name = str.substring(idx+1)
            
            $('#preview').attr('src',e.target.result)
          /*   $('#previewName').text(imageFileName.value) */

        }
        reader.readAsDataURL(img_name.files[0]);
        
    }

    
}

$(function () {
	var info ;
	
	info = $('#info').val()
	
	
	
	console.log(info)
	
})
</script>

</html>