<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���͵� �׷��� ����� ��û�ϱ�</title>
<script>
	function applyMember(){
		if(form.comments.value ==""){
			alert("�ڸ�Ʈ�� �ۼ��Ͻʽÿ�.")
			form.comments.focus();
			return false;
		}
		form.submit();
	}
</script>
<!-- studygroup_view.jsp�� include �Ǿ� ���� �� ������ -->
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
	<h5 id="userName">���⿡ ����� �̸��� ������.</h5><br>
	<textarea cols="30" rows="5" value="�ڸ�Ʈ�� �ۼ��ϼ���." name="comments"></textarea><br><br>
	<input type="button" value="���� ��û�ϱ�" id="submitB" onClick=applyMember() /><br> 
	
	<!-- ��ư Ŭ�� �� : StudyGroupDAO.applyToGroup () ��û, alert-�ؼ� "��û �Ϸ�Ǿ����ϴ�."-->
</form>
</div>
</body>
</html>