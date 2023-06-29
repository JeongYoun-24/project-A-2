<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
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
<header>
      <!--배너-->
      <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59" style="background: #000000 ;">
        <a href="#none" ><span style="color: #ffffff; "class="d-flex justify-content-center">신규회원 무료배송 + 1만원 쿠폰팩</span></a></div>
      
      <!--네비바-->
        <div class="main">
          <div>
              <nav class=" navbar navbar-expand-lg bg-body-tertiary">
                  <div class="alert">
                  <img src="https://theforment.com/web/upload/images/logo_header_main.svg"  href="shoppingmall.html">
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
                            <li><a class="dropdown-item" href="#">PRDUCT</a></li>
                            <li><a class="dropdown-item" href="#">전체</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">베스트</a></li>
                          </ul>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="#">선물제안</a>
                        </li>
                       
                        <li class="nav-item">
                          <a class="nav-link active" href="#">정기배송</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" href="#">브랜드</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" href="#">cs센터</a>
                        </li>
                      </ul>
                    </div>
                    <div class="col-3">
                         <ul class="navbar-nav login ">
                          <li class="nav-item">
                            <a class="nav-link " href="login1.html">LOGIN</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="join.html">JOIN</a>
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
                    </div>
                  </div>
              </nav>
          </div>
       </div>
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
                            <form action="" 
                                  enctype="multipart/form-data"
                                  method="" >
                                <div class="w-75 m-auto" >
                                    <h4 class="text-center">문의</h4>
                                    <hr>
                                </div>
                                <div class="w-75 m-auto" >
                                    <input type="hidden" name="articleNO"  >
                                    <div class="mb-3 row">
                                        <label for="id" class="col-sm-2 col-form-label">ID</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="id" 
                                                class="form-control border rounded-1 p-2" id="id" placeholder="아이디">
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
                                        <label for="imageFileName" class="col-sm-2 col-form-label">이미지</label>
                                        <div class="col-sm-10">
                                          <!-- jquery에서 show태그는 숨기기로 설정, 파일선택시 표시하기로 변경 -->
                                          <div id="show">
                                              <div class="alert alert-light p-1" role="alert">
                                                  <label id="previewName"></label>
                                              </div>
                                              <div class="alert alert-light" role="alert">
                                                <img src="#" id="preview" width="300">
                                              </div>
            
                                          </div>
                                          
                                          <input type="file"  name="imageFileName" id="imageFileName" 
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
                                                    <button type="submit" class="btn btn-outline-secondary btn-sm">저장</button>
                                                    <button type="button" onClick="list()" class="btn btn-outline-secondary btn-sm">목록</button>
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
</html>