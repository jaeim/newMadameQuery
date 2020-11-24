<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹의 멤버로 신청하기</title>
<script>
	function applyMember(){
		if(form.comments.value ==""){
			alert("코멘트를 작성하십시오.")
			form.comments.focus();
			return false;
		}
		form.submit();
	}
</script>
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
<form name="form" method="POST" action="<c:url value='/studygroup/apply '/>">
	<h5 id="userName">여기에 사용자 이름을 가져옴.</h5><br>
	<textarea cols="30" rows="5" value="코멘트를 작성하세요." name="comments"></textarea><br><br>
	<input type="button" value="팀원 신청하기" id="submitB" onClick=applyMember() /><br> 
	
	<!-- 버튼 클릭 시 : StudyGroupDAO.applyToGroup () 신청, alert-해서 "신청 완료되었습니다."-->
</form>
</div>
</body>
</html>