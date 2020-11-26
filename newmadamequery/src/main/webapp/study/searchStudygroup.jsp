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
<meta charset="EUC-KR">
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
	<h2 style="text-align: center;">스터디 등록</h2>
	
	<!-- 모든 데이터를 입력하도록  : 새로운 데이터를 통해 새로운 스터디를 추가한다. (마치 회원가입과 비슷)-->
	<form name="form" method="POST" action="<c:url value='/studyGroup/search' />">
		<table id= "searchGroup">
			<tr>
				<td>과목</td>
				<td> 
					<select id="subject"></select>
				</td>
				
				<!-- numberOfUsers, groupName, description, term,  
				meetingType,genderType,gradeType, subjectId -->
				<td>인원 수 </td>
				<td>
					<select name="numberOfUsers">
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>10명 이상</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>스터디 그룹 명</td>
				<td><input type="text" name="groupName" value="ex)알고리즘" onFocus="this.value='' " /></td>
				<td>기간</td>
				<td><select name="term">
					<option>1개월</option>
					<option>3개월</option>
					<option>6개월</option>
					<option>6개월 이상</option>
				</select>
				
				</td>
			</tr>
			<tr>
				<td>소개</td>
				<td colspan="3"><textarea name="description" cols="70" rows="2" onFocus="this.value='' ">간단한 소개글을 입력하세요</textarea> </td>
			</tr>
			<tr>
				<td>스터디 방식</td>
				<td><select name="meetingType">
					<option>online</option>
					<option>offline</option>
					<option>병행</option>
				</select></td>
				<td>성별</td>
				<td>
					<select name="genderType">
						<option>0(상관없음)</option>
						<option>1(남성)</option>
						<option>2(여성)</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>학년</td>
				<td>
					<select name="gradeType">
						<option>0(상관없음)</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</td>
				<td>팀장</td>
				<td>userId (자신의  userId 가져오기)</td>
			</tr>
		</table>
		<br><br>
		<input type="button" id="createB" value="검색하기" onClick="<c:url value= '/studyGroup/search '>
			<c:param name="studyName" value="${studyGroup.groupName }" />
			<c:param name="memberNumber" value="${studyGroup.numberOfUser }" />
			<c:param name="span" value="${studyGroup.term}" />
			</c:url>" />
		
		<br><br>
	</form>
</div>

</body>
</html>