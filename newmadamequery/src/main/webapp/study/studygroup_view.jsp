<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>    
<%@page import="model.*, controller.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
	//request.setAttribute("StudyGroup", group);
	//StudyGroup group= (StudyGroup) request.getAttribute("StudyGroup"); //하나의 객체를 받아옴.
%>
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
 	#groupInfo{
 		border: 1px solid black;
 		
 		background-color:  #C0EDFF;
 		width: 500px;
 		height: 400px;
 		float: left;
 		color: black;
 	}
 	td{
 		border: 1px solid black;
 		text-align: center;
 	}
 	#memberList{
 		border: 1px solid black;
 		text-align: center;
 		background-color: green;
 		width: 50%;
 		height: auto;
 		float: right;
 	}
 	#addToMember {
 		text-align: center;
 		background-color: #fffcde;
 		width: 50%;
 		height: auto;
 		float: right;
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
<br><br>

<div>
	
	<div> <!--  StudyGroup 하나의 객체 반환 -->
		<table id="groupInfo">
			<tr>
				<td colspan="2">스터디명</td>
				<td colspan="2">${StudyGroup.groupName }</td>
			</tr>
			<tr>
				<td colspan="2">소개</td>
				<td colspan="2">${StudyGroup.description}</td>
			</tr>
			<tr>
				<td >스터디 방식</td>
				<td>${StudyGroup.meetingType }</td>
				<td>성별</td>
				<td>${StudyGroup.genderType }</td>
			</tr>
			<tr>
				<td>학년</td>
				<td>${StudyGroup.gradeType}</td>
				<td>기간</td>
				<td>${StudyGroup.term }</td>
			</tr>
			
		</table>
	</div>
	
	<!--  StudyGroup -> groupUser를 가져오면 될 듯 -->
	
	<div > <!--  멤버의 수, 이름, 학과, 학년 보여주기 -->
	
		<table id="memberList">
			<caption>GroupMembers</caption>
			<tr>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
			</tr>
			<c:forEach var="sg" items="${StudyGroup.groupUsers}">
				<tr>
					<td>${sg.name}</td>
					<td>${sg.department }</td>
					<td>${sg.grade }</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	
	<div id="addToMember">
		<%@include file="registerStudy.jsp" %>
	</div>
</div>
<br><br>

<!-- <button onClick="location.href='studygroup_list.jsp'">GoBack</button>  다시 되돌아 가기 버튼 -->
</body>
</html>