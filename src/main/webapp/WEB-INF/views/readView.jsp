<%@page import="bit.com.a.model.CGVMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						// 수정 
						$(".update_btn").on("click", function() {
							formObj.attr("action", "updateView.do");
							formObj.attr("method", "get");
							formObj.submit();
						})

						// 삭제
						$(".delete_btn").on("click", function() {

							var deleteYN = confirm("삭제하시겠습니까?");
							if (deleteYN == true) {

								formObj.attr("action", "delete.do");
								formObj.attr("method", "post");
								formObj.submit();

							}
						})
						
						// 댓글 삭제
						/*   $(".replyDeleteBtn").on("click", function() {
							var deleteYN = confirm("삭제하시겠습니까?");
							if (deleteYN == true) {

								formObj.attr("action", "replyDelete.do");
								formObj.attr("method", "post");
								formObj.submit();
							}
						}); */  
						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "list.do?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

						$(".replyWriteBtn").on("click", function() {
							<!-- 9/13 추가 -->
							if(fn_valiChk()){
								return false;
							}
							<!-- 9/13 추가 -->
							var formObj = $("form[name='replyForm']");
							formObj.attr("action", "replyWrite.do");
							formObj.submit();
						});

						//댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											location.href = "replyUpdateView.do?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});

						//댓글 삭제 View
					   $(".replyDeleteBtn")
								.on(
										"click",
										function() {
											location.href = "replyDeleteView.do?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										}); 
					})  
					<!-- 9/13 추가 -->
					function fn_valiChk() {
						var regForm = $("form[name='replyForm'] .chk").length;
							for (var i = 0; i < regForm; i++) {
						if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
								alert($(".chk").eq(i).attr("title"));
								return true;
							}
						}
					}
					<!-- 9/13 추가 -->
</script>

<body>
<jsp:include page="header.jsp" />
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

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">
			</form>

			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label> <input
					type="text" id="title" name="title" class="form-control"
					value="${read.title}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<textarea id="content" name="content" class="form-control h-25" rows="10"
					readonly="readonly"><c:out value="${read.content}" /></textarea>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">작성자</label> <input
					type="text" id="writer" name="writer" class="form-control"
					value="${read.writer}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
				<fmt:formatDate value="${read.regdate}"
					pattern="yyyy-MM-dd  HH:mm:ss" />
			</div>

			<div>
			<c:if test="${sessionScope.login.getId() eq read.writer }">
				<button type="button" class="update_btn btn btn-warning">수정</button>
				</c:if>
				<c:if test="${sessionScope.login.getId() eq read.writer || sessionScope.login.getId() eq 'board_admin' }">
				<button type="button" class="delete_btn btn btn-danger">삭제</button>
				</c:if>
				<button type="button" class="list_btn btn btn-primary">목록</button>
			</div>
			<br><br>
			<!-- 댓글 -->
			<label for="reply" class="col-sm-2 control-label">댓글</label>
			<br><hr/>
			<div id="reply">
				<ol class="replyList">
					<c:forEach items="${replyList}" var="replyList">
						<li>
							<p>
								작성자 : ${replyList.writer}<br /> 작성 날짜 :
								<fmt:formatDate value="${replyList.regdate}"
									pattern="yyyy-MM-dd  HH:mm:ss" />
							</p>

							<p>${replyList.content}</p>
							<div>
							<c:if test="${sessionScope.login.getId() eq replyList.writer }">
								<button type="button" class="replyUpdateBtn btn btn-warning"
									data-rno="${replyList.rno}">수정</button>
								<button type="button" class="replyDeleteBtn btn btn-danger"
									data-rno="${replyList.rno}">삭제</button>
									</c:if>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>

			<form name="replyForm" method="post" class="form-horizontal">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">
				<c:if test="${sessionScope.login.getId() ne null }">
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
					<div class="col-sm-10">
						<input type="text" id="writer" name="writer" class="form-control" value="${login.getId()}" readonly="readonly" />
					</div>
				</div>

				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">댓글 내용</label>
					<div class="col-sm-10">
						<input type="text" id="content" name="content"
							class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="replyWriteBtn btn btn-success">작성</button>
					</div>	
				</div>
				</c:if>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>