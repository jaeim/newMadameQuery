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
 		
 	#main1 ,#main2 {
 		text-align: center;
 		border: 1px solid #BDBDBD;
 		margin: 20px;
 		width: 700px;
 		height: 30px;
 		}
 	#userlist, #applyList{
 		text-align: center;
 		border: 1px solid #BDBDBD;
 		margin-bottom: 50px;
 		width: 700px;
 		height: 30px;
 		
 	}
 th, #bc{
 		width: 150px;
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
#acceptB, #rejectB{
	float: right;
}
#acceptB {color: blue;}
#rejectB {color: red;}

#gManageUpdateB, #gDeleteB {
		background: #E6E6E6;
		color: black;
		float: right;
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

<table id="main1">
		<tr>
			<td id="bc">스터디그룹 명</td>
			<td>${studyGroup.groupName } </td>
			<td id="bc">인원</td>
			<td>
				<c:set var="num" value="${studyGroup.numberOfUsers }" />
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
			<td id="bc">기간</td>
			<td>
				<c:set var="term" value="${studyGroup.term }" />
				<c:if test="${term eq '1' }" >
					<c:out value="1개월" />
				</c:if>
				<c:if test="${term eq '3' }" >
					<c:out value="3개월" />
				</c:if>
				<c:if test="${term eq '6' }" >
					<c:out value="6개월" />
				</c:if>
				<c:if test="${term eq '9' }" >
					<c:out value="9개월 " />
				</c:if>
				<c:if test="${term eq '12' }" >
					<c:out value="12개월 " />
				</c:if>
				<c:if test="${term eq '0' }" >
					<c:out value="상관없음" />
				</c:if>
			</td>
		</tr>
</table>

<table id="main2">
	<tr>
		<td id="bc">과목 id</td>
		<td>${studyGroup.subjectId} </td>
		<td id="bc">스터디 방식</td>
		<td>${studyGroup.meetingType} </td>
	</tr>
	<tr>
		<td id="bc">개설 일자</td>
		<td>${studyGroup.createdDate }</td>
		<td id="bc">성별</td>
		<td>
			<c:set var="gen" value="${studyGroup.genderType }" />
			<c:if test="${gen eq '0' }" >
				<c:out value="상관없음" />
			</c:if>
			<c:if test="${gen eq '1'}" >
				<c:out value="남성" />
			</c:if>
			<c:if test="${gen eq '2'}" >
				<c:out value="여성" />
			</c:if>
		</td>
	</tr>
	<tr>
		<td id="bc">팀장</td>
		<td>${studyGroup.leaderName}</td>
		<td id="bc">학년</td>
		<td >
			<c:set var="gr" value="${studyGroup.gradeType }" />
			<c:if test="${gr eq '1' }" >
				<c:out value="1학년" />
			</c:if>
			<c:if test="${gr eq '2' }" >
				<c:out value="2학년" />
			</c:if>
			<c:if test="${gr eq '3' }" >
				<c:out value="3학년" />
			</c:if>
			<c:if test="${gr eq '4' }" >
				<c:out value="4학년" />
			</c:if>
			<c:if test="${gr eq '5' }" >
				<c:out value="4학년 이상" />
			</c:if>
			<c:if test="${gr eq '0' }" >
				<c:out value="상관없음" />
			</c:if>
		</td>
	</tr>
	<tr>
		<td id="bc">소개</td>
		<td>${studyGroup.description }</td>
	</tr>
</table>
<h3>멤버 리스트</h3>
<table id= "userlist">
	<tr>
		<th>&nbsp;</th>
		<th>이름</th>
		<th>학교</th>
		<th>학과</th>
		<th>학년</th>
		<th>성별</th>
	</tr>
	
	<c:forEach var="gmList" items="${studyGroup.groupUsers}" varStatus="status" >
		<tr>			
			<td><c:out value='${status.count }' /></td>
			<td>${gmList.name }</td>
			<td>${gmList.university }</td>
			<td>${gmList.department }</td>
			<td>${gmList.grade }</td>
			<td>
				<c:set var="gr" value="${gmList.gender}" />
				<c:if test="${gr eq '1'}"> 
					<c:out value="남성" />
				</c:if>
				<c:if test="${gr eq '2'}"> 
					<c:out value="여성" />
				</c:if>
			</td>
		</tr>
	</c:forEach>
	
</table>
<h3>신청자 리스트</h3>
<table id="applyList">
	
		<tr>
			<th>&nbsp;</th>
			<th>멤버 id</th>
			<th>이름</th>
			<th>작성한 코멘트</th>
			<th>신청 날짜</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
		
		<c:forEach var="aList" items="${applyList}" varStatus="status" >
		<tr>
			<td><c:out value="${status.count }" />
			<td>${aList.memberId}</td>
			<td>${aList.memberName}</td>
			<td style="width: 300px;">${aList.comment }</td>
			<td>${aList.applyDate }</td>
			<td><a href= "<c:url value='/studyGroup/manageStudy/applyAccept' > 
				<c:param name="groupId" value="${studyGroup.groupId}" />
				<c:param name="memberId" value="${aList.memberId}" />
				<c:param name="isAccepted" value="true" />
				</c:url>" id="acceptB">수락</a></td>
			<td><a href= "<c:url value='/studyGroup/manageStudy/applyAccept' > 
				<c:param name="groupId" value="${studyGroup.groupId}" />
				<c:param name="memberId" value="${aList.memberId}" />
				<c:param name="isAccepted" value="false" />
				</c:url>" id="rejectB">거절</a></td>
	</c:forEach>
</table>

<table>
		<tr>
			<td><a href="<c:url value='/studyGroup/manageStudy/update/form' >
				<c:param name='groupId' value='${studyGroup.groupId}' />
				</c:url> " id="gManageUpdateB">정보 수정</a>
			</td>
			<td> <a href="<c:url value='/studyGroup/manageStudy/delete' >
				<c:param name="groupId" value="${studyGroup.groupId }" />
				</c:url>" id="gDeleteB">그룹 삭제</a>
			</td>
		</tr>
</table>
<br><br>
</body>
</html>