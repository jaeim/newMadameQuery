<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="model.*,controller.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 그룹 등록</title>
<script type="text/javascript">

	function addStudyGroup(){
		<!-- numberOfUsers, groupName, description, term,  
		meetingType,genderType,gradeType, subjectId -->
		if(form.groupName.value == ""){
			
			alert("스터디그룹 명을 입력하십시오.");
			form.groupName.focus();
			return false;
		}
		if(form.numberOfUsers.value ==""){
			alert("인원수를 선택하십시오.");
			form.numberOfUser.focus();
			return false;
		}
		if(form.description.value == ""){
			alert("소개글을 입력하십시오.");
			form.description.focus();
			return fase;
		}
		if(form.term.value=""){
			alert("스터디 기간을 선택하십시오.");
			form.term.focus();
			return false;
		}
		if(form.meetingType.value ==""){
			alert("스터디 방식을 선택하십시오.");
			form.meetingType.focus();
			return false;
		}
		if(form.genderType.value ==""){
			alert("성별을 선택하십시오.");
			form.genderType.focus();
			return false;
		}
		if(form.gradeType.value == ""){
			alert("학년을 선택하십시오.");
			form.gradeType.focus();
			return false;
		}
		//과목 처리 - 추가하기
		form.submit();
	}
</script>
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
		border-bottom: 1px dashed black;
		text-align: center;
		margin: 0;
}
#addGroup{
		border: 1px solid #E6E6E6;
		width: 550px;
		height: 300px;
		font-family: Arial;

	}
#bc{
	width: 150px;
	background : #084B8A;
	color: white;
}
#gAddB{
	background : #084B8A;
	color: white;
	float: right;
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
스터디 등록 후, 마음에 드는 팀원을 찾아보세요.
스터디 등록을 위한 조건을 입력 및 선택해주세요.</pre></h5>	
</div>
	
<div id="gAddDic">
	<h2 style="text-align: center;">스터디 등록</h2>
	
	<form name="form" method="POST" action="<c:url value='/studyGroup/create' />">	
		<table id= "addGroup">
			<tr>
				<td id="bc">과목</td>
				<td> 
					<select name="subjectId">
						<c:forEach var="sub" items="${subjectList}" >
							<option value="${sub.subjectId}">${sub.name}</option>
						</c:forEach>
					</select>
				</td>
				<td id="bc">인원 수 </td>
				<td>
					<select name="numberOfUsers">
						<option value="3" selected>3</option>
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
			<tr>
				<td id="bc">스터디 그룹 명</td>
				<td><input type="text" name="groupName" onFocus="this.value='' " 
					<c:if test="${creationFailed }"> value="${studyGroup.groupName }"</c:if>
					/></td>
				<td id="bc">기간</td>
				<td><select name="term">
					<option value="1">1개월</option>
					<option value="3">3개월</option>
					<option value="6">6개월</option>
					<option value="10">6개월 이상</option>
					<option value="0">상관없음</option>
				</select>
				
				</td>
			</tr>
			<tr>
				<td id="bc">소개</td>
				<td colspan="3"><input type="text" name="description" onFocus="this.value=''' " 
						style="width:300px;"
					<c:if test="${creationFaild }">value="${studyGroup.description }" </c:if>
				/> </td>
			</tr>
			<tr>
				<td id="bc">스터디 방식</td>
				<td><select name="meetingType">
					<option value="online">online</option>
					<option value="offline">offline</option>
					<option value="blended">blended</option>
				</select></td>
				<td id="bc">성별</td>
				<td>
					<select name="genderType">
						<option value="0">상관없음</option>
						<option value="1">남성</option>
						<option value="2">여성</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="bc">학년</td>
				<td>
					<select name="gradeType">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">4학년 이상</option>
						<option value="0">상관없음</option>
					</select>
				</td>
				<td id="bc">팀장 Id</td>
				<td>${userId}</td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="생성하기" onClick="addStudyGroup()" id="gAddB"/> 
		<br><br>
	</form>
	
</div>
</body>
</html>