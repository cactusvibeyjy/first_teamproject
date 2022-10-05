<%@page import="bit.com.a.model.CGVReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="bit.com.a.model.CGVMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/myPage.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <!--  <link rel="stylesheet" href="css/guestRegister.css">  -->
    <!-- MATERIAL DESIGN ICONIC FONT -->
  
  </head>
  
  <body>
  <jsp:include page="header.jsp" />
  <!-- <div class="guest-register">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<form onsubmit="event.preventDefault()" class="box">
							<h1>비회원 정보 입력</h1>
						
							<input type="text" name="phoneNumber" placeholder="휴대폰 번호"> 
							<input type="password" name="password" placeholder="비밀번호"> 
							<input type="password" name="confirm_password" placeholder="비밀번호 재입력"> 
							 
								<input type="submit" name="Guestregister" value="예매하러 고곡ㄱ곡" href="#">
							<div class="col-md-12"></div>
						</form>
					</div>
				</div>
			</div>
		</div> -->
   
   <!--   세번째 옵션
   <div class="my-page-container">
        <div class="mo_reserve"></div>
        </div>
  
        <div class="my-page-wrapper">
          <div class="my-page-header">
            <div class="mo_reserve">비회원 예매</div>
          </div> -->
    <!-- <div class="row">
				<div class="col-md-6">
					<div class="card">
             <form action="moveReserveNoMember.do" method="post" class="box">
                <h5>비회원 정보 입력</h5>
            <div class="name"><input type="text" name="name" placeholder="이름"></div>
            <div class="email"><input type="text" name="email" placeholder="이메일"></div>
            <div class="phone_num"><input type="text" name="phoneNumber" placeholder="휴대폰 번호"></div>
            <div class="pw"><input type="password" id="pw" name="password"placeholder="비밀번호"></div>
            <div class="pw2"><input type="password" id="pw2" onchange="passwordCheck()" placeholder="비밀번호 확인">&nbsp;<span id="check"></span></div>

            
             <input type="submit" value="예매하러 곡ㄱ고곡">
             <button  class="movie_btn" type="button" onclick="location.href='moveMain.do' ">메인 화면</button>
             <input type="submit" onclick="location.href='moveMain.do' " value="메인화면">
              
            <div class="col-md-12"></div>
          </form>
      </div>
    </div>
    </div> -->
     
     
     <!-- 두번째 옵션 폼
     <div>
      <div class="my-page-container">
       
        <div class="my-page-wrapper">
          <div class="my-page-header">
            <div class="mo_reserve">비회원 예매</div>
          </div>
          
          <div class="movie-reserve-list mPg" style="display:block">
            <div class="movie-reserve look_up">
            <div class="tit">비회원 예매 정보 입력</div>
	           	<form action="moveReserveNoMember.do" method="post">
	              <div class="name"><input type="text" name="name" placeholder="이름"></div>
	              
	              <div class="email"> <input type="text" name="email" placeholder="이메일"></div>
	              <div class="phone_num"> <input type="text" name="phoneNumber" placeholder="휴대폰 번호" ></div>
	              <div class="pw"> <input type="password" id="pw" name="password" placeholder="비밀번호"></div>
	              <div class="pw2"> <input type="password" id="pw2" onchange="passwordCheck()" placeholder="비밀번호 확인">&nbsp;<span id="check"></span></div>
	
	              <div class="movie_btn">
	                <button  class="movie_btn" type="submit">예매 하기</button>
	                <button  class="movie_btn" type="button" onclick="location.href='moveMain.do' ">메인 화면</button>
	              </div>
	            </form>
            </div>
          </div>
  
        </div>
      </div>
    </div>  -->
    
    
   
     <div>
      <div class="my-page-container">
       
        <div class="my-page-wrapper">
          <div class="my-page-header">
            <div class="mo_reserve">비회원 예매</div>
          </div>
          
          <div class="movie-reserve-list mPg" style="display:block">
            <div class="movie-reserve look_up">
	           	<form action="moveReserveNoMember.do" id="guestForm" method="post">
	              <div class="name"><input type="text" name="name" placeholder="이름" style="text-align: center"></div>
	              <div class="email"><input type="text" name="email" placeholder="이메일" style="text-align: center"></div>
	              <div class="phone_num"><input type="text" name="phoneNumber" placeholder="휴대폰 번호" style="text-align: center" ></div>
	              <div class="pw"><input type="password" id="pw" name="password" placeholder="비밀번호" style="text-align: center"></div>
	              <div class="pw2"><input type="password" id="pw2" onchange="passwordCheck()" placeholder="비밀번호 확인" style="text-align: center">&nbsp;<span id="check"></span></div>
	
	              <div class="movie_btn">
	             
	                <button  class="movie_btn" type="submit">예매 하기</button>
	               
	                <button  class="movie_btn" type="button" onclick="location.href='moveMain.do' ">메인 화면</button>
	              </div>
	            </form>
            </div>
          </div>
  
        </div>
      </div>
    </div>  
    <!-- 스크립트 추가 -->
  <script>

    
    function passwordCheck(){
    	if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw2').value){
                document.getElementById('check').innerHTML='일치.'
                document.getElementById('check').style.color='blue';
            }
            else{
            	alert("재확인 비밀번호가 틀렸습니다.")
                
            	//document.getElementById('check').innerHTML='일치X.';
                //document.getElementById('check').style.color='red';
            }
        }
    }
    
  </script>
  </body>
  
  </html>