 <%@page import="bit.com.a.model.CGVReserveDto"%>
  <%@page import="bit.com.a.model.CGVNoMemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
  <!DOCTYPE html>
  <html>
  <%
    List<CGVReserveDto> list = (List<CGVReserveDto>) request.getAttribute("reserveList");
    Integer isNoMember = (Integer) request.getAttribute("isNoMember");
    String phoneNumber = (String) request.getAttribute("phoneNumber");

  %>
  
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
    <%
      if (isNoMember == 0) {
    %>
    <script>
      alert("내역이 존재하지 않습니다.")
      location.href = "moveMain.do"
    </script>
    <%
      }
    %>
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
      <nav class="nav-wrapper">
        <div class="logo-wrapper">
          <a href="moveMain.do"><img class="cgvLogo" src="./images/cgv.png"></a>
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
    </div> -->
    <div>
      <div class="my-page-container">
        <!-- 추가 -->
        <div class="my-page-wrapper">
          <div class="my-page-header">
            <div class="mo_reserve">비회원 예매 내역</div>
  
          </div>
         
          
          <div class="movie-reserve-list mPg" style="display:block">
            <%
              if (list == null) {
            %> 
            <!-- <div>예약한 영화가 없습니다</div> -->
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
                <div>영화관
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
				<%-- <button class="movie_modify" onclick="modifyMovie(<%=reserveDto.getReserveSequence() %>)">예매변경</button>  --%>
				<button class="movie_cancel" onclick="deleteMovie(<%=reserveDto.getReserveSequence() %>, <%=phoneNumber%>)">취소하기</button>
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
    <!-- 스크립트 추가 -->
  <script>
    movieReserveModify()
    function movieReserveModify(){
      let movieModiBtn = document.querySelector('.movie_modify')
      let movieReserve = document.querySelector('.movie-reserve')
      let movieModiList = document.querySelector('.movie_modi_list')
      let movieModiCompBtn = document.querySelector('.movie_modi_comp button')
    }
    
    /* function modifyMovie(seq){
		window.location.href = "moveReserve.do?reserveSeq=" + seq;
	}
	 */
	function deleteMovie(seq, phoneNumber){
		if (!confirm("예매 취소 고?")) {
	    } else {
			window.location.href = "deleteMovieNoMember.do?reserveSeq=" + seq + "&phoneNumber=" + phoneNumber;
	    }
	}
  </script>
  </body>
  
  </html>