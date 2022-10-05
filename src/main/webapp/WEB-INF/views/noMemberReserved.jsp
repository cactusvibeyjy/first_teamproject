<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화예매</title>
  
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/myPage.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <!-- MATERIAL DESIGN ICONIC FONT -->
  
  </head>
  
  <body>
  <jsp:include page="header.jsp" />
    <!-- <div class="header-nav-wrapper">
      <header class="header">
        <div class="header-inner">
          <div>
            <button>
              <i class="zmdi zmdi-apps"></i><span>&nbsp;CGV APP</span>
            </button>
          </div>
          <div>
            <button>
              <i class="zmdi zmdi-facebook-box"></i><span>&nbsp;Like</span>
            </button>
          </div>
          <div>
            <button>
              <i class="zmdi zmdi-instagram"></i><span>&nbsp;follow</span>
            </button>
          </div>
          <div>
            <button>알뜰한 영화 관람법</button>
          </div>
        </div>
        
      </header>
    </div> -->
    <div>
      <div class="my-page-container">
        <!-- 추가 -->
        <div class="my-page-wrapper">
          <div class="my-page-header">
            <div class="mo_reserve">비회원 예매 조회</div>
  
          </div>
          
          <div class="movie-reserve-list mPg" style="display:block">
            <div class="movie-reserve look_up">
              
              <div class="tit">비회원 정보 입력</div>
              	<form action="noMemberPage.do" method="post">
	                <div class="phone_num"><input type="text" name="phoneNumber" placeholder="휴대폰 번호" style="text-align: center"></div>
	                <div class="pw"><input type="password" name="password" placeholder="비밀번호" style="text-align: center"></div>
	                <div class="movie_btn">
	                  <button  class="movie_btn" type="submit">예매조회</button>
	                  <!-- <button  class="movie_btn" type="submit"><a href="moveLogin.do"></a>예매하러 고</a></button> -->
	                </div>
                </form>
            </div>
            
          </div>
  
        </div>
      </div>
    </div>
  <script>
  </script>
  </body>
  
  </html>