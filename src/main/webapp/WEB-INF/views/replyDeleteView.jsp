<%@page import="bit.com.a.model.CGVMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%
CGVMemberDto login = (CGVMemberDto) session.getAttribute("login");
if (login != null)
	System.out.println(login.toString());
%>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
		 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		 
		 <!-- 메인페이지와 연동 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="../css/main.css">
	 
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "readView.do?bno=${replyDelete.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
	<body>
	<jsp:include page="header.jsp" />
		<div id="root">
			<%-- <header>
						<div class="header-nav-wrapper">
			<header class="header">
				<div class="header-inner">

					<%
					if (login != null) {
					%>
					<div>
						<button><%=login.getName()%>님 환영합니다
						</button>
					</div>
					<div>
						<a href="../moveMypage.do"><button>마이페이지</button></a>
					</div>
					<div>
						<a href="../logout.do"><button>로그아웃</button></a>
					</div>
					<%
					} else {
					%>
					<div>
						<a href="../moveLogin.do"><button>로그인</button></a>
					</div>
					<div>
						<a href="../moveRegister.do"><button>회원가입</button></a>
					</div>
					<%
					}
					%>
				</div>
			</header>
			<nav class="nav-wrapper">
				<div class="logo-wrapper">
					<a href="../moveMain.do"><img class="cgvLogo"
						src="../images/cgv.png"></a>
				</div>
				<div class="nav-content">
					<div class="movieLogo-wrapper">
						<img class="cgvMovie" src="../images/h2_movie.png">
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
							<button type="button" class="list"
								onclick="location.href='list.do'">게시판</button>
						</div>
						<!-- 이벤트&컬쳐 항목을 게시판으로 변경 후 링크 생성 -->
						<div class="search-wrapper">
							<input>
							<button class="searchButton">검색</button>
						</div>
					</div>
				</div>
				<div></div>
				<div></div>
			</nav>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
			</header> --%>
			<hr />
			 	<div class="container">
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="replyDelete.do">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn btn btn-success">예</button> <t>
						<button type="button" class="cancel_btn btn btn-primary">아니오</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>