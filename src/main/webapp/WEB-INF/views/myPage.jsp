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

	List<CGVReserveDto> list = (List<CGVReserveDto>) request.getAttribute("reserveList");
%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>

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
				<div class="my-page-header">
					<div class="info">회원정보</div>
					<div class="mo_reserve">예매 내역</div>

				</div>
				<div class="info_list mPg">
					<div class="info_box">
						<div class="list_tit">
							회원정보
						</div>
						<div class="id_info">
							<span>ID:</span> ${user.getId()}
						</div>
						<div class="name_info">
							<span>이름:</span> ${user.getName()}
						</div>
						<div class="phone_info">
							<span>전화번호:</span> ${user.getPhone_number()}
						</div>
						
						<div class="email_info">
							<span>이메일:</span> ${user.getEmail()}
						</div>
						<div class="reg_info">
							<span>가입일:</span> ${user.getRegister_date()}
						</div>
						<div class="pw_info">
							<span>비밀번호: </span><input type="password" id="pwd" placeholder="수정하려면 입력하세요">
						</div>
						<div class="info_btn">
							<button class="modify">수정하기</button>
							<button onclick="deleteMember()">탈퇴하기</button>
						</div>
					</div>
	
					<form class="info_modify_form" action="modify.do" method="post">
						<div class="info_modify">
							<div class="list_tit">
								회원정보 수정
							</div>
							<%-- <div class="modi_id" readonly><span>ID</span>${user.getId()}</div> --%>
							<div class="mody_id"><span>ID</span><input type="text" name="id" value="${user.getId()}" readonly></div>
							<div class="mody_name"><span>이름</span><input type="text" name="name" value="${user.getName()}"></div>
							<div class="mody_email"><span>전화번호</span><input type="text" name="phone_number" value="${user.getPhone_number()}"></div>
							<div class="mody_email"><span>이메일</span><input type="text" name="email" value="${user.getEmail()}"></div>
							<div class="modi_btn">
								<button class="modi_comp" id="modify">완료</button>
								<button class="modi_comp" id="cancelmodify"><a href="moveMypage.do"> 취소 </a></button>
							</div>
						</div>
					</form>

				</div>

				<div class="movie-reserve-list mPg">
					 <%
						if (list == null) {
					%>
					<div>예약한 영화가 없습니다</div>
					 <%
						} else {
							for (int i = 0; i < list.size(); i++) {
								CGVReserveDto reserveDto = list.get(i);
					%>
					<div class="movie-reserve">
						<div class="movie-reserve-age">
							<%=reserveDto.getMovieAge() %>
						</div>
						<div class="movie-reserve-title">
							 <%=reserveDto.getTitle() %>
						</div>
						<div class="movie-reserve-theater-wrapper">
							<div>
								 <%=reserveDto.getSelectedTheater() %>
							</div>
							&nbsp;/&nbsp;
							<div class="ticket-numeber">
								<%=reserveDto.getTicketNumber() %>
								장</div>
						</div>
						<div class="movie-reserve-seats">
							<%=reserveDto.getSelectedSeat() %>
						</div>
						<div class="movie-reserve-date-wrapper">
							<div class="movie-reserve-date">
								<%=reserveDto.getMovieDate() %>
							</div>
							<div class="movie-reserve-runningTime">
								<%=reserveDto.getRunningTime() %>
							</div>
						</div>
						<div class="movie"></div>

						<div class="pay-information-wrapper">
							<div class="pay-information-date-wrapper">
								<div class="pay-information-date-title">결제한 날</div>
								<div class="pay-information-date">
									<%=reserveDto.getCgvPayDto().getPayDate() %>
								</div>
							</div>

							<div class="pay-information-money-wrapper">
								<div class="pay-information-money-title">결제한 비용</div>
								<div class="pay-information-money">
									 <%=reserveDto.getCgvPayDto().getPayMoney() %>
									원</div>
							</div>

							<div class="barcode-wrapper">
								<div>CGV</div>
								<img src="images/barcode.png">
							</div>

						</div>
						<!-- 추가 -->
						<div class="movie_btn">
							<%-- <button class="movie_modify" onclick="modifyMovie(<%=reserveDto.getReserveSequence() %>)">수정하기</button>  --%>
							<button class="movie_cancel" onclick="deleteMovie(<%=reserveDto.getReserveSequence() %>)">취소하기</button>
						</div>


					</div>
						<%
							}
						%>
					<%
						}
					%>




				</div>

			</div>
		</div>
	</div>

</body>
<script>
	tabHead()
	pushButton()
	movieReserveModify()
	//예매내역하고 회원정보 탭 구분
	function tabHead(){
		let mPageHeader = document.querySelectorAll('.my-page-header div');
		let mPageWrapper = document.querySelectorAll('.mPg');
		console.log(mPageWrapper.length)
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

	//회원정보 수정시 예매내역 탭 없애고 바뀌게 하기
	function pushButton(){
		let modiBtn = document.querySelector('.modify');
		let infoModi = document.querySelector('.info_modify');
		let infoList = document.querySelector('.info_box');
		let modiComp = document.querySelector('.modi_comp');
		let headTab = document.querySelectorAll('.my-page-header > div')


		// addEventListener 이벤트 리스너를 호출하고, 그 중에서 click 이벤트 사용
		// ex) modify라는 클래스로 되어있는 것을 버튼 클릭시
		modiBtn.addEventListener('click', function(){
			let pwd = $("#pwd").val(); 
			if(pwd == "<%= pwd %>"){
				infoModi.style.display = "block";
				infoList.style.display = "none";
				headTab[1].style.display = "none"
			} else {
				alert("비밀번호가 틀렸습니다.")
			}
		})
		
		
		modiComp.addEventListener('click', function(){
			infoModi.style.display = "none";
			infoList.style.display = "block";
			headTab[1].style.display = "block"
		})

	}
	//예매내역 수정
	function movieReserveModify(){
		let movieModiBtn = document.querySelector('.movie_modify')
		let movieReserve = document.querySelector('.movie-reserve')
		let movieModiList = document.querySelector('.movie_modi_list')
		let movieModiCompBtn = document.querySelector('.movie_modi_comp button')
 	}
	
	function deleteMember(){
		if (!confirm("탈퇴 고?")) {
	    } else {
			window.location.href="delete.do";
	    }
	}
	
	function modifyMovie(seq){
		window.location.href = "moveReserve.do?reserveSeq=" + seq;
	}
	
	function deleteMovie(seq){
		if (!confirm("예매 취소 고?")) {
	    } else {
			window.location.href = "deleteMovie.do?reserveSeq=" + seq;
	    }
	}
</script>
</html>