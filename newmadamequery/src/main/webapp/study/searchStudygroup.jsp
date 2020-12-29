<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="model.*, controller. *" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디그룹 검색</title>
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
 		
#intro{
	font-size: 15px;
}
#searchT{
	border: 1px solid #BDBDBD;
	width: 500px;
	heigh: auto;
	text-align: center;
	margin: auto;
	padding: 10px;

}
#gSearchB {
	background : #084B8A;
	color: white;
	float: right;
}
th{
	width: 150px;
	background : #084B8A;
	color: white;
}

#result {
	margin-bottom: 30px;
}

#resultTable{
		border: 1px solid #E6E6E6;
		width: 500px;
		height: auto;
		margin: 0;
		text-align: center;
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

<div id="intro">
<h5>
	<pre style="font-family: 'NanumSquare', sans-serif !important;">StudyGroup
원하는 스터디 모임을 검색해보세요.
스터디 모임 검색을 위한 조건을 입력 및 선택하세요.</pre></h5>
</div>


<div id="search">
	<h2 style="text-align: center;">스터디 검색</h2>
	
	<form name="form" method="POST" action="<c:url value='/studyGroup/search' />" >
		<table id="searchT">
			<tr>
				<th>스터디 방식</th>
				<td>
					<select name="meetingType">
						<option value="-1" <c:if test="${meetingType eq null}">selected</c:if>>-선택안함-</option>
						<option value="online" <c:if test="${meetingType eq 'online'}">selected</c:if>>online</option>
						<option value="offline" <c:if test="${meetingType eq 'offline'}">selected</c:if>>offline</option>
						<option value="blended" <c:if test="${meetingType eq 'blended'}">selected</c:if>>blended</option>
					</select>
					
				</td>
			</tr>
			<tr>
				<th>수행기간</th>
				<td>
					<select name="term">
						<option value="-1" <c:if test="${term eq null}">selected</c:if>>-선택안함-</option>
						<option value="1" <c:if test="${term eq '1'}">selected</c:if>>1개월</option>
						<option value="3" <c:if test="${term eq '3'}">selected</c:if>>3개월</option>
						<option value="6" <c:if test="${term eq '6'}">selected</c:if>>6개월</option>
						<option value="9" <c:if test="${term eq '9'}">selected</c:if>>9개월</option>
						<option value="12" <c:if test="${term eq '12'}">selected</c:if>>12개월</option>
						<option value="0" <c:if test="${term eq '0'}">selected</c:if>>무기한</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>모집성별</th>
				<td>
					<select name="genderType">
						<option value="-1" <c:if test="${genderType eq null }">selected</c:if>>-선택안함- </option>
						<option value="1" <c:if test="${genderType eq '1' }">selected</c:if>>남성</option>
						<option value="2" <c:if test="${genderType eq '2' }">selected</c:if>>여성</option>
						<option value="0" <c:if test="${genderType eq '0' }">selected</c:if>>상관없음</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>모집학년</th>
				<td>
					<select name="gradeType">		
						<option value="-1" <c:if test="${gradeType eq null}">selected</c:if>>-선택안함-</option>
						<option value="2" <c:if test="${gradeType eq '2'}">selected</c:if>>2학년 이상</option>
						<option value="3" <c:if test="${gradeType eq '3'}">selected</c:if>>3학년 이상</option>
						<option value="4" <c:if test="${gradeType eq '4'}">selected</c:if>>4학년 이상</option>
						<option value="0" <c:if test="${gradeType eq '0'}">selected</c:if>>상관없음</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td>
					<select name="numberOfUsers">
							<option value="-1" <c:if test="${num eq null}">selected</c:if>>-선택안함-</option>
							<option value="3" <c:if test="${num eq '3'}">selected</c:if>>3</option>
							<option value="4" <c:if test="${num eq '4'}">selected</c:if>>4</option>
							<option value="5" <c:if test="${num eq '5'}">selected</c:if>>5</option>
							<option value="6" <c:if test="${num eq '6'}">selected</c:if>>6</option>
							<option value="7" <c:if test="${num eq '7'}">selected</c:if>>7</option>
							<option value="8" <c:if test="${num eq '8'}">selected</c:if>>8</option>
							<option value="9" <c:if test="${num eq '9'}">selected</c:if>>9</option>
							<option value="10" <c:if test="${num eq '10'}">selected</c:if>>10</option>
							<option value="11" <c:if test="${num eq '11'}">selected</c:if>>10명 이상</option>
					</select>
				</td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="검색하기" id="gSearchB" onClick="changeSelected()">
	</form>
</div>


<!-- 스터디그룹 검색 결과 출력 -->
	<br>
	
	<c:if test="${not empty groupList || searchFailed ne null}">
	<h2>스터디 검색 결과</h2>
		<div id ="result">
		<table id="resultTable" style="width: 850px">
		<tr>
			<th>번호</th>
			<th>그룹명</th>
			<th>스터디 방식</th>
			<th>기간</th>
			<th>모집성별</th>
			<th>모집학년</th>
			<th>모집인원</th>
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
				<td>
					<c:if test="${sl.term == '0' }">
						무기한
					</c:if>
					<c:if test="${sl.term != '0' }" >
						${sl.term}개월
					</c:if>
				</td>
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
				<td>
					<c:set var="num" value="${sl.numberOfUsers }" />
					<c:if test="${num eq 0}">
						<c:out value="상관없음" />
					</c:if>
					<c:if test="${num eq 11}">
						<c:out value="10명이상" />
					</c:if>
					<c:if test="${gr ne 0 || num ne 11}">
						${sl.numberOfUsers }명
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</table>
		</div>
	</c:if>

</body>
</html>