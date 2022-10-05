<%@page import="bit.com.a.model.CGVReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="bit.com.a.model.CGVMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
CGVMemberDto login = (CGVMemberDto) session.getAttribute("login");
if (login != null)
	System.out.println(login.toString());

List<CGVReserveDto> list = (List<CGVReserveDto>) request.getAttribute("reserveList");
%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세정보</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="css/detail.css">

<!-- <link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' /> -->
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<!-- MATERIAL DESIGN ICONIC FONT -->

</head>

<body>
<jsp:include page="header.jsp" />
	<%-- <div class="header-nav-wrapper">
		<header class="header">
			<!-- <div class="header-inner">
                <div><button><i class="zmdi zmdi-apps"></i><span>&nbsp;CGV APP</span></button></div>
                <div><button><i class="zmdi zmdi-facebook-box"></i><span>&nbsp;Like</span></button></div>
                <div><button><i class="zmdi zmdi-instagram"></i><span>&nbsp;follow</span></button></div>
                <div><button>알뜰한 영화 관람법</button></div>
            </div> -->
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



	<!-- <div class="tit-heading-wrap" padding-top = "300px">
    <h3>영화상세</h3>
</div> -->

	<div class="sect-base-movie">
		<!-- <h3>
			<strong>탑건-매버릭</strong>기본정보
		</h3> -->
		<div class="box-image">
			<a href="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000082/82120/82120_1000.jpg" title="포스터 크게 보기 새창" target="_blank"> 
			<span class="thumb-image"><img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000082/82120/82120_320.jpg" alt="헌트 포스터 새창" onerror="errorImage(this)"
					height="260px" 	width="185px" /> <span	class="cgvIcon etc age12"> 12세</span>
			</span>
			</a>
		</div>
		<div class="box-contents">
			<div class="title">
				<strong>탑건-매버릭</strong> <em class="round lightblue"><span>현재상영중</span></em>
				<p>Top Gun: Maverick</p>
			</div>
			<div class="score">
				<strong class="percent">예매율&nbsp;<span>18.2%</span></strong>
			</div>
			<div class="spec">
				<dl>
					<dt>감독 :&nbsp;</dt>
					<dd>
						<a href="/movies/persons/?pidx=106608">조셉 코신스키</a>
					</dd>
					<dd></dd>
					<dt>&nbsp;/ 배우 :&nbsp;</dt>
					<dd class="on">
						<a href="/movies/persons/?pidx=274">톰 크루즈</a> ,&nbsp; <a
							href="/movies/persons/?pidx=115613">마일즈 텔러</a> ,&nbsp; <a
							href="/movies/persons/?pidx=930">제니퍼 코넬리</a>
					</dd>
					<dt>장르 :&nbsp;액션</dt>
					<dd></dd>
					<dt>&nbsp;/ 기본 :&nbsp;</dt>
					<dd class="on">12세 이상,&nbsp;130분,&nbsp;미국</dd>
					<dt>개봉 :&nbsp;</dt>
					<dd class="on">2022.06.22</dd>
				</dl>
			</div>
		</div>

		<div class="sect-story-movie">
			<p>
				<strong>한순간의 실수도 용납되지 않는 하늘 위,&nbsp;<br /> 가장 압도적인 비행이
					시작된다!
				</strong>
			</p>
			<p>
				최고의 파일럿이자 전설적인 인물 매버릭(톰 크루즈)은 자신이 졸업한 훈련학교 교관으로 발탁된다.&nbsp;<br />
				그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만 실전을 방불케 하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인
				조종 실력에 모두가 압도된다.&nbsp;
			</p>
			<p>
				매버릭의 지휘아래 견고한 팀워크를 쌓아가던 팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자<br /> 매버릭은 자신이
				가르친 동료들과 함께 마지막이 될 지 모를 하늘 위 비행에 나서는데&hellip;&nbsp;
			</p>
		</div>
	</div>
	<script src="js/detail.js"></script>
</body>

</html>