<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>    
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���͵� �׷� ���</title>
<script>
	function addStudyGroup(){
		<!-- numberOfUsers, groupName, description, term,  
		meetingType,genderType,gradeType, subjectId -->
		if(form.groupName.value == ""){
			
			alert("���͵�׷� ���� �Է��Ͻʽÿ�.");
			form.groupName.focus();
			return false;
		}
		if(form.numberOfUsers.value ==""){
			alert("�ο����� �����Ͻʽÿ�.");
			form.numberOfUser.focus();
			return false;
		}
		if(form.description.value == ""){
			alert("�Ұ����� �Է��Ͻʽÿ�.");
			form.description.focus();
			return fase;
		}
		if(form.term.value=""){
			alert("���͵� �Ⱓ�� �����Ͻʽÿ�.");
			form.term.focus();
			return false;
		}
		if(form.meetingType.value ==""){
			alert("���͵� ����� �����Ͻʽÿ�.");
			form.meetingType.focus();
			return false;
		}
		if(form.genderType.value ==""){
			alert("������ �����Ͻʽÿ�.");
			form.genderType.focus();
			return false;
		}
		if(form.gradeType.value == ""){
			alert("�г��� �����Ͻʽÿ�.");
			form.gradeType.focus();
			return false;
		}
		//���� ó�� - �߰��ϱ�
		form.submit();
	}
</script>
	<style>
	body {
  margin: 0;
  padding: 0;
  font-family: Arial;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
  overflow-x: hidden;  
}

h1 {
  margin: 2em 0 1.5em 0;
}

nav {
  width: 100%;
  display: flex;
  justify-content: center;
  position: relative;
  background:  #C0EDFF;
}

ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
}

#main-menu > li {
  float: left;
  position: relative;
}

#main-menu > li > a {
  font-size: 0.85rem;
  color: black;
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
  padding: 14px 36px;
  border-right: 1px solid rgba(0,0,0,0.15);
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
}

#main-menu > li:nth-child(1) > a {
  border-left: 1px solid rgba(0,0,0,0.15);
}

#sub-menu {
  position: absolute;
  background: white;
  opacity: 0;
  visibility: hidden;
  transition: all 0.15s ease-in;
  font-family: Arial;
}

#sub-menu > li {
  padding: 16px 28px;
  border-bottom: 1px solid rgba(0,0,0,0.15);
  
}

#sub-menu > li >  a {
  color: black;
  text-decoration: none;
  font-family: Arial;
}

#main-menu > li:hover #sub-menu {
  opacity: 1;
  visibility: visible;
}

#sub-menu > li >  a:hover {
 text-decoration: underline;
}
 		
		#intro{
			font-family: Arial;
			font-size: 15px;
			border-bottom: 1px dashed black;
			text-align: center;
			margin: 0;
		}
		
		table{
			border: 2px solid black;
			width: 650px;
			height: 300px;
			font-family: Arial;

		}
		#createB {
			float: right;
		}
		
	</style>
</head>
<body>
<nav>
	<ul id="main-menu">
		<li><a href="#">HOME</a></li>
		<li><a href="#">MYSTUDY</a></li>
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="#">���͵� ���</a></li>
				<li><a href="#">���͵� �˻�</a></li>
				<li><a href="#">���͵� �׷� ����</a></li>
			</ul>
		</li>
		<li><a href="#">MANAGE</a></li>
		<li><a href="#"> LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li><a href="#">�α���</a></li>
				<li><a href="#">ȸ������</a></li>
			</ul>
		</li>
		
	</ul>
</nav>


<div id="intro">
	<pre>
	StudyGroup
	���͵� ��� ��, ������ ��� ������ ã�ƺ�����.
	���͵� ����� ���� ������ �Է� �� �������ּ���.
	</pre>		
</div>
	
<div id="add">
	<h2 style="text-align: center;">���͵� ���</h2>
	
	<!-- ��� �����͸� �Է��ϵ���  : ���ο� �����͸� ���� ���ο� ���͵� �߰��Ѵ�. (��ġ ȸ�����԰� ���)-->
	<form name="form" method="POST" action="<c:url value='/studyGroup/create' />">
		<c:if test= "${creationFailed }">
			<font color="red"><c:out value="${exception. getMessage()}" /></font>
		</c:if>
		
		<table id= "addGroup">
			<tr>
				<td>����</td>
				<td> 
					<select id="subject"></select>
				</td>
				
				<!-- numberOfUsers, groupName, description, term,  
				meetingType,genderType,gradeType, subjectId -->
				<td>�ο� �� </td>
				<td>
					<select name="numberOfUsers">
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>10�� �̻�</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>���͵� �׷� ��</td>
				<td><input type="text" name="groupName" onFocus="this.value='' " 
					<c:if test="${creationFailed }"> value="${studyGroup.groupName }"</c:if>
					/></td>
				<td>�Ⱓ</td>
				<td><select name="term">
					<option>1����</option>
					<option>3����</option>
					<option>6����</option>
					<option>6���� �̻�</option>
				</select>
				
				</td>
			</tr>
			<tr>
				<td>�Ұ�</td>
				<td colspan="3"><input type="text" name="description" width="200" onFocus="this.value='' "
					<c:if test="${creationFaild }">value="${studyGroup.description }" </c:if>
				/> </td>
			</tr>
			<tr>
				<td>���͵� ���</td>
				<td><select name="meetingType">
					<option>online</option>
					<option>offline</option>
					<option>����</option>
				</select></td>
				<td>����</td>
				<td>
					<select name="genderType">
						<option>0(�������)</option>
						<option>1(����)</option>
						<option>2(����)</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>�г�</td>
				<td>
					<select name="gradeType">
						<option>0(�������)</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</td>
				<td>����</td>
				<td>userId (�ڽ���  userId ��������)</td>
			</tr>
		</table>
		<br><br>
		<input type="button" id="createB" value="�����ϱ�" onClick=addStudyGroup() />
		<br><br>
	</form>
	
</div>
</body>
</html>