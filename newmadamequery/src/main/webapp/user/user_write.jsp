<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<script>
	function userCreate(){
		if(form.userId.value == ""){
			
			alert("������� id�� �Է��Ͻʽÿ�.");
			form.userId.focus();
			return false;
		}
		if(form.password.value == ""){
			
			alert("��й�ȣ�� �Է��Ͻʽÿ�.");
			form.password.focus();
			return false;
		}
		if(form.password.value != form.password2.value){
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			form.password2.focus();
			return false;
		}
		if (form.name.value == "") {
			alert("�̸��� �Է��Ͻʽÿ�.");
			form.name.focus();
			return false;
		}
		if(form.email.value=""){
			
			alert("�̸����� �Է��Ͻʽÿ�.");
			form.email.focus();
			return false;
		}
		if(form.university.value ==""){
			
			alert("���и��� �Է��Ͻʽÿ�.");
			form.univerisity.focus();
			return false;
		}
		if(form.department.value == ""){
			alert("�Ҽ� �а����� �����Ͻʽÿ�.");
			form.department.focus();
			return false;
		}
		if(form.gender.value == ""){
			alert("������ �����Ͻʽÿ�.");
			form.gender.focus();
			return false;
		}
		var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(emailExp.test(form.email.value)==false) {
			alert("�̸��� ������ �ùٸ��� �ʽ��ϴ�.");
			form.email.focus();
			return false;
		}
		var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if(phoneExp.test(form.phone.value)==false) {
			alert("��ȭ��ȣ ������ �ùٸ��� �ʽ��ϴ�.");
			form.phone.focus();
			return false;
		}
		form.submit();
		
	}
</script>
<title>ȸ������</title>
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
 	#title {
 		text-align: center;
 		font-size: 50px;
 		font-family: Arial;
 	}
 	#joinTable, #lectureTable{
 		text-align: center;
 		border: 1px solid black;
 		margin-left: auto;
 		margin-right: auto;
 		font-family: Arial;
 	}
 	#joinTable{
 		width: 550px;
 		height: 500px;
 	}
 	#lectureTable, #tags{
 		border: 1px solid black;
 		width: 350px;
 		height: 100px;
 		margin-left: auto;
 		margin-right: auto;
 	}
#joinDiv {
	border: 1px solid black;
	text-align: center;
	width: 450px;
	height: 500px;
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
				<li><a href="http://localhost:8080/newmadamequery/user/login.jsp">�α���</a></li>
				<li><a href="http://localhost:8080/newmadamequery/user/user_write.jsp">ȸ������</a></li>
			</ul>
		</li>
		
	</ul>
</nav>
<br><br>

<div id="joinDiv">
	
	<h1>Join With Us!</h1>
	<form name="form" method="POST" action="<c:url value='/user/register' /> ">
	<table>
		<tr>
			<td>����� id: </td>
			<td><input type="text" name="userId"></td>
		</tr>
		<tr>
			<td>��й�ȣ: </td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>��й�ȣ Ȯ��: </td>
			<td><input type="password" name="password2"></td>
		</tr>
		<tr>
			<td>�̸�: </td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>�޴��� ��ȣ (ex.010-1234-5678)</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>�̸��� �ּ�: </td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>�Ҽ� �б� ��: </td>
			<td><input type="text" name="university"></td>
		</tr>
		<tr>
			<td>�Ҽ� �а���: </td>
			<td>
				<select name="department">
					<option>������а�</option>
					<option>�����а�</option>
					<option>����â�۰�</option>
					<option>�����</option>
					<option>�Ϻ����</option>
					<option>���������</option>
					<option>���Ͼ��</option>
					<option>�߾��߱��а�</option>
					<option>�濵�а�</option>
					<option>�����а�</option>
					<option>�����濵�а�</option>
					<option>�Ƶ��а�</option>
					<option>��ȸ�����а�</option>
					<option>���������а�</option>
					<option>����ȸ���а�</option>
					<option>��ǰ�����а�</option>
					<option>���ǰ����а�</option>
					<option>ȭ��, ȭ��ǰ�к�</option>
					<option>ü���а�</option>
					<option>��Ż��Ƽ�ɾ��а�(��)</option>
					<option>��ǻ���а�</option>
					<option>��������а�</option>
					<option>ȸȭ��</option>
					<option>�����а�����</option>
					<option>ť�������а�</option>
					<option>�ǾƳ��</option>
					<option>�����ǰ�</option>
					<option>���ǰ�</option>
					<option>�мǵ������а�</option>
					<option>�ð�&�ǳ��������а�</option>
					<option>�̵��������а�</option>
					<option>���а�</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>�г�</td>
			<td><select name="grade">
				<option>1�г�</option>
				<option>2�г�</option>
				<option>3�г�</option>
				<option>4�г�</option>
				<option>5�г� �̻�</option>
			</select></td>
		</tr>
		<tr>
			<td>����</td>
			<td><select name="gender">
				<option>����</option>
				<option>����</option>
			</select></td>
		</tr>
	</table>
	<br>
	<table style="width: 100%">
		  <tr>
			<td align="left">
			<input type="button" value="ȸ�� ����" onClick="userCreate()"> &nbsp;
			</td>
		  </tr>
	    </table>
	 <br>
	</form>
</div>
</body>
</html>