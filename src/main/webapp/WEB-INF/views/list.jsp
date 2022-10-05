<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="bit.com.a.model.CGVMemberDto"%>
<html>
 <%
CGVMemberDto login = (CGVMemberDto)session.getAttribute("login");
if(login!= null) System.out.println(login.toString());
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
	<body>
		<jsp:include page="header.jsp" />
			<%-- <header>
			<!-- 메인 페이지와 연동 -->
			    <div class="header-nav-wrapper">
        <header class="header">
            <div class="header-inner">
                
                 <% if(login != null){
                	%>
                	<div><button><%=login.getName()%>님 환영합니다</button></div>
                	<div><a href="../moveMypage.do"><button>마이페이지</button></a></div>
                	<div><a href="../logout.do"><button>로그아웃</button></a></div>
                	<%
                } else {
                	%>
                	<div><a href="../moveLogin.do"><button>로그인</button></a></div>
                	<div><a href="../moveRegister.do"><button>회원가입</button></a></div>
                	<%
                }
                %> 
            </div>
        </header>
        <nav class="nav-wrapper">
            <div class="logo-wrapper"><a href="../moveMain.do"><img class="cgvLogo" src="../images/cgv.png"></a></div>
            <div class="nav-content">
                <div class="movieLogo-wrapper"><img class="cgvMovie" src="../images/h2_movie.png"></div>
                <div class="nav-inner">
                    <div><button>영화</button></div>
                    <div><button>예매</button></div>
                    <div><button>극장</button></div>
                    <div><button type="button" class="list" onclick="location.href='../board/list.do'">게시판</button></div> <!-- 이벤트&컬쳐 항목을 게시판으로 변경 후 링크 생성 -->
                    <div class="search-wrapper"><input><button class="searchButton">검색</button></div>
                </div>
            </div>
            <div></div>
            <div></div>
        </nav>
    </div> --%>
    		<br><br><br><br><br><br><br><br>

			</header>
			
			<div class="container">
			
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						</thead>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<%-- <td>
									<a href="readView.do?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td> --%>
								<!-- 비밀글 여부 확인해서 작성자와 관리자만 볼 수 있게 만듦 -->
								<c:if test="${list.secret == true}">
    							<c:choose>
								 <c:when test="${sessionScope.login.getId() eq list.writer || sessionScope.login.getId() eq 'board_admin'}">
								<td>
								<img class="lockButton" src="./images/lock-icon.png">                                        
									<a href="readView.do?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								 </c:when>
								<c:otherwise>
									<td><img class="lockButton" src="./images/lock-icon.png"><a>비밀글입니다.</a></td>
								</c:otherwise>
							</c:choose>                                            
						</c:if>
								<c:if test="${list.secret == false}">
								<td>                                       
									<a href="readView.do?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								</c:if>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="MM-dd  HH:mm"/></td>
							</tr>
						</c:forEach>
						
					</table>
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
								</span>
							</div>
						</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					</div>
					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>