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
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
<style>
    a{
        text-decoration: none;
        color: black
    }
    img{
        width: 70px;
       
    }

</style>

</head>
<body>
    <header class="">
        <div>
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
                            <a class="nav-link active" aria-current="page" href="/mod2html/main2.html">모델</a>
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
                          <li class="nav-item">
                            <a class="nav-link ">공지사항</a>
                          </li>
                          <div>
                            
                          </div>
                          
                        </ul>
                    </div>
                    <div class="d-flex mx-5 mt-1" id="log1">
                      <input type="text" class="form-control mx-2 mt-1" v-on:props="gogo" v-model="goin" id="ob" style="height: 30px;" >
                      <button class="rounded border  mt-1" id="gobtn" value="goin" style="width: 70px; height: 30px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                      </svg></button>
                    </div>
    
                        <div>
                            <div class="mx-5 login">
                                <a href="">LOGIN</a>
                                <a  href="" class="mx-4"><svg  xmlns="http://www.w3.org/2000/svg" width="30" height="22" fill="currentColor" class="bi bi-person" viewBox="0 0 16 14">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                                  </svg></a>
                                <a id="bo1" href=""><svg xmlns="http://www.w3.org/2000/svg" width="30" height="20" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
                                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                                  </svg></a>
                            </div>
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
    
        </div>
    
    </header>   

    <main>
        <div class="d-flex justify-content-center w-75 m-auto">
            <div id="H1" class="mt-5"> <!-- 회원 로그인 -->
                <div class="d-flex justify-content-center  border-bottom  border-black">
                  <div  class="mb-2"><h3>회원가입</h3></div>
                 
                </div>
                <div>
                  <form action="${ctxPath}/order/userinsert.do"  method="post">  
                    <div class=" m-auto  ">
                        
                        <div class="mt-3">
                            <input type="text" name="user_id" id="user_id" class="form-control border-black" style="height: 50px;" placeholder="아이디">
                        </div>
                        <div class="mt-3">
                            <input type="password" name="user_pwd" id="user_pwd" class="form-control border-black" style="height: 50px;" placeholder="비밀번호">
                        </div>
                        <div class="mt-3">
                            <input type="password" name="user_pwd2" id="user_pwd2" class="form-control border-black" style="height: 50px;" placeholder="비밀번호재입력">
                        </div>
                        <div class="mt-3">
                            <input type="text" name="user_name" id="user_name" class="form-control border-black" style="height: 50px;" placeholder="이름">
                        </div>
                        <div class="mt-3"> <input type="email" name="usdr_email" id="user_email" class="form-control border-black" style="height: 50px;" placeholder="이메일"></div>
                       	<div class="mt-3"><input type="tel" name="phone" class="form-control border-black" placeholder="전화번호 -빼고입력" > </div>
                        <div class="mt-3"> 
                                <input name="zip_code"  class="" style="height: 50px; width: 380px;" type="text" id="sample4_postcode" placeholder="우편번호">
                                <input  class="btn btn-outline-dark mb-1" style="height: 50px;" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                <input name="address"  class="mt-2" style="height: 50px; width: 510px;" type="text" id="sample4_roadAddress" placeholder="도로명주소"><br>
                                <input name="DetAddress"  class="mt-2"  style="height: 50px; width:510px ; " type="text" id="sample4_detailAddress" placeholder="상세주소">
                               
                        </div>

                        <!-- <div class="mt-3"> <input name="email" type="email" class="form-control border-black" style="height: 50px;" placeholder="이메일"></div> -->
                        <div class="mt-3"></div>
                        <hr>
                    </div>
                  
                </div>
                <div class="row">
                    <div class="col-4">
                        <!-- <input type="checkbox" name="" id="" style="font-size: 10px;"> <span style="font-size: 14px;">아이디 저장</span> -->
                    </div>
                    <div class="col-4"></div>
                    <div class="col-4 mt-2 " style="font-size: 10px;">
                        
                        <a href=""> 아이디 찾기 </a>|
                        <a href=""> 비밀번호 찾기</a>
                    </div>

                </div>
                <div>
                    <div class="row mt-2 p-3">
                        <button class="mt-3 btn btn-danger" style="height: 50px;">가입완료</button>
                        <button class="mt-2 btn btn-outline-danger" style="height: 50px;"></button>
                    </div>
                </div>
                 </form> 
                <div class=" text-center mt-4 ">
                    <span class="w-100 m-auto col">--------------------  SNS 로그인-----------------</span>
                </div>
                <div class="d-flex justify-content-center" id="gg">
                    <a href=""><img class="m-3" src="data:image/png;base64,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" alt=""></a>
                    <a href=""><img class="m-3" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAxlBMVEX93D86KSn/////40D92zn/3z//5ED/4UD92zU2JSk4Jyn+3TP//vj+3C0uHCgnFCgqGCj+9MclESgxHygtGyj//fT+99f/+d7+76woFij+6Yv//O/+4l7+4Vb+5XEyISj+5GnGqzjbvjv/9LvrzD393kj/++r+6Hn+65X+9tH/76dwXC5ZRixCMCqQejLCpziGcDEeByeljTROPCv+65Tz0z7RtjqYgTNhTS2ymDZ+aTAgCye7oDdrVy6ehjP+8bX+6IFLOCqJGm5MAAANoElEQVR4nOWdeXO6OBjHUyEcIqLQVqsiXmh/rbWntvbu+39TG7wPEJ4kEJ39/rGzszNr+UyS50ryBOXSVqFeKXer17XfVsN1fR/5vus2Wr+162q3XKkXUv/7KMXfLvTLN4OGrxpEmibLMlqK/LumBf9Z9RuDm3I/Tc60CPvdWkM1TW0DK1yE1TTVRq3bT+lL0iCsVAd+MGgxbFucZEj9QbWSwtfwJiyUa65pQOA2MA3TrZV5z1iuhPVuk0xMKrqlyJRtdus8P4ofYaE8wJSDtzuUuNm94PZdvAgva6rJA28BaRq1S05fxoWwXnUZJ+e+NNOtcpmtHAj71zKX2bkr8qsvHFwIM+HlgPvwraWZA+bJykh42TLS45sxGi1GRibCyyZH6xIl2WwyMTIQVrLgWzAyBDvUhBcvqZiXCEbjhdpB0hJWU15/u9KMaqaE/1wzU75ApvsvM8JCLaMFuC3ZrNFE5RSEZZztBF1Lw+UMCAu/2U/Qtcxf8DBCCf8JG8C5NAxdjUDCayErcFOyeZ0iYb9hCOYLZDRA8TiEsIxFD+BcMsjgAAhvRJqYbZk3KRAWBscDSBCbiW1qUsK6K9aG7kpzkxYAEhJW/ONYgmvJfsJ8IxlhWbiT2JdsJrM3iQh/jmkJrmX+8CKsHicgQUySUSUgPCIvsaskXiOe8Pp4AQlifAgXS3jUgEkQ4wiPeIrOFTtRYwiP1sisFWduDhMeqZvYVozTOEhYPgVAgnjQ9R8irJwGIEE8FMAdIKwfXSwaJdk/EIZHExbcUwEkiG50MhVN2DyudOmwtCac8Ogd4bai3WIU4YmY0bUiDWoEYR+L/mKwcEQFLoKwcTpWZim5ASG8Poa6KFRGeBAeSvjv1BbhXGZowT+MsHAklV+oZBzmFcMIf0/JE25K+01GeHKOYq0wl7FPWDg9R7FWyDzdJ6yd6hwNpNXiCU/Uji61b0/3CE8oowiT7MYRpliYwRtK7Y+gvXM3O4QXKQQzWFUlCaFxrzOZq9PpjRGSJDUVUuPiICFnM4OxpKBee/pwO7zTiyXLnskqFfW74e3DtN1DCuHk+ieR9nKIkGtlBitqr/365j1a546n58+2lNc959x+9N5e2z1VUTn+2d2qzTZhk5uZwRKajIaOVdTPDkovWs5w1EYSv5GUm9GEl5yGECvj+3fddmLoVpSOrb/fjxVekOZlJCGfIZTw5N2xvHw82sak9SzvfYIkHn9/ZxA3CXkMIVbQdGh5ELqlHPt5irgM5NYgbhK2mIcQK73Xq1LCybkvvVQa9Tgwyq1wwktmXyj1HpxzWry5is5Dj32uGpehhAPGIZTGr8UiG18gpzQaszLKgzDCPtsqxHjqMY7fUsXiFDFOVbMfQvjCFM4oneEVyHoelDXsKEyEG4HNirDOMkdVNPqgti9h0h9HiCnQket7hFUGOyN1hiWefIHO/zosq3GdYqwIGfJCZUrvIKKlW08MM3WdJy4J6b09Ru82f75A1i2DwVl5/SUhddqEx0NOJnRfxWGPejGuKjYLwgvaX5I6Z1QhWjJ5Dv1iXGbCC0LaGqnUTppA0ClfatMimt0tQsqsQmp/8HOC4YjWPaW9WWYYc8I63YqW7lOyMZt6vKccRbW+QdilcobSxEp5BGeyKCeq0d0gpJqkaqeUBeBZ3u5Q2cFFDjUjLNDYGdw7S9XIbCDqPapVZF6sCKksKR6m6Ca25T3TAC52ohCtu5feU3P0+yre0hjUudOfEboUgJ8ZmNG17CmNtXGXhBR1YNzjnkwcVqlDsRRntWFElzjht8wW4Vz6kMKezlKogBBeoJGmmc7RQFcU83RWrgkIfej/ice72xAZqEThMvw5YR88SZUHDjU1qJx3uD01+jPCLtRX4N5j9oBknsKNjdadEYK9ofTuiCD04E4x8IgIfkoPd65EAJIsAzyIwWk+lCtAzbDyIGQIg5UINqdqgRCC/f1YECBBBJtT4vMROOyWphmHM2uVnqCDSIJvlLsBGho8zChp2lf+D7qitBtCCIxocOdDFCCFwyBRDYKaUuk7w6xpV8VX4DQlxhQVgDGb+iZskgbxN9TU+AVUh01t3Ms4qdiWDbWmRh1VYFEpblsiCa/uoYQVVIYRSq8Cgu61nBEwcjPKCFgqVUQuQ7IQ34CmxugiYIIvCQtoZsrfwQBJmo+uYQ6/l3lyvy1o4KZdoxrIHeKOkNRwLQvo8+UagoU0alvwGFptmHeTBwh21Ev9FBZ2z1WaAkPTFoIFbdKTwJgt0PkTkLCBYPVu6UmoOySR6TeQ0D09QqBD9BEs8P4/EApeh+BZCpXAEsZcYEuDgGOI74WmFiS5+ASXhYGEImsYgawJkNAH2lLcE0x4Dq3UQAkRFrsO82dj2PcSPmAhSnkWmx+CCzUNYFyKJFEl/bk88BZbC5hbIPwpaFtmLnDgTXILWH5IjKlQl/8BLgnXoDk+Qs/Zb3CvBC5iBDk+9CCGMhK4EJ0H6NaMcQOttSE8EZjlX7WhptToQuulRHfCpmk+D/3WoF4KrHkTfzESlkA5D+CdfKMC3bcIrKmw4NuGn8Yw6uC9J2JrvgRtznhv8NzQL4D3D4PNGUG2xgZWEtF8/5DiVBsWs3eh/1GdbIPv4weDKCSFsqA7a2ixj09xBFrJ+uxlIA+cVqDAWdCcpwnMqYAs0Z5Q1KBm52nAZ6JQcCwq8/i7CD8QhRZnoui6z2Ud2OT1McUknZ9rozqpn/kelE11N2hxNhF8vjSQ8pDpUjwHJxVzwi7lGeGZsrtQErhCqk8kUSnlOe9AuJfJta6Z8uAa4kI+9Vn9QFJ2J2s+KG+vrc7qU15Uz+xKgg0+dLnQ6r4Fbe8k5TsTRAt6Smil1Z0ZmntPc8RRBqVFa0R7E1h2me6uzSSNUh9FiyqWmWnj7hp9t0vlNWVEm3oEt+4fXtA3bpGe7DSdBrWRmRGu75Cy9E9S2nZq+bBufbK0xti4B0x5l3suqfOXUo3YuWNrb7J5l5vyPv5cePyViu+3vsZMpxIWDb7Zeiosfkp5KnEPUnWyBJlaKW33VMh12ZpE8W/BU3pmmqFory8Ga1dPjJ8+OK5Gz/7GrOdmdnqbsLf1lHq3Fiejqtu37D3bdvvTcOgoiKX2H4+EKm/9tTl0wtzrMcSjfzCW7pnLN7r996lyONi13yeKqdfXSsotm031rOdPti5mS4X0+mLq17aUxLJpky8+frWZDcxCIf3aGHvuzaVSz9K8Z9298uh7OVdYzz3WvomBMOVdBd2x9KA/K79Ou6F9E5l7Xwa5FHx7mNBZz6MJn9asS4X3vuTQv3R8Bpmkec8pWfrzw2cPcxy9mSL6lzL3oFVeD+xmFK2r82LRISoWz68s+9G++xpNJ2OJe0Pv6B60rF4fj6NTjLz9Ovl8+n4dEb1+P322Oz2k8u9WvlBkH2HGXtAHDml43r2CsSRJiqKQf0rpttaP7gXNNojRZzTy9heH3sDJdaCfN9MgRnp7x5vytiQHdagnO0tffTXijLv+wSFRAOlgX32GJCqiKc/Vc5urp4vX7kMsvN63kEKb8hSdJz6BNEAx71vQvlEihe0Je/ZozNbSmUJxb5RQ5ol4nN+bo5713svUwswU/84M3VtB0u1ukcZ7/OpkvABnSvBWEI2xUXZ3Ej37ayKCL9F7TxRvdu0eINKttwmPSgSFEr3ZBd6Jwuhus8im28M234djkivZu2vgt/PUzUWoW8P7lOLpeGmDEBr29w+V7/VGsPf4xq3SAlfy9w9B9lRqr3oQOFe3HVHzM1DyNywh75CqHWfhCYvF9072/m9DkHdIk5/mw+O/mZXJlxyOlTIqwd6STfwesPoVWJn81d3TWOj4IfB7wAldxuy4iW7fTTm91MQg6JvOyd7lVqYfJHx5u5cEmpeF4O9yJ3lbXZ3YjvUlKnzZEs3b6rlCXJaBe1f2u5Dwek+yG+YJ4whz/ZifHT+PBKRH4YqwMjGEMVUb3BbsHtbaqcwkJ4wxqMLCz11FmtF4wtzPKTyda/4cZDhMmObTsrxk7hZmYISJ3KJQRTvChIS56+NGNMPDbQjhcSPGAyYgPOaJGjtFkxEer7mJMzKJCY/VacS4CQghcf1H+OL6YUcPJMxV0LEhyuhQqAYnzPVdvm+Ss0pzDwTbVIS5QvOYFqPZjE6XaAmPymsk8RIUhLkyqFKcnmSczMbACXP9Bo8jmqwyGkmXIJwwCOFED6OcIFBjIcz9w2JtqoZDS/ccCXOFX5EGx/xNbEOpCQODI2oYNZCJoSfMXdSErEbZrF3EfxwXQrIa3eyNqulCVyALYXC0P9upqu2dk0mbMNupSjlB2QhJvtHMiFE2mwnzCM6EudxlFoyE7zL+U1IiJIwtI11G2Wgx8TETEsaBmZ7N0cwBIx8HQhKPv8ipDCT51RdQjJ0aYS5Xr7rcB1Iz3Wo9/k/Hiwsh0WXN4Gh1ZNP4ZZ6eC/EiJA6y21S5zFbZUJtdave3J36ERP1uyzQ1FkpZM81Wl8PqW4srIdFFueaalEMpG6ZbK/Mbvbl4EwaqVJu+oYHGUtY0w29WGUKXSKVBGKjfrTVU09DkOE5Z1gxTbdS6adAFSoswUKFSvhk0fCPQLmoAFshvDG7KFXDiDlCahHMV6pXyz811bdBouH7QVsz33UZjULu++SlX6mmyzfUf+HBFdK+7B6wAAAAASUVORK5CYII=" alt=""></a>
                </div>
            </div><!-- 회원 로그인 -->

        </div>




    </main>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
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

</script>

</html>