<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���͵� �׷��� ����� ��û�ϱ�</title>
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

	<h5 id="userName">"������̸� ��������"</h5><br>
	<textarea cols="30" rows="5" value="�ڸ�Ʈ�� �ۼ��ϼ���." id="comments"></textarea><br><br>
	<input type="submit" value="���� ��û�ϱ�" id="submitB"/><br> 
	<!-- ��ư Ŭ�� �� : StudyGroupDAO.applyToGroup () ��û, alert-�ؼ� "��û �Ϸ�Ǿ����ϴ�."-->
</div>
</body>
</html>