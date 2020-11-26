<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script>
	
</script>
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
		table{
			border: 2px solid black;
			width: 700px;
			height: 200px;
			font-family: Arial;

		}
		#searchGroup {
		
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

<div id="intro">
	<pre>
	StudyGroup
	원하는 스터디 모임을 검색해보세요.
	스터디 모임 검색을 위한 조건을 입력 및 선택하세요.
	</pre>		
</div>


<div id="search">
	<h2 style="text-align: center;">스터디 검색</h2>
	
	<!-- 모든 데이터를 입력하도록  : 새로운 데이터를 통해 새로운 스터디를 추가한다. (마치 회원가입과 비슷)-->
	<form name="form" method="POST" >
		<table>
			<tr>
				<td>스터디 방식</td>
				<td>
					<select name="meetingType">
						<option value="-1" selected>선택안함</option>
						<option value="0">비대면</option>
						<option value="1">대면</option>
						<option value="2">혼합</option>
						<option value="3">기타</option>
						
					</select>
					
				</td>
			</tr>
			<tr>
				<td>기간</td>
				<td>
					<select name="term">
						<option value="-1" selected>선택안함</option>
						<option value="1">1개월</option>
						<option value="2">3개월</option>
						<option value="3">6개월</option>
						<option value="4">6개월 이상</option>
						<option value="">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<select name="genderType">
						<option value="-1" selected>선택안함 </option>
						<option value="1">남성</option>
						<option value="2">여성</option>
						<option value="3">상관없음</option>
						<option value="">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>학년</td>
				<td>
					<select name="gradeType">
						<option value="-1">선택안함</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option value= "5">4학년 이상</option>
						<option value="-1"></option>
						<option value="">기타</option>
					</select>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>