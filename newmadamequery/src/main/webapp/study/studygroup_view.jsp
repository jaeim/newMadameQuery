<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디그룹 _view</title>


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
 		background-color:  #E6E0F8;
 		width: auto;
 		height: auto;
 		color: black;
 	}
 	td{
 		border: 1px solid black;
 		text-align: center;
 	}
 	#memberList{
 		text-align: center;
 		background-color: #E6E0F8;
 		width: 350px;
 		height:100px;
 		margin: 30px;
 		padding: 10px;
 		
 	}
 	#addToMember {
 		text-align: center;
 		background-color: #FBEFFB;
 		width: 350px;
 		height: auto;
 		margin: 30px;
 		padding: 10px;
 		
 	}
 
</style>
</head>
<body>
	<nav>
	<ul id="main-menu">
		<li><a href="<c:url value='/user/home' />">HOME</a></li>
		<li><a href="#">MYSTUDY</a>
				<ul id="sub-menu">
					<li><a href="<c:url value= '/studyGroup/myApplyList'>
						<c:param name='userId' value='${user.member_id}' />
						</c:url>">나의 신청 현황</a>
					</li>
					<li><a href="<c:url value='/studyGroup/myStudy'>
						<c:param name='userId' value='${user.member_id}' />
						</c:url>">나의 스터디 보기</a>
					</li>
				</ul>
		</li>
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="<c:url value='/studyGroup/create/form' />">스터디 등록</a></li>
				<li><a href=<c:url value='/studyGroup/search/form' />>스터디 검색</a></li>
				<li><a href="<c:url value='/studyGroup/list' />">스터디 그룹 보기</a></li>
			</ul>
		</li>
		<li><a href="<c:url value='/studyGroup/manageStudyList' />">MANAGE</a>
		</li>
	</ul>
</nav>
<br><br>


	<div> <!--  ViewUserController에서부터  StudyGroup 하나의 객체 반환 , -->
		<table id="groupInfo">
			<tr>
				<td colspan="2">스터디명</td>
				<td  colspan="2">${StudyGroup.groupName}</td>
			</tr>
			<tr>
				<td colspan="2">소개</td>
				<td colspan="2">${StudyGroup.description}</td>
			</tr>
			<tr>
				<td>스터디 방식</td>
				<td>${StudyGroup.meetingType }</td>
				<td >성별</td>
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
	
	<!-- StudyGroup -> groupUser를 가져오면 될 듯  -->
	
	<div > <!--  멤버의 수, 이름, 학과, 학년 보여주기  -->
	

		<!-- 멤버 수 가져와서 그 만큼 table tr 생성해서 보여주기 -->
		
		<table id="memberList">
			<caption>GroupMembers</caption>
			<tr>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
			</tr>
			<!-- user 수 만큼 출력됨. -->
			<c:forEach var="sgUsers" items="${StudyGroup.groupUsers}">
				<tr>
					<td>&nbsp;${sgUsers.name}</td>
					<td>&nbsp;${sgUsers.department }</td>
					<td>&nbsp;${sgUsers.grade }</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	<!-- 여기로 넘어올 때 하나의 StudyGroup 객체를 받아왔어. -->
<div id="addToMember">
 
<form name="form" method="POST" action="<c:url value= '/studyGroup/apply' >
	<c:param name="groupId" value="${StudyGroup.groupId }"/>
	</c:url>">
	<c:out value="${member_id}" />
	<input type="text" name="comments" /> 
	<input type="submit" value="팀원 신청하기"/>
</form>


</div>

</body>
</html>