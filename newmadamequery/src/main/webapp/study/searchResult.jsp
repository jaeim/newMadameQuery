<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹 검색 결과</title>
<!--  searchStudygroup.jsp에서 "검색"버튼 클릭 시 include 되어 나타나기 -->
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
	<table id="searchResult">
		<tr>
			<th>과목 명</th>
			<th>인원</th>
			<th>기간</th>
		</tr>
		<tr> <!-- 여기에 StudyGropu의 정보 받아와서 출력 -->
			<td>데이터 베이스 프로그래밍</td>
			<td>4</td>
			<td>6</td>
		</tr>
	</table>
</body>
</html>