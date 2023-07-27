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
                <jsp:include page="../nav/nav.jsp"/>   
    
    <!--상품-->    
   
    <div class="row m-3">
        <div class=" image col-6 m-auto">
<!--             <img src="https://www.theforment.com/web/product/big/202305/9a89fd2ce12405b9cc15c43e965fa378.jpg" class="img-thumbnail" alt="..."> -->
        	 <img class="w-100"  style="width: 650px" alt="" src="${ctxPath}/product_img.do?pro_img=${proList.pro_img}&product_code=${proList.product_code}">
        	 														
        	<input type="hidden" value="${proList.pro_img}">
        	<input type="hidden" value="${proList.product_code}">
        
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
                 <div class=" fragrance_info">${proList.pro_info}
                <%--  <textarea class="form-control" name="content"  readonly  id="content" rows="5">${proList.pro_info}</textarea> --%>
                
                </div>
<%--                <input type="hidden" id="info" value="${proList.pro_info}">  --%>
                
                
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
  
  <!--상품 설명 길게 늘릴칸  -->
 <div>
  <div>
  
  	<div>
       	<div class="accordion" id="accordionPanelsStayOpenExample">

  
  <div class="accordion-item w-50">
    <h2 class="accordion-header">
      <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
        상세 설명 
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
     
     
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
        
        <div> <button class="" id="revBtn">리뷰보기</button> </div>
        <div> <button class="" id="revBtn2">리뷰닫기</button> </div>
        
        <div> <button class="" id="qnaBtn">문의보기</button> </div>
        <div> <button class="" id="qnaBtn2">문의닫기</button> </div>
        
        
       <c:if test="${loginInfo!=null }">
        <div class="">
            <button id="revinsertBtn" class="btn btn-dark">리뷰 작성하기</button>
        </div>
        </c:if>
          <c:if test="${loginInfo!=null }">
        <div class="">
            <button id="qnainsertBtn" class="btn btn-dark">문의 작성하기</button>
        </div>
        </c:if>
        
    </div>
    <hr>
    
</div>
<div>
	<div>
	 	
	 	
	 
            <div class="container" id=rev>
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
                  	${mem.rev_code}
                      <th scope="row">${loop.index+1}</th>
                      <td>
                       <a href="${ctxPath}/rev/revFind.do?rev_code=${mem.rev_code}"  
                          class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">${mem.rev_content}</a>
                      </td>
                       <td>${mem.rev_img}  
                        <img class="w-100"  style="width: 250px" alt="" src="${ctxPath}/revimg.do?rev_img=${mem.rev_img} &rev_code=${mem.rev_code}">
                       </td>
                      
                      <td>${mem.user_id} </td>
                      <c:if test="${loginInfo == mem.user_id }"> </c:if>
                      
                      
                      <td>${mem.rev_date}</td> 
                    </tr>
                  </c:forEach>
                </c:when>
              
               
               
              </c:choose>
                   
                     
          </tbody> 
       </table>
             
           
       </div>
	
	<div class="container" id=qna>
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
                  	${mem.rev_code}
                      <th scope="row">${loop.index+1}</th>
                      <td>
                       <a href="${ctxPath}/rev/revFind.do?rev_code=${mem.rev_code}"  
                          class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">${mem.rev_content}</a>
                      </td>
                       <td>${mem.rev_img}  
                        <img class="w-100"  style="width: 250px" alt="" src="${ctxPath}/revimg.do?rev_img=${mem.rev_img} &rev_code=${mem.rev_code}">
                       </td>
                      
                      <td>${mem.user_id} </td>
                      <c:if test="${loginInfo == mem.user_id }"> </c:if>
                      
                      
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
$(function () {
	$('#revinsertBtn').click(function () {
		console.log("aaa")
		
		 location.href="${ctxPath}/pro/revForm?product_code=${proList.product_code}";
		
	})
})
$(function () {
	$('#qnainsertBtn').click(function () {
		console.log("aaa")
			
		 location.href="${ctxPath}/qna/insert?product_code=${proList.product_code}";
			
	})
})
	
	
	

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
	
	$('#rev').hide()
	$('#revBtn2').hide()
	info = $('#info').val()
	
	$('#revBtn').click(function () {
		$('#rev').show()
		$('#revBtn2').show()
		$('#revBtn').hide()
		
	})
	$('#revBtn2').click(function () {
		console.log("닫기 버튼 ")
		
		$('#rev').hide()
		$('#revBtn2').hide()
		$('#revBtn').show()
		
	})

	
})
$(function () {
	var info ;
	
	$('#qna').hide()
	$('#qnaBtn2').hide()
	info = $('#info').val()
	
	$('#qnaBtn').click(function () {
		$('#qna').show()
		$('#qnaBtn2').show()
		$('#qnaBtn').hide()
		
	})
	$('#qnaBtn2').click(function () {
		console.log("닫기 버튼 ")
		
		$('#qna').hide()
		$('#qnaBtn2').hide()
		$('#qnaBtn').show()
		
	})

	
})
</script>

</html>