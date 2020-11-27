<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 신청 현황</title>
</head>
<body>
	<%
		//List<Application> applyList = request.getParameter("applyList");
		
	%>
	<table>
		<caption>나의 신청 현황 </caption>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<c:forEach var="apList" items="${applyList }" >
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</c:forEach>
		
	</table>
	
</body>
</html>