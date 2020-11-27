<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="controller.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manage update page</title>
<!-- manage_view.jsp에서 '수정'클릭시 이동 -스터디 그룹의 정보 수정 페이지 -->
<script>
	function groupModify() {
		if(form.groupName.value ==""){
			alert("스터디 그룹 명을 입력하시오.");
			form.groupName.focus();
			return false;
		}
		if(form.description.value == ""){
			alert("그룹 소개를 작성하십시오.");
			form.description.focus();
			return false;
		}
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

#main{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-top: 50px;
 		width: 700px;
 		height: 30px;
 	 }
 	 
 #list{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-bottom: 50px;
 		width: 700px;
 		height: 30px;
 		
 }
 tr{
 	
 	margin: 50px;}
 	
 	
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
 	#buttons{
 		text-align: center;
 		
 	}
</style>

</head>
<body>
	<nav>
	<ul id="main-menu">
		<li><a href="#">HOME</a></li>
		<li><a href="#">MYSTUDY</a>
				<ul id="sub-menu">
					<li><a href="<c:url value= '/studyGroup/apply' />">나의 신청 현황</a>
					<li><a href="<c:url value='/studyGroup/myStudy'>
			<c:param name='userId' />
			</c:url>">나의 스터디 보기</a></li>
				</ul>
		</li>
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="#">스터디 등록</a></li>
				<li><a href="#">스터디 검색</a></li>
				<li><a href="#">스터디 그룹 보기</a></li>
			</ul>
		</li>
		<li><a href="#">MANAGE</a></li>
		
	</ul>
</nav>

<%
//확인을 위한 용도 
	StudyGroup group = (StudyGroup)request.getAttribute("studyGroup");
	System.out.println(group.getGroupName());
%>

<form name="form" method="POST" action="<c:url value='/studyGroup/manageStudy/update'>
	<c:param name="groupId" value="${studyGroup.groupId}" />
	<c:param name="groupMemberList" value="${groupMemberList}" />
</c:url>" >
<table id="main1">
		<tr>
			<td>스터디그룹 명(${studyGroup.groupId})</td>
			<td><input type="text" name="groupName" value="${studyGroup.groupName} " ></td>
			<td>인원</td>
			<td>${studyGroup.numberOfUsers } </td>
			<td>기간</td>
			<td>
				<select name="term">
						<c:set var= "term" value="${studyGroup.term}" />
						<option value="-1" <c:if test="${term eq '-1'}"> selected </c:if>>-선택안함-</option> 
						<option value="1" <c:if test="${term eq '1'}"> selected </c:if>>1개월</option> 
						<option value="3" <c:if test="${term eq '2'}"> selected </c:if>>3개월</option> 
						<option value="6" <c:if test="${term eq '3'}"> selected </c:if>>6개월 </option> 
						<option value="10" <c:if test="${term eq '4'}"> selected </c:if>>6개월 이상</option> 
						<option value="0" <c:if test="${term eq '0'}"> selected </c:if>>상관 없음</option> 
				</select>
			</td>
		</tr>
</table>

<table id="main2">
	<tr>
		<td>subjectId(과목)</td>
		<td>${studyGroup.subjectId} </td>
		<td>스터디 방식</td>
				<td> <!-- online, offline, blended-->
					<select name="meetingType">
						<c:set var="meetingT" value="${studyGroup.meetingType }" />
						<option <c:if test="${meetingT eq 'online'}"> selected </c:if>>online</option> 
						<option <c:if test="${meetingT eq 'offline'}"> selected </c:if>>offline</option> 
						<option <c:if test="${meetingT eq 'blended'}"> selected </c:if>>blended</option> 
					</select>
				</td>
	</tr>
	<tr>
		<td>개설 일자</td>
		<td>${studyGroup.createdDate }</td>
		<td>성별</td>
		<td><select name="genderType">
				<c:set var="gender" value="${studyGroup.genderType }" />
				<option value="-1" <c:if test="${gender eq '-1'}">selected</c:if>>-선택안함-</option>
				<option value="1" <c:if test="${gender eq '1'}">selected</c:if>>남성</option>
				<option value="2" <c:if test="${gender eq '2'}">selected</c:if>>여성</option>
				<option value="0" <c:if test="${gender eq '0'}">selected</c:if>>상관없음</option>
			</select></td>
	</tr>
	<tr>
		<td>팀장</td>
		<td>
			<select name="leaderId">
					<option value="">없음</option>
					<c:forEach var="member" items="${studyGroup.groupUsers}">
						<option value="${member.member_id}"
							<c:if test="${member.member_id eq studyGroup.leaderId}">selected</c:if>
							>${member.member_id}</option>
					</c:forEach>
			</select>
		
		</td>
		<td>학년</td>
		<td>
			<select name="gradeType">
					<c:set var="grade" value="${studyGroup.genderType}" />
					<option value="-1" <c:if test="${grade eq '-1'}">selected</c:if>>-선택안함-</option>
					<option value="1" <c:if test="${grade eq '1'}">selected</c:if>>1</option>
					<option value="2" <c:if test="${grade eq '2'}">selected</c:if>>2</option>
					<option value="3" <c:if test="${grade eq '3'}">selected</c:if>>3</option>
					<option value="4" <c:if test="${grade eq '4'}">selected</c:if>>4</option>
					<option value="5" <c:if test="${grade eq '5'}">selected</c:if>>4학년 이상</option>
					<option value="0" <c:if test="${grade eq '0'}">selected</c:if>>상관없음</option>
			</select>
		</td>
	</tr>
</table>

<br>

<table id= "userlist">
	<tr>
		<td>이름</td>
		<td>팀원 관리</td>
	</tr>
	
	<%  //if()...그 스터디그룹의 팀원 가져와서 팀원 수 만큼 <tr> 생성해서 list 출력. %>
	
	<c:forEach var="member" items="${studyGroup.groupUsers}">
		<tr>
			<td>${member.name}</td>
			<td>
				<a href="<c:url value='/studyGroup/manageGroup/delete' /> " onClick="return memberDelete(); "> 삭제</a>
				<a href="<c:url value='/studyGroup/manageStudy/applyAccept'>
					<c:param name='groupId' value='${studyGroup.groupId }'/>
					</c:url>" onClick= "return memberAccept(); ">수락</a>
			</td>
			
			
		</tr>
	</c:forEach>
	
</table>
<br>
	<input type="submit" value="저장하기" onClick="groupModify()"> &nbsp;
	
<!-- <input type="button" value="돌아가기" onClick="groupInfo('<c:url value='/studyGroup/manageStudy'>
		<c:param name="groupId" value="${studyGroup.groupId}" />
		</c:url>)"> -->
		
	<a href="<c:url value='/studyGroup/manageStudy'>
		<c:param name="groupId" value="${studyGroup.groupId}" />
		</c:url> ">돌아가기</a>
</form>


</body>
</html>