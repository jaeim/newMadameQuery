<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>manage update page</title>
<!-- manage_view.jsp���� '����'Ŭ���� �̵� -���͵� �׷��� ���� ���� ������ -->

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

#main{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-top: 50px;
 		width: 700px;
 		height: 30px;
 	 }
 	 
 #list{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-bottom: 50px;
 		width: 700px;
 		height: 30px;
 		
 }
 tr{
 	
 	margin: 50px;}
 	
 	
 	#main1{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-top: 50px;
 		margin-bottom: 20px;
 		width: 700px;
 		height: 30px;
 		}
 	#main2 {
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-top: 10px;
 		margin-bottom: 20px;
 		width: 700px;
 		height: 30px;
 	}
 	#userlist{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-bottom: 50px;
 		width: 700px;
 		height: 30px;
 		
 	}
 	td {
 		width: 170px;
 		bgcolor: "ffffff";
 		padding-left: 10;
 	}
 	tr{
 		border: 1px solid black;
 	}
 	#buttons{
 		text-align: center;
 		
 	}
</style>
<script>
	function groupModify() {
		if(form.groupName.value ==""){
			alert("���͵� �׷� ���� �Է��Ͻÿ�.");
			form.groupName.focus();
			return false;
		}
		if(form.description.value == ""){
			alert("�׷� �Ұ��� �ۼ��Ͻʽÿ�.");
			form.description.focus();
			return false;
		}
		form.submit();
		
	}
	function groupInfo(targetUri){
		form.action =targetUri;
		form.submit();
	}
</script>
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

<%
//Ȯ���� ���� �뵵 

	StudyGroup sg = new StudyGroup();
	sg.setGroupId(501);
	//�ؿ��� ���߿� sg -> StudyGroup.~�� �ٲ� ��.
%>

<form name="form" method="POST" action="<c:url value='/myGroup/manageGroup/update' />">
<table id="main1">
		<tr>
			<td>���͵�׷� ��</td>
			<td> <input type="text" name="groupName" value="${sg.groupName} " ></td>
			<td>�ο�</td>
			<td> ${sg.numberOfUsers } </td>
			<td>�Ⱓ</td>
			<td> <input type="text" name="term" value="${sg.term }"></td>
		</tr>
</table>

<table id="main2">
	<tr>
		<td>subjectId(����)</td>
		<td>${sg.subjectId} </td>
		<td>���͵� ���</td>
		<td> <!-- online, offline, both-->
			<select name="meetingType">
				<option value="0">Online</option>
				<option value="1">Offline</option>
				<option value="2">On & Off(ȥ��)</option>
			</select>
			<!-- ������ ������ �����ͼ� selected ǥ���ϱ� -->
		</td>
	</tr>
	<tr>
		<td>���� ����</td>
		<td>${sg.createdDate }</td>
		<td>����</td>
		<td><select name="meetingType">
				<option value="0">��� ����</option>
				<option value="1">����</option>
				<option value="2">����</option>
			</select></td>
	</tr>
	<tr>
		<td>����</td>
		<td>
			<select name="leaderId">
					<option value="">����</option>
					<c:forEach var="member" items="${sg.memberList}">
						<option value="${member.userId}"
							<c:if test="${member.userId eq sg.leaderId}">selected="selected"</c:if>
							>${member.userId}</option>
					</c:forEach>
				</select>
		
		</td>
		<td>�г�</td>
		<td>
			<select name="grade">
				<option value="0">��� ����</option>
				<option value="1">1�г�</option>
				<option value="2">2�г�</option>
				<option value="3">3�г�</option>
				<option value="4">4�г�</option>
			</select>
		</td>
	</tr>
</table>

<br>

<table id= "userlist">
	<tr>
		<td>�̸�</td>
		<td>���� ����</td>
	</tr>
	
	<%  //if()...�� ���͵�׷��� ���� �����ͼ� ���� �� ��ŭ <tr> �����ؼ� list ���. %>
	
	<c:forEach var="member" items="{sg.memberList}">
		<tr>
			<td><!-- ��� �̸� ��� --></td>
			<td>
				<a href="<c:url value='/myGroup/manageGroup/delete' /> " onClick="return memberDelete(); "> ����</a>
				<a href="<c:url value='/studyGroup/manageStudy/applyAccept'>
					<c:param name='groupId' value='${sg.groupId }'/>
					</c:url>" onClick= "return memberAccept(); ">����</a>
			</td>
			
			
		</tr>
	</c:forEach>
	
</table>
<br>
<div id="buttons">
	<input type="button" value="�����ϱ�" onClick="groupModify()"> &nbsp;
	<input type="button" value="���ư���" onClick="groupInfo('<c:url value='/studyGroup/manageStudy'>
		<c:param name="groupId" value="${sg.groupId}" />
		</c:url>'')">
</div>
</form>


</body>
</html>