<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹의 멤버로 신청하기</title>
<!-- studygroup_view.jsp에 include 되어 들어가는 폼 형식임 -->
<style>
	#registerForm {
		text-align: center;
		border: 1px solid black;
		width: auto;
		height: auto;
		padding: 20px;
	}
	#userName {
		text-decoration: underline;
	}
</style>
</head>
<body>
	

<div id="registerForm">

	<h5 id="userName">"사용자이름 가져오기"</h5><br>
	<textarea cols="30" rows="5" value="코멘트를 작성하세요." id="comments"></textarea><br><br>
	<input type="submit" value="팀원 신청하기" id="submitB"/><br> 
	<!-- 버튼 클릭 시 : StudyGroupDAO.applyToGroup () 신청, alert-해서 "신청 완료되었습니다."-->
</div>
</body>
</html>