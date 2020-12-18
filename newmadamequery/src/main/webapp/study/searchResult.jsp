<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %> 
<%@page import="java.util.*" %>    
<%@page import="model.*, controller. *" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 그룹 검색 결과</title>
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
#resultTable{
		border: 1px solid #E6E6E6;
		width: 500px;
		height: auto;
		margin: 0;
		text-align: center;
	}
	
th{
	background : #084B8A;
	color: white;
}
a{
	text-decoration: none;
	}
a:link {
	color: black;
}
a:visited {
	color: black;
}
#bc{
	color: blue;
}
</style>

<style>
	
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

	<br><br>

	<div id ="result">
	<table id="resultTable">
	<tr>
		<th>번호</th>
		<th>그룹명</th>
		<th>스터디 방식</th>
		<th>기간</th>
		<th>모집성별</th>
		<th>모집학년</th>
	</tr>
	<c:if test="${searchFailed}">
		<tr>
			<td colspan="6"><c:out value="${exception.getMessage()}" /></td>
		</tr>
	</c:if>
	<c:forEach var="sl" items="${groupList}" varStatus= "status"> 
		<tr>
			<td><c:out value="${status.count}" /></td>
			<td>
				<a href= "<c:url value='/studyGroup/view' >
					<c:param name='groupId' value='${sl.groupId }' />
					</c:url>" id="bc">${sl.groupName }</a>
			</td>
			<td>${sl.meetingType }</td>
			<td>${sl.term}개월 </td>
			<td>
			<c:set var="gen" value="${sl.genderType }" />
			<c:if test="${gen eq '0'}" >
				<c:out value="상관없음" />
			</c:if>
			<c:if test="${gen eq '1'}" >
				<c:out value="남성" />
			</c:if>
			<c:if test="${gen eq '2'}" >
				<c:out value="여성" />
			</c:if>
			</td>
			<td>
				<c:set var="gr" value="${sl.gradeType }" />
				<c:if test="${gr eq '0'}">
					<c:out value="상관없음" />
				</c:if>
				<c:if test="${gr eq '1'}">
					<c:out value="1학년" />
				</c:if>
				<c:if test="${gr eq '2'}">
					<c:out value="2학년" />
				</c:if>
				<c:if test="${gr eq '3'}">
					<c:out value="3학년" />
				</c:if>
				<c:if test="${gr eq '4'}">
					<c:out value="4학년" />
				</c:if>
				<c:if test="${gr eq '5'}">
					<c:out value="4학년 이상" />
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>