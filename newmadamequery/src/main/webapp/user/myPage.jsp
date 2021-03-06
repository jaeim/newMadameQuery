<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 </title>

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
 #title {
 		text-align: center;
 		font-size: 50px;
 }
 #forUpdate, #forHome {
 	diplay: inline;
 }
 
 #goHome, #updateB {
 	color: #08088A;
	font-weight: bold;
	background:  #C0EDFF;
	text-decoration: none;
 }
 #div1{
 	text-align: center;
 	border: 1px solid grey;
 	margin-bottom:  50px;
 	margin: 50px;
 	padding-top: 10px;
	padding-bottom: 50px;
	padding-left: 30px;
	padding-right:30px;
	width: 400px;
	
 }
 #table1{
 	margin: auto;
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

<div id="div1">
	<h4 id="title">My Page</h4>
	<table id="table1">
		<tr>
			<td>이름 </td>
			<td>&nbsp;${user.name }</td>
		</tr>
		<tr>
			<td>이메일 주소 </td>
			<td>&nbsp;${user.email }</td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td>&nbsp;${user.phone }</td>
		</tr>
		<tr>
			<td>소속 학교 명 </td>
			<td>&nbsp;${user.university }</td>
		</tr>
		<tr>
			<td>소속 학과명 </td>
			<td>&nbsp;${user.department }</td>
		</tr>
		<tr>
			<td>학년</td>
			<td>&nbsp;${user.grade }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>&nbsp;
				<c:set var= "gender" value="${ user.gender}" />
				<c:if test="${gender eq '1'}"> 
					<c:out value="남성" />
				</c:if>
				<c:if test="${gender eq '2'}">
					<c:out value="여성" />
				</c:if>
			</td>
		</tr>
	</table>
</div>
<div id="div2">
	<a href="<c:url value= '/user/home'>
		<c:param name='memberId' value='${user.member_id }' />
	</c:url>" id="goHome">홈으로</a>
	<a href="<c:url value= '/user/update/form' >
	<c:param name='userId' value='${user.member_id }' />
	</c:url>" id="updateB">수정하기</a>	
	
</div>
<br>
</body>
</html>