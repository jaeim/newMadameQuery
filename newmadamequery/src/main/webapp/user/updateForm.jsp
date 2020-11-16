<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���� </title>

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

<div>
	<p id="title">UPDATE</p>
	<table id="joinTable">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>ID</td>
			<td><input type="text" name="userId" value="���̵� �Է��ϼ���."></td>
			<td><input type="button" name="doublecheck" value="�ߺ�Ȯ��"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="text" name="userPass" value="��й�ȣ�� �Է��ϼ���."></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>CHECK PASS</td>
			<td><input type="text" name="checkPass" value="��й�ȣ�� �ٽ� �Է����ּ���."></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>EMAIL</td>
			<td>
				<input type="email" name="userEmail" value="�̸������Է��ϼ���.">
				<select name="emaillist">
					<option value="naver">naver.com</option>
					<option value="daum">hanmail.net</option>
					<option value="gmail">gmail.com</option>
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>MAJOR</td>
			<td>
				<select name="majors">
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
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>LECTURE</td>
			<td colspan="2" rowspan="2">
			<table id="lectureTable">
				<tr>
					<td>1</td>
					<td>���� �̸�</td>
					<td><input type="button" value="delete"></td>
				</tr>
				<tr>
					<td>2</td>
					<td>�����̸�</td>
					<td><input type="button" value="delete"></td>
				</tr>
			</table>
			
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>TAGS</td>
			<td colspan="2" rowspan="3">
				<div id="tags">
				<input type="checkbox" name="tags" value="1" />ö��
				<input type="checkbox" name="tags" value="2" />IT���
				<input type="checkbox" name="tags" value="3" />���
				<input type="checkbox" name="tags" value="4" />�̼�
				<input type="checkbox" name="tags" value="5" />��ȭ
				<input type="checkbox" name="tags" value="6" />����
				<input type="checkbox" name="tags" value="7" />�ι�
				<input type="checkbox" name="tags" value="8" />�ɸ�
				<input type="checkbox" name="tags" value="9" />������
				<input type="checkbox" name="tags" value="10" />����
				<input type="checkbox" name="tags" value="11" />����
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			
		</tr>
		<tr>
			<td>&nbsp;</td>
			
		</tr>
		
	</table>

</div>
<br><input type="button" value="����(�Ϸ�)" onClick="location.href='myPage.jsp'"/>
</body>
</html>