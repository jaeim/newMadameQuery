<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���͵� �׷� �˻� ���</title>
<!--  �Է��� ����� �޾ƿͼ� db���� �˻� ��, �����ϴ� ��� ���(����: request ���޸� ����) -->

<style>
	#searchResult {
		
		text-align: center;
		border-collapse: collapse;
		
	}
	tr{
		border-bottom: 1px  solid navy;
	}
</style>
</head>
<body>

<% String sName = request.getParameter("subjectName");
	String num = request.getParameter("numOfMembers");
	String term = request.getParameter("term");
	System.out.println(sName + "\t" + num +"\t" + term);
%>
	<table id="searchResult">
		<tr>
			<th>���� ��</th>
			<th>�ο�</th>
			<th>�Ⱓ</th>
		</tr>
		<tr> <!-- ���⿡ StudyGroup�� ���� �޾ƿͼ� ��� -->
			<td><%=sName %></td>
			<td><%=num %></td>
			<td><%=term %></td>
		</tr>
	</table>
</body>
</html>