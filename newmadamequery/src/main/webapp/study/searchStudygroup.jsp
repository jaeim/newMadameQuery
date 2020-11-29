<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="model.*, controller. *" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디그룹 검색</title>
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
 		
#intro{
	font-family: Arial;
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
	<pre>StudyGroup
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
						<option value="-1" selected>-선택안함-</option>
						<option value="online">online</option>
						<option value="offline">offline</option>
						<option value="blended">blended</option>
					</select>
					
				</td>
			</tr>
			<tr>
				<th>수행기간</th>
				<td>
					<select name="term">
						<option value="-1" selected>-선택안함-</option>
						<option value="1">1개월</option>
						<option value="3">3개월</option>
						<option value="6">6개월</option>
						<option value="10">6개월 이상</option>
						<option value="0">상관없음</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>모집성별</th>
				<td>
					<select name="genderType">
						<option value="-1" selected>-선택안함- </option>
						<option value="1">남성</option>
						<option value="2">여성</option>
						<option value="0">상관없음</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>모집학년</th>
				<td>
					<select name="gradeType">
						<option value="-1" selected>-선택안함-</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">4학년 이상</option>
						<option value="0">상관없음</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td>
					<select name="numberOfUsers">
						<option value="-1" selected>-선택안함-</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">10명 이상</option>
						<option value="0">상관없음</option>
					</select>
				</td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="검색하기" id="gSearchB">
	</form>
</div>
</body>
</html>