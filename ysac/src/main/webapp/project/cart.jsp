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
</head>
<body>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>shoppingmall</title>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
        
       <!-- 장바구니-->
   <div class="cart p-3 m-3">
            <div class="container justify-content-center w-100">
                
                
               
           
                <c:choose>
                    <c:when test="${not empty cartDTO }">
                 <div class="border-0">
                    <!-- <div class=" row justify-content-start"> -->
                     <h3  class="row mt-1 w-75 m-1 p-5">장바구니</h3>
                    <div class="row  border mt-3">
                    <hr class="" style="display: inline-block";>
                    <c:forEach var="dto" items="${cartDTO}" varStatus="loop">
	                  
	                    <div class="col-md-3 mt-2">
	                    	<div>
	                    		<img alt="" style="width: 200px" src="${ctxPath}/product_img.do?pro_img=${dto.pro_img}&product_code=${dto.product_code}">
	                    	</div>
	                    	<div>
	                    		
	                    	</div>
	                    	
	                    </div>
	                    <div class="col-md-3 mt-3">
	                    		${dto.pro_name} <br>
	                    		${dto.pro_price}원
	                   	</div>
	                   	 <div class="col-md-3 border">
	                    		
	                   	</div>
	                   	
	                    
                    <div class="col-md-3 mt-3">
                        <button type="button"class="btn btn-dark btn-lg m-1 p-1" >총 0개 결제하기</button>

                    </div>
                    <hr>
                    </c:forEach>
                	</div>
            
				
                 </div>
                 
                 
                    </c:when>
	                <c:otherwise>
	                  <div class ="container">
                    <div class="row">
                        <div class="col-6 align-content-center">
                            <div style="padding: 50px;">
                                <p style="font-size: 8px;" class="text-center">장바구니가 비어있습니다.</p>
                            </div>
                        </div>
                        <div class="row">
                            <hr class="col-6" style="display: inline-block";>
                            <div class="col-6"></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><button type="button" class="btn btn-light btn-lg" style= "width: 100%; height: 100%";">+더담으러가기</button></div>
                            <div class="col-6"></div>
                        </div>

                        </div>

                           
                        
                    </div>
	                
	                
	                
	                </c:otherwise>
	                
	   </c:choose>
                  
                    
                    
                	</div>


                </div>
            </div>
    	</div>

</body>
</html>