<%@page import="bit.com.a.model.CGVReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="bit.com.a.model.CGVMemberDto"%>
<%@page import="java.io.PrintStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	CGVMemberDto login = (CGVMemberDto) session.getAttribute("login");
	if (login != null){
		/* System.out.println(login.toString()); */
	}
	
	String pwd = login.getPassword();

%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화예매</title>

<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/myPage.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- MATERIAL DESIGN ICONIC FONT -->

</head>

<body>
<jsp:include page="header.jsp" />
	<%
		if (login == null) {
	%>
	<script>
		alert("로그인이 필요한 작업입니다 로그인을 진행해 주세요!")
		location.href = "moveLogin.do"
	</script>
	<%
		}
	%>
	<%-- <div class="header-nav-wrapper">
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
			<div class="header-inner">

				<%
					if (login != null) {
				%>
				<div>
					<button><%=login.getName()%>님 환영합니다
					</button>
				</div>
				<div>
					<a href="moveMypage.do"><button>마이페이지</button></a>
				</div>
				<div>
					<a href="logout.do"><button>로그아웃</button></a>
				</div>
				<%
					} else {
				%>
				<div>
					<a href="moveLogin.do"><button>로그인</button></a>
				</div>
				<div>
					<a href="moveRegister.do"><button>회원가입</button></a>
				</div>
				<%
					}
				%>
			</div>
		</header>
		<nav class="nav-wrapper">
			<div class="logo-wrapper">
				<a href="moveMain.do"><img class="cgvLogo"
					src="./images/cgv.png"></a>
			</div>
			<div class="nav-content">
				<div class="movieLogo-wrapper">
					<img class="cgvMovie" src="./images/h2_movie.png">
				</div>
				<div class="nav-inner">
					<div>
						<button>영화</button>
					</div>
					<div>
						<button>예매</button>
					</div>
					<div>
						<button>극장</button>
					</div>
					<div>
						<button>이벤트&컬쳐</button>
					</div>
					<div class="search-wrapper">
						<input>
						<button class="searchButton">검색</button>
					</div>
				</div>
			</div>
			<div></div>
			<div></div>
		</nav>
	</div> --%>
	<div>
		<div class="my-page-container">
			<!-- 추가 -->
			<div class="my-page-wrapper">

				<div class="movie-reserve-list mPg">
					<!-- 추가 -->
					<form action="modifyMovie.do" method="post">
					<div class="movie_modi_list">
						<h2>예매 내역 수정</h2>
						<div class="cine_position">영화관<input type="text" name="selectedTheater" value="${movie.getSelectedTheater()}" ></div>
						<div class="cine_position">영화 제목<input type="text" name="title" value="${movie.getTitle()}"></div>
						<div class="movie_name">예약 날짜<input type="text" name="reserveDate" value="${movie.getReserveDate()}"></div>
						<div class="sit_position">좌석위치 <input type="text" name="selectedSeat" value="${movie.getSelectedSeat()}"></div>
						<input type="hidden" name="reserveSequence" value="${movie.getReserveSequence()}"/>
						<div class="movie_modi_comp">
							<button class="movie_modify" type="submit">저장하기</button>
						</div>
					</div>
					</form>
				</div>

			</div>
		</div>
	</div>

</body>
<script>
	tabHead()
	movieReserveModify()
	//예매내역하고 회원정보 탭 구분
	function tabHead(){
		let mPageHeader = document.querySelectorAll('.my-page-header div');
	let mPageWrapper = document.querySelectorAll('.mPg');
	for(let i = 0; i < mPageHeader.length ; i++){
		mPageHeader[i].addEventListener('click', function(){
			if(i < 1){
				mPageWrapper[i].style.display = "block";
				mPageWrapper[i + 1].style.display = "none";

			} else{
				mPageWrapper[i].style.display = "block";
				mPageWrapper[i - 1].style.display = "none";
			}
		})
	}
	}
	//예매내역 수정
	function movieReserveModify(){
		let movieModiBtn = document.querySelector('.movie_modify')

		let movieModiList = document.querySelector('.movie_modi_list')
		let movieModiCompBtn = document.querySelector('.movie_modi_comp button')
		
		movieModiList.style.display = "block";
	}
	
	$(document).ready(function(){
		let movieReserveList = document.querySelector('.movie-reserve-list')
		movieReserveList.style.display = "block";
	})
	
</script>
</html>