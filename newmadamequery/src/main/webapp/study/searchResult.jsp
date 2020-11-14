<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹 검색 결과</title>
<!--  입력한 결과를 받아와서 db에서 검색 후, 존재하는 결과 출력(현재: request 전달만 구현) -->

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
			<th>과목 명</th>
			<th>인원</th>
			<th>기간</th>
		</tr>
		<tr> <!-- 여기에 StudyGroup의 정보 받아와서 출력 -->
			<td><%=sName %></td>
			<td><%=num %></td>
			<td><%=term %></td>
		</tr>
	</table>
</body>
</html>