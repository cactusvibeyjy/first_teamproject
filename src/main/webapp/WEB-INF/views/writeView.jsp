<%@page import="bit.com.a.model.CGVMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%
CGVMemberDto login = (CGVMemberDto) session.getAttribute("login");
if (login != null)
	System.out.println(login.toString());
%>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 메인페이지와 연동 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet"
	href="../fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="../css/main.css">

<title>게시판</title>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "write.do");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>
<jsp:include page="header.jsp" />
		<%
		if (login == null) {
	%>
	<script>
		alert("로그인이 필요한 작업입니다 로그인을 진행해 주세요!")
		location.href = "list.do"
	</script>
	<%
		}
	%>
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
			<div class="container">
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="writeForm" method="post" action="write.do">
			<div class="form-group">
				<!-- 9/13 수정 -->
				<label for="title" class="col-sm-2 control-label">제목</label> <input
					type="text" id="title" name="title" class="chk form-control"
					title="제목을 입력하세요." />
			<!-- 9/13 수정 -->		
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<!-- 9/13 수정 -->
				<textarea id="content" name="content" class="chk form-control h-25" rows="10" title="내용을 입력하세요."><c:out value="${write.content}" /></textarea>
				<!-- 9/13 수정 -->
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">작성자</label> <input
					type="text" id="writer" name="writer" class="form-control"
					value="${login.getId()}" readonly="readonly"/>
			</div>
			<!-- 비밀글 체크박스 -->
			<div class="form-check form-check-inline mt-3">
    	<input class="form-check-input" type="checkbox" name="secret" id="secret">
    	<label class="form-check-label">비밀글</label>
		</div>
		<br>
			
				<table>
					<tbody>
						<tr>
							<td>
								<button type="button" class="write_btn btn btn-success">작성</button>
								<button type="button" class="btn btn-primary" onclick="location.href='list.do'">취소</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>

		</section>
		<hr />
	</div>
	</div>
</body>
</html>