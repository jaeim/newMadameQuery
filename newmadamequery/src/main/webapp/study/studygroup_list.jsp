<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹 목록 보기</title>

<script>

<% 
	out.println("window.onload = function showResult() {");
	String rst = String.valueOf(request.getAttribute("errorResult"));

	if(rst != null){
		if(rst.equals("gender")){
			out.println("alert('팀장의 성별과 조건의 성별이 어긋납니다'); ");
		}
		if(rst.equals("grade")){
			out.println("alert('팀장의 학년과 조건의 학년이 어긋납니다'); ");
	}
}
out.println("}");
%>

</script>

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
#allList{
	width: 600px;
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
#bc{
	color: blue;
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

<div>
<h5>
	<pre style="font-family: 'NanumSquare', sans-serif !important;">StudyGroup
마음에 맞는 스터디를 찾아보세요!
	</pre>
	<p>*인원모집이 완료된 스터디그룹은 조회할 수 없습니다*</p>
</h5>	
</div>
<!-- 모든 스터디 그룹을 리스트로 보여주기 -->

<table id="allList">
	<tr> 
		<th>스터디그룹 명 </th>
		<th>소개</th>
		<th>기간</th>
	</tr>
	<c:forEach var="group" items="${groupList}"> <!-- List<StudyGroup>이 반환됨. -->
		<c:set var="maxNum" value="${group.numberOfUsers}" />
		<c:set var="groupUsers" value="${fn:length(group.groupUsers)}" />
		<c:if test="${maxNum ne groupUsers}" >
			<tr>
				<td>
				<a href= "<c:url value='/studyGroup/view' >
					<c:param name='groupId' value='${group.groupId}' />
					</c:url>" id="bc">${group.groupName}</a>
				</td>
				<td>${group.description}</td>
				<td>
					<c:if test="${group.term == '0' }">
						무기한
					</c:if>
					<c:if test="${group.term != '0' }" >
						${group.term}개월
					</c:if>
				</td>
			</tr>
		</c:if>
	</c:forEach>
</table>
</body>

</html>