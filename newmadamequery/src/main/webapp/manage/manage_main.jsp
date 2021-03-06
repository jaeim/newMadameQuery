<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.util.*" %>
<%@page import = "model. *" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
    request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyGroup Manage</title>
<!--  (자신이 팀장인 스터디 그룹 리스트 출력) -->
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
th{
	background : #084B8A;
	color: white;
}

#manageT{
	text-align: center;
	border: 1px solid #E6E6E6;
	width: 500px;
	height: auto;
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
#gname{
	color: blue;
}
</style>
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

<h2>스터디그룹 관리</h2>
<table id="manageT">
	<tr>
		<th>스터디그룹 명 </th>
		<th>인원</th>
		<th>기간</th>
	</tr>
	
	<c:forEach var="sg" items="${groupList}">
		<tr>
			<td>
			<a href="<c:url value='/studyGroup/manageStudy'>
						   <c:param name='groupId' value='${sg.groupId}'/>
						 </c:url>" id="gname">
				  ${sg.groupName}</a>
			</td>
			<td>
				<c:set var="num" value="${sg.numberOfUsers}" />
				<c:if test="${num eq '3' }" >
					<c:out value="3명" />
				</c:if>
				<c:if test="${num eq '4' }" >
					<c:out value="4명" />
				</c:if>
				<c:if test="${num eq '5' }" >
					<c:out value="5명" />
				</c:if>
				<c:if test="${num eq '6' }" >
					<c:out value="6명" />
				</c:if>
				<c:if test="${num eq '7' }" >
					<c:out value="7명" />
				</c:if>
				<c:if test="${num eq '8' }" >
					<c:out value="8명" />
				</c:if>
				<c:if test="${num eq '9' }" >
					<c:out value="9명" />
				</c:if>
				<c:if test="${num eq '10' }" >
					<c:out value="10명" />
				</c:if>
				<c:if test="${num eq '11' }" >
					<c:out value="10명이상" />
				</c:if>
				<c:if test="${num eq '0' }" >
					<c:out value="상관없음" />
				</c:if>
			</td>
			<td>
				<c:if test="${sg.term == '0' }">
						무기한
					</c:if>
					<c:if test="${sg.term != '0' }" >
						${sg.term}개월
					</c:if>
			</td>
		</tr>
	</c:forEach>
	
</table>

</body>
</html>