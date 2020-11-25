<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="model.*, controller.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked") 
	List<StudyGroup> groupList = (List<StudyGroup>)request.getAttribute("groupList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹 보기</title>

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
 		
		#intro{
			font-family: Arial;
			font-size: 15px;
		}
		#add, table{
			text-align:center;
			margin: auto;
			
		}
		table{
			border: 2px solid black;
			width: 700px;
			height: 200px;
			font-family: Arial;

		}
		
	#allList{
		border: 1px solid black;
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
	</ul>
</nav>

<div id="intro">
	<pre>
	StudyGroup
	마음에 맞는 스터디를 찾아보세요!
	(모든 스터디 그룹 보여주기)
	</pre>		
</div>

<!-- 모든 스터디 그룹을 리스트로 보여주기 -->
<table id="allList">
	<tr> 
		<th>스터디그룹 명 </th>
		<th>소개 </th>
		<th>기간</th>
	</tr>
	
	<c:forEach var="gl" items="${groupList }">
		<tr>
			<td><a href= "<c:url value='/studyGroup/view' >
				<c:param name="groupId" value="${gl.groupId }" />
				</c:url>">${gl.groupName}</a></td>
			<td>${gl.description}</td>
			<td>${gl.term }</td>
		</tr>
	</c:forEach>
</table>
</body>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹 보기</title>

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
 		
		#intro{
			font-family: Arial;
			font-size: 15px;
		}
		#add, table{
			text-align:center;
			margin: auto;
			
		}
		table{
			border: 2px solid black;
			width: 700px;
			height: 200px;
			font-family: Arial;

		}
		
	#allList{
		border: 1px solid black;
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

<div id="intro">
	<pre>
	StudyGroup
	마음에 맞는 스터디를 찾아보세요!
	(모든 스터디 그룹 보여주기)
	</pre>		
</div>
<!-- 모든 스터디 그룹을 리스트로 보여주기 -->
<table id="allList">
	<tr> 
		<th>스터디그룹 명 </th>
		<th>소개</th>
		<th>기간</th>
	</tr>
	<c:forEach var="group" items="${groupList}"> <!-- List<StudyGroup>이 반환됨. -->
		<tr>
			<td><a href= "<c:url value='/studyGroup/view' >
				<c:param name="groupId" value='${group.groupId}' />
				</c:url>
">${group.groupName}</a></td>
			<td>${group.description}</td>
			<td>${group.term}</td>
		</tr>
	</c:forEach>
</table>
</body>
>>>>>>> branch 'dev' of https://github.com/jaeim/newMadameQuery.git
</html>