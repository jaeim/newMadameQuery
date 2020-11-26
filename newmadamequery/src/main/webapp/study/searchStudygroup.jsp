<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>    
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script>
	
</script>
<meta charset="EUC-KR">
<title>���͵�׷� �˻�</title>
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
		}
		table{
			border: 2px solid black;
			width: 700px;
			height: 200px;
			font-family: Arial;

		}
		#searchGroup {
		
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
	���ϴ� ���͵� ������ �˻��غ�����.
	���͵� ���� �˻��� ���� ������ �Է� �� �����ϼ���.
	</pre>		
</div>


<div id="search">
	<h2 style="text-align: center;">���͵� �˻�</h2>
	
	<!-- ��� �����͸� �Է��ϵ���  : ���ο� �����͸� ���� ���ο� ���͵� �߰��Ѵ�. (��ġ ȸ�����԰� ���)-->
	<form name="form" method="POST" >
		<table>
			<tr>
				<td>���͵� ���</td>
				<td>
					<select name="meetingType">
						<option value="-1" selected>���þ���</option>
						<option value="0">����</option>
						<option value="1">���</option>
						<option value="2">ȥ��</option>
						<option value="3">��Ÿ</option>
						
					</select>
					
				</td>
			</tr>
			<tr>
				<td>�Ⱓ</td>
				<td>
					<select name="term">
						<option value="-1" selected>���þ���</option>
						<option value="1">1����</option>
						<option value="2">3����</option>
						<option value="3">6����</option>
						<option value="4">6���� �̻�</option>
						<option value="">��Ÿ</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<select name="genderType">
						<option value="-1" selected>���þ��� </option>
						<option value="1">����</option>
						<option value="2">����</option>
						<option value="3">�������</option>
						<option value="">��Ÿ</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>�г�</td>
				<td>
					<select name="gradeType">
						<option value="-1">���þ���</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option value= "5">4�г� �̻�</option>
						<option value="-1"></option>
						<option value="">��Ÿ</option>
					</select>
				</td>
			</tr>
		</table>
	</form>
	
	
</div>

</body>
</html>