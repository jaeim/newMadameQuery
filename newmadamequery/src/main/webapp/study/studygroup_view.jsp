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
<%
	String result = request.getParameter("result");

	out.println("<script>");
	if(result != null){
		if(result.equals("1")){
			out.println("alert('신청에 성공하였습니다.');");
			// 버튼클릭시 내 신청현황으로 이동...
		}else if(result.equals("3")){
			out.println("alert('성별 조건에 맞지 않기 때문에 신청에 실패하였습니다.');");
		}else if(result.equals("-1")){
			out.println("alert('이미 해당 그룹에 신청하였습니다.');");
		}else if(result.equals("2")){
			out.println("alert('이미 해당 그룹에 존재하는 멤버입니다.');");
		}else if(result.equals("4")){
			out.println("alert('학년 조건에 맞지 않기 때문에 신청에 실패하였습니다.');");
		}
	}
	out.println("</script>");
%>

<style>
body {
  margin: 0;
  padding: 0;
  font-family: 'NanumSquare', sans-serif !important;
  display: inlinel;
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
 
 
#groupDiv{
	float: left;
	width: 50%;
	height: auto;
	border: 1px solid #E6E6E6;
	margin-left: 150px;
}
#groupInfo{
	margin: auto;
	padding: 15px;
	width: auto;
	heigth: 300px;
}
#memberDiv{
	float: right;
	width: 300px;
	heigth: auto;
	border: 1px solid #E6E6E6;
	margin-right: 150px;
}
#memberList{
	margin: auto;
	padding: 15px;
}
th, #bc, #bc2{
	background : #084B8A;
	color: white;
	text-align: center;
	padding: 5px;
	
}
#bc2{
	width: 80px;
}
#addMDiv{
	float: right;
	width: 300px;
	heigth: 200px;
	border: 1px solid #E6E6E6;
	margin-right: 150px;
}
#applyT{
	text-align: center;
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

<div id="groupDiv">
		<table id="groupInfo">
			<tr>
				<td colspan="2" id="bc">스터디명</td>
				<td colspan="2">${StudyGroup.groupName}</td>
			</tr>
			<tr>
				<td colspan="2" id="bc" >소개</td>
				<td colspan="2">${StudyGroup.description}</td>
			</tr>
			<tr>
				<td colspan="2" id="bc" >모집인원</td>
				<td colspan="2">${StudyGroup.numberOfUsers}명</td>
			</tr>
			<tr>
				<td id="bc2">스터디 방식</td>
				<td style="width: 15px;">${StudyGroup.meetingType }</td>
				<td id="bc2">모집성별</td>
				<td>
					<c:set var="gen" value="${StudyGroup.genderType }" />
					<c:if test="${gen eq '1'}">
						<c:out value="남성" />
					</c:if>
					<c:if test="${gen eq '2'}">
						<c:out value="여성" />
					</c:if>
					<c:if test="${gen eq '0'}">
						<c:out value="상관없음" />
					</c:if>
				</td>
			</tr>
			<tr>
				<td id="bc2">모집학년</td>
				<td style="width: 15px;">
					<c:set var="grade" value="${StudyGroup.gradeType}" />
					<c:if test="${grade eq '0'}">
						<c:out value="상관없음" />
					</c:if>
					<c:if test="${grade != '0'}">
						<c:out value="${grade}" />학년
					</c:if>
				</td>
				<td id="bc2">수행기간</td>
				<td >${StudyGroup.term }개월</td>
			</tr>
		</table>
</div>

<div id="memberDiv"> 
			
		<table id="memberList" style="width: 250px;">
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

<div id="addMDiv">
<form name="form" method="POST" action="<c:url value= '/studyGroup/apply' >
	<c:param name="groupId" value="${StudyGroup.groupId }"/>
	</c:url>">
<table id="applyT">
<tr>
	<td><h5 style="color: red;">스터디 조건에 맞는 분만 신청이 가능합니다.</h5></td>
</tr>
<tr>
	<td><input type="text" name="comments" /> </td>
</tr>
<tr>
	<td><input type="submit" value="팀원 신청하기"/></td>
</tr>

	
</table>
	
</form>
<br>
</div>

</body>
</html>