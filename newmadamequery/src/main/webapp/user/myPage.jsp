<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 내 정보 받아와서 보여주기 </title>
<!-- [USERMAN1 - user_modify.jsp, user_view.jsp 참고할 것.] -->
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
 #title {
 		text-align: center;
 		font-size: 50px;
 		font-family: Arial;
 }
 #joinTable, #lectureTable{
 		text-align: center;
 		border: 1px solid black;
 		margin-left: auto;
 		margin-right: auto;
 		font-family: Arial;
 }
 #joinTable{
 		width: 550px;
 		height: 500px;
 }
 #lectureTable, #tags{
 		border: 1px solid black;
 		width: 350px;
 		height: 100px;
 		margin-left: auto;
 		margin-right: auto;
 }
 #forUpdate, #forHome {
 	diplay: inline;
 }
</style>

<script type="text/javascript">
function home(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>

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

<div>
	<p id="title">My Page</p>
	<table>
		<tr>
			<td>이름: </td>
			<td>${user.name }</td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td>${user.phone }</td>
		</tr>
		<tr>
			<td>이메일 주소: </td>
			<td>${user.email }</td>
		</tr>
		<tr>
			<td>소속 학교 명: </td>
			<td>${user.university }</td>
		</tr>
		<tr>
			<td>소속 학과명: </td>
			<td>
				${user.department }
			</td>
		</tr>
		<tr>
			<td>학년</td>
			<td>${user.grade }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<c:set var= "gender" value="${ user.gender}" />
				<c:if test="${gender eq '1'}"> 
					<c:out value="남자" />
				</c:if>
				<c:if test="${gender eq '2'}">
					<c:out value="여자" />
				</c:if>
			</td>
		</tr>
	</table>
	<a href="<c:url value= '/user/mainPage' />">홈으로</a>
	<a href="<c:url value= '/user/update/form' >
	<c:param name='member_id' value='${user.member_id }' />
	</c:url>">수정하기</a>	
</div>
<br>
</body>
</html>