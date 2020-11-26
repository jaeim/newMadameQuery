<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %> 
<%@page import="java.util.*" %>    
<%@page import="model.*, controller. *" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<StudyGroup> searchList = (List<StudyGroup>)request.getAttribute("searchList");
	// 받아오는 리스트 이름 수정 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 그룹 검색 결과</title>
<style>
	#resultTable, tr{
		border: 1px solid black;
		width: auto;
		height: auto;
		margin: 0;
		text-align: center;
	}
</style>

<style>
	
</style>
</head>
<body>
	
	<div id ="result">
	<table id="resultTable">
	<tr>
		<td>&nbsp;</td>
		<td>스터디 방식</td>
		<td>기간</td>
		<td>성별</td>
		<td>학년</td>
	</tr>
	
	<c:forEach var="sl" items="${searchList}" varStatus= "status"> 
		<tr>
			<td><c:out value="${status.count}" /></td>
			<td>${sl.meetingType }</td>
			<td>${sl.term}개월 </td>
			<td>${sl.genderType }</td>
			<td>${sl.gradeType }학년</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>