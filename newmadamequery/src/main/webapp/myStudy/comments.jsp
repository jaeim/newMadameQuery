
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� layout</title>
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
		int n = 4 ; //dao.getCommentCount()�� ������ ���� ��ŭ tr ����
		int i = 0;
	for(i = 0; i<n ; i++){%>
	<tr>
		<td>�ۼ��� :<%=i+1 %></td> <!-- �ۼ��� �̸� -->
		<td>��� ����: <%=i+1 %></td> <!-- ��� ���� -->
	</tr>
	<%} %>
	</table>
	
	
</div>
</body>
</html>