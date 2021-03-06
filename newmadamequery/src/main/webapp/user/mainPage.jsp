<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainPage</title>

<style>
	body {
  margin: 0;
  padding: 0;
  font-family: 'NanumSquare', sans-serif !important;
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
}

#sub-menu > li {
  padding: 16px 28px;
  border-bottom: 1px solid rgba(0,0,0,0.15);
  
}

#sub-menu > li >  a {
  color: black;
  text-decoration: none;
}

#main-menu > li:hover #sub-menu {
  opacity: 1;
  visibility: visible;
}

#sub-menu > li >  a:hover {
 text-decoration: underline;
}

#first{
 	border: 1px solid black;
 	text-align: center;
 }
#loginB, #userRB, #logout, #toMP{
	color: #08088A;
	font-weight: bold;
	background:  #C0EDFF;
	text-decoration: none;
}

#div1, #div2{
	border: 1px solid #C0EDFF;
	margin : auto;
	padding: 10px;
	text-align: center;
	width: 300px;
	height: 100px;
	border-style: outset;
}
</style>
</head>
<body>


<nav>
	<ul id="main-menu">
		<li><a href="<c:url value='/user/home' />">HOME</a></li>
		<li><a href="#">MYSTUDY</a>
				<ul id="sub-menu">
					<li><a href="<c:url value= '/studyGroup/myApplyList' />">나의 신청 현황</a></li>
					<li><a href="<c:url value='/studyGroup/myStudy' />">나의 스터디 보기</a></li>
				</ul>
		</li>
		
	
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="<c:url value='/studyGroup/create/form' />">스터디 등록</a></li>
				<li><a href="<c:url value='/studyGroup/search/form' />">스터디 검색</a></li>
				<li><a href="<c:url value='/studyGroup/list' />">스터디 그룹 보기</a></li>
			</ul>
		</li>
		<li><a href="<c:url value='/studyGroup/manageStudyList' />">MANAGE</a>
		</li>
	</ul>
</nav>

<br>
<br>
	<h3>
		<pre style="font-family: 'NanumSquare', sans-serif !important;">Study with me!
원하는 스터디 그룹을 찾고 싶으신가요?</pre>
	</h3>
	
	<c:if test= "${user.member_id eq null }" >
		<div id="div1">
			<br>
			<a href="<c:url value='/user/login/form' />" id="loginB">로그인</a> <br><br>
			<a href="<c:url value='/user/register/form' />" id="userRB">회원가입</a>
		</div>
	</c:if>



	<c:if test= "${user.member_id ne null }" >
		<div id="div2">
		이름: ${user.name } (로그인) <br>
 		<br>
		<a href="<c:url value='/user/view' >
			</c:url> " id="toMP">마이페이지로 이동</a>
		<br><br>
		<a href="<c:url value= '/user/logout' />" id="logout">로그아웃</a>
		</div>
	</c:if>


</body>
</html>