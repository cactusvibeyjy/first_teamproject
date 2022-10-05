<%@page import="bit.com.a.model.CGVMemberDto"%>
<%@page import="bit.com.a.model.CGVNoMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <%
CGVMemberDto login = (CGVMemberDto)session.getAttribute("login");
CGVNoMemberDto noMember = (CGVNoMemberDto) request.getAttribute("noMember");

if(login!= null) System.out.println(login.toString());
%> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/reserve.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <!-- MATERIAL DESIGN ICONIC FONT -->

</head>

<body>
<jsp:include page="header.jsp" />
 <%if(login == null && noMember == null){
	%>
	<script>
	alert("로그인이 필요한 작업입니다 로그인을 진행해 주세요!")
	location.href="moveLogin.do"
	</script>
	<%
}%> 
    <%-- <div class="header-nav-wrapper">
        <header class="header">
            <div class="header-inner">
                <div><button><i class="zmdi zmdi-apps"></i><span>&nbsp;CGV APP</span></button></div>
                <div><button><i class="zmdi zmdi-facebook-box"></i><span>&nbsp;Like</span></button></div>
                <div><button><i class="zmdi zmdi-instagram"></i><span>&nbsp;follow</span></button></div>
                <div><button>알뜰한 영화 관람법</button></div>
            </div>
            <div class="header-inner">
                
                 <% if(login != null){
                	%>
                	<div><button><%=login.getName()%>님 환영합니다</button></div>
                	<div><a href="moveMypage.do"><button>마이페이지</button></a></div>
                	<div><a href="logout.do"><button>로그아웃</button></a></div>
                	<%
                } else if(noMember != null) {
                	%>
                	<div><button><%=noMember.getName()%>님 환영합니다(비회원)</button></div>
                	<div><a href="moveLogin.do"><button>로그인</button></a></div>
                	<div><a href="moveRegister.do"><button>회원가입</button></a></div>
                	<%
                } else {
                	%>
                	<div><a href="moveLogin.do"><button>로그인</button></a></div>
                	<div><a href="moveRegister.do"><button>회원가입</button></a></div>
                	<%
                }
                %> 
            </div>
        </header>
        <nav class="nav-wrapper">
            <div class="logo-wrapper"><a href="moveMain.do"><img class="cgvLogo" src="./images/cgv.png"></a></div>
            <div class="nav-content">
                <div class="movieLogo-wrapper"><img class="cgvMovie" src="./images/h2_movie.png"></div>
                <div class="nav-inner">
                    <div><button>영화</button></div>
                    <div><button>예매</button></div>
                    <div><button>극장</button></div>
                    <div><button>이벤트&컬쳐</button></div>
                    <div class="search-wrapper"><input><button class="searchButton">검색</button></div>
                </div>
            </div>
            <div></div>
            <div></div>
        </nav>
    </div> --%>
    <div class="reserve-container">
        <div class="movie-part">
            <div class="reserve-title">영화</div>
            <div class="sort-wrapper">
                <div class="sort-rate sort-selected">예매율순</div>
                <!-- <div class="sort-korean">가나다순</div> -->
            </div>
             <div class="movie-list-wrapper">
                <div class="movie-list">
                    <%-- <div class="movie-list-age">15</div>
                    <div class="movie-list-title">1917</div> --%>
                </div>
            </div>
        </div>
        <div class="theater-part">
            <div class="reserve-title">
                극장
            </div>
            <div class="theater-container">
                <div class="theater-wrapper">
                   <div class="theater-location-wrapper">
                        <button class="theater-location">CGV대연</button>
                        <button class="theater-location">CGV동래</button>
                        <button class="theater-location">CGV부산명지</button>
                        <button class="theater-location">CGV서면</button>
                        <button class="theater-location">CGV서면삼정타워</button>
                        <button class="theater-location">CGV서면상상마당</button>
                        <button class="theater-location">CGV센텀시티</button>
                        <button class="theater-location">CGV아시아드</button>
                        <button class="theater-location">CGV정관</button>
                        <button class="theater-location">CGV하단아트몰링</button>
                        <button class="theater-location">CGV해운대</button>
                        <button class="theater-location">CGV화명</button>
                        <button class="theater-location">CINE de CHEF 센텀</button>
                    </div>
                    <div class="theater-place-wrapper">
                        <button class="theater-place">1관</button>
                        <button class="theater-place">2관</button>
                        <button class="theater-place">3관</button>
                        <button class="theater-place">4관</button>
                        <button class="theater-place">5관</button>
                        <button class="theater-place">6관</button>
                        <button class="theater-place">7관</button>
                        <button class="theater-place">8관</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date"></div>
        </div>
        <div class="time-part">
            <div class="reserve-title">시간</div>
            <div class="reserve-time">
                <div class="reserve-where">4관(Laser) 6층(총 240석) </div>
                <div class="reserve-time-wrapper">
                    <button class="reserve-time-button">
            <span class="reserve-time-want">12:20</span>
            <span class="reserve-time-remain">240석</span>
          </button>
                    <button class="reserve-time-button">
            <span class="reserve-time-want">14:20</span>
            <span class="reserve-time-remain">240석</span>
          </button>
                    <button class="reserve-time-button">
            <span class="reserve-time-want">16:20</span>
            <span class="reserve-time-remain">240석</span>
          </button>
                    <button class="reserve-time-button">
            <span class="reserve-time-want">18:20</span>
            <span class="reserve-time-remain">240석</span>
          </button>

                </div>
            </div>
            <div>
            <form class="moveSeatForm" action="moveSeat.do" method="post">
            <% if(noMember != null){%>
            <input type="hidden" class="id" name="id" value="${noMember.getPhoneNumber()}">
            <% } %>
            <input type="hidden" class="title" name="title">
            <input type="hidden" class="movieAge" name="movieAge">
            <input type="hidden" class="selectedLocation" name="selectedLocation">
            <input type="hidden" class="selectedTheater" name="selectedTheater">
            <input type="hidden" class="reserveDate" name="movieDate">
            <input type="hidden" class="runningTime" name="runningTime">
            <button class="moveSeatButton" type="button">예약하기</button>
            </form>
            </div>
        </div>

    </div>
    <script src="js/reserve.js"></script>
</body>
</html>