<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "model.*" import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹 관리 </title>
<!-- (리스트에서 출력해서 들어가면 그 스터디 그룹에 대한 정보 보여주기), 삭제 및 수락 은 여기서  -->
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
 		
 	#main1{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-top: 50px;
 		margin-bottom: 20px;
 		width: 700px;
 		height: 30px;
 		}
 	#main2 {
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-top: 10px;
 		margin-bottom: 20px;
 		width: 700px;
 		height: 30px;
 	}
 	#userlist{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-bottom: 50px;
 		width: 700px;
 		height: 30px;
 		
 	}
 	td {
 		width: 170px;
 		bgcolor: "ffffff";
 		padding-left: 10;
 	}
 	tr{
 		border: 1px solid black;
 	}
 	mark{
 		background-color: #C0EDFF;
 	}
 </style>
 
 <script>
function memberDelete() {
	return confirm("정말 삭제하시겠습니까?");		
}
function memberAccept() {
	return confirm("멤버로 수락하시겠습니까?");
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
<%
//확인을 위한 용도 
	StudyGroup group = (StudyGroup)request.getAttribute("group");
	ArrayList<Application> applyList = (ArrayList<Application>)request.getAttribute("applyList");
	ArrayList<User> groupMemberList = (ArrayList<User>)request.getAttribute("groupMemberList");
%>
<table id="main1">
		<tr>
			<td>스터디그룹 명</td>
			<td> ${group.groupName} </td>
			<td>인원</td>
			<td> ${group.numberOfUsers } </td>
			<td>기간</td>
			<td> ${group.term }</td>
		</tr>
</table>

<table id="main2">
	<tr>
		<td>subjectId(과목)</td>
		<td>${group.subjectId} </td>
		<td>스터디 방식</td>
		<td>${group.meetingType} </td>
	</tr>
	<tr>
		<td>개설 일자</td>
		<td>${group.createdDate }</td>
		<td>성별</td>
		<td>${group.genderType }</td> <!-- 출력 사항은 나중에 수정 -->
	</tr>
	<tr>
		<td>팀장</td>
		<td>${group.leaderId }</td>
		<td>학년</td>
		<td>${group.gradeType }</td>
	</tr>
	<tr>
		<td>소개</td>
		<td>${group.description }</td>
	</tr>
</table>
<table id= "userlist">
	<tr>
		<td>이름</td>
		<td>팀원 관리</td>
	</tr>
	
	<%  //if()...그 스터디그룹의 팀원 가져와서 팀원 수 만큼 <tr> 생성해서 list 출력. %>
	
	<c:forEach var="member" items="{sg.memberList}">
		<tr>
			<td>이름 출력</td>
			<td>
				<a href="<c:url value='/studyGroup/manageGroup/delete' /> " onClick="return memberDelete(); "> 삭제</a>
				<a href="<c:url value='/studyGroup/manageStudy/applyAccept'>
					<c:param name='groupId' value='${group.groupId }'/>
					</c:url>" onClick= "return memberAccept(); ">수락</a>
			</td>
		</tr>
	</c:forEach>
	
</table>
<div id="update">
	
	<mark>
		<a href="<c:url value='/studyGroup/mangeGroup/update/form' >
		<c:param name='groupId' value='${group.groupId}' />
		</c:url> ">정보 수정</a>
	</mark>
	
</div>
</body>
</html>