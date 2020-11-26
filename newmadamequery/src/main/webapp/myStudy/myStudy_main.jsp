<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<StudyGroup> groupList = (List<StudyGroup>) request.getAttribute("groupList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내가 속한 스터디그룹 리스트 출력</title>
<!--  하나의 스터디를 선택할 경우 myStudy_view.jsp로 이동 (정보 전달)-->
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
	border-bottom: 1px solid black;
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
<div> <!-- 내가 속한 스터디 그룹의 리스트 가져와서 보여주기 , 어떤 정보 가져올건지 정하고 table 다시만들기-->
	<table id="groupList">
		<tr>
			<th>스터디 그룹 명</th>
			<th>인원 수</th>
			<th>날짜 </th>
		</tr>
		
		<% // 스터디 그룹의 리스트 만큼 tr 생성 %>
		<c:forEach var="group" items="${groupList}">
			<tr>
				<td>
					<a href="<c:url value='/post/list'>
						   <c:param name='groupId' value='${group.groupId}'/>
						 </c:url>">${group.groupName} </a> 
				</td> <!-- 스터디그룹 명 클릭 시에 해당 스터디그룹의 게시판으로 이동 -->
				<td>${group.numberOfUsers }</td>
				<td>${group.createdDate}</td>
				
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>