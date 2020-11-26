
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>댓글 layout</title>
<style>
		table{
			border-collapse: collapse;
			border: 1px solid black;
		}
</style>
</head>
<body>
<div>
	<table id="comments">
	<% 
		int n = 4 ; //dao.getCommentCount()로 가져온 개수 만큼 tr 생성
		int i = 0;
	for(i = 0; i<n ; i++){%>
	<tr>
		<td>작성자 :<%=i+1 %></td> <!-- 작성자 이름 -->
		<td>댓글 내용: <%=i+1 %></td> <!-- 댓글 내용 -->
	</tr>
	<%} %>
	</table>
	
	
</div>
</body>
</html>