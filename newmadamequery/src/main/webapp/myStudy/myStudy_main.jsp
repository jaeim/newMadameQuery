<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<%@page import="model.*, controller. *" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<StudyGroup> groupList = (List<StudyGroup>) request.getAttribute("groupList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>myStudyGroup List</title>
<script>
	<% 
		String ex = (String)request.getAttribute("exception");
		if(ex != null){
			if(ex.equals("deleteException")){
				out.println("alert('팀장은 그룹에서 탈퇴할 수 없습니다.');");
			}
		}
	%>

</script>
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

#groupList{
	text-align: center;
	border: 1px solid #E6E6E6;
	font-family: "Arial";
	width: 500px;
	height: auto;
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
<h2>나의 스터디</h2>
<table id="groupList">
		<tr>
			<th>그룹 명</th>
			<th>모집인원</th>
			<th>생성일</th>
			<th>&nbsp;</th>
		</tr>
		
		<c:forEach var="group" items="${groupList}">
			<tr>
				<td>
					<a href="<c:url value='/post/list'>
						   <c:param name='groupId' value='${group.groupId}'/>
						 </c:url>">${group.groupName} </a> 
						 
				</td>
				<td>${group.numberOfUsers}</td>
				<td>${group.createdDate}</td>
				<td><a href="<c:url value='/studyGroup/myStudy/dropOut'>
						   <c:param name='groupId' value='${group.groupId}'/>
						 </c:url>">탈퇴</a></td>
			</tr>
		</c:forEach>
</table>

</body>
</html>