<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디그룹 info 보여주는 화면</title>
<!-- menu/ STUDYGROUP / 스터티 그룹 보기 -> 하나의 스터디그룹 선택 시 보여지는 화면. -->
<style>
body {
  margin: 0;
  padding: 0;
  font-family: Arial;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
  overflow-x: hidden;  
}

	h1 {
  margin: 2em 0 1.5em 0;
}

nav {
  width: 100%;
  display: flex;
  justify-content: center;
  position: relative;
  background:  #C0EDFF;
}

ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
}

#main-menu > li {
  float: left;
  position: relative;
}

#main-menu > li > a {
  font-size: 0.85rem;
  color: black;
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
  padding: 14px 36px;
  border-right: 1px solid rgba(0,0,0,0.15);
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
}

#main-menu > li:nth-child(1) > a {
  border-left: 1px solid rgba(0,0,0,0.15);
}

#sub-menu {
  position: absolute;
  background: white;
  opacity: 0;
  visibility: hidden;
  transition: all 0.15s ease-in;
  font-family: Arial;
}

#sub-menu > li {
  padding: 16px 28px;
  border-bottom: 1px solid rgba(0,0,0,0.15);
  
}

#sub-menu > li >  a {
  color: black;
  text-decoration: none;
  font-family: Arial;
}

#main-menu > li:hover #sub-menu {
  opacity: 1;
  visibility: visible;
}

#sub-menu > li >  a:hover {
 text-decoration: underline;
}
 	#board{
 		background-color:  #C0EDFF;
 		width: 50%;
 		height: 300px;
 		float: left;
 		color: black;
 	}
 	#members{
 		background-color: green;
 		width: 50%;
 		height: 50px;
 		float: right;
 	}
 	#addToMember {
 		background-color: pink;
 		width: 50%;
 		height: 50px;
 		float: right;
 	}
 	h4{
 		display: inline;
 	}

</style>
</head>
<body>
	<nav>
	<ul id="main-menu">
		<li><a href="#">HOME</a></li>
		<li><a href="#">MYSTUDY</a></li>
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="#">스터디 등록</a></li>
				<li><a href="#">스터디 검색</a></li>
				<li><a href="#">스터디 그룹 보기</a></li>
			</ul>
		</li>
		<li><a href="#">MANAGE</a></li>
		<li><a href="#"> LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		</li>
		
	</ul>
</nav>
<br><br>
<div>
	
	<div id="board">
		<h4>스터디명</h4>&nbsp;&nbsp;&nbsp;<h4>인원</h4>&nbsp;&nbsp;&nbsp;<h4>기간</h4>
		<h3> 시간</h3>
		<h3>설명</h3>
	</div>
	<div id="members">
		<!-- 멤버 수 가져와서 그 만큼 table tr 생성해서 보여주기 -->
		<h5>그룹 멤버 정보 보여주기</h5>
	</div>
	<div id="addToMember">
		<%@include file="registerStudy.jsp" %>
	</div>
</div>	
</body>
</html>