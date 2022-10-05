<%@page import="bit.com.a.model.CGVMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<!DOCTYPE html>
<html>
 <%
CGVMemberDto login = (CGVMemberDto)session.getAttribute("login");
if(login!= null){
	/* System.out.println(login.toString()); */
}
%> 
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화예매</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
 	
	 <nav class="nav-wrapper">
            <!--  <div class="logo-wrapper"><a href="moveMain.do"><img class="cgvLogo" src="./images/popcorn2.png"></a></div>-->
            <div class="nav-content">
                <div class="movieLogo-wrapper"><a href="moveMain.do"><img class="cgvMovie" src="./images/h2_movie.png"></a></div>
                <div class="nav-inner">
                    <div><a href="moveMain.do"><button>영화</button></a></div>
                  
                    <div><a href="moveReserve.do"><button>예매</button></a></div>
                    <!-- 이벤트&컬쳐 항목을 게시판으로 변경 후 링크 생성 -->
                    <!-- <div><button type="button" class="list" onclick="location.href='list.do'">게시판</button></div>  -->
                    <div><a href="list.do"><button>게시판</button></a></div>
					
					<%
					if(login != null){
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
						<a href="moveLogin.do"><button>로그인 / 회원가입</button></a>
						<a href="moveNoMemberReserved.do"><button>비회원 예매 조회</button></a>
					</div>

					<%
					}
					%>
				
					<div class="search-wrapper"><input><button class="searchButton">검색</button></div>
                </div>
            </div>
            <div></div>
            <div></div>
        </nav> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>