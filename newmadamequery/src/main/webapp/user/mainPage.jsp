<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>mainPage</title>
<!-- ���� ȭ��  (���� ó�� �ߴ� ȭ�� & �α��� �� �ߴ� ȭ��.) -->

<style>
	nav {
		text-align: center;
		list-style:none;
 		margin:0;
  		padding:0;
  		
	}
 	ul {
 		list-style-type: none;
 		maging:0;
 		padding: 0;
 	}
 	li {display: inline-block;
 	
 	}
 	#menuOption1,#menuOption2, #menuOption3, #menuOption4 {
 		display: block;
 		background-color: #C0EDFF;
 		padding: 8px;
 		font-size: 20px;
 		font-family: Arial;
 		width: 170px;
 		}
 		
 	#click1, #click2 {
 		font-size:15px;
 		font-family: Arial;
 		padding: 8px;
 		
 	}
 	#mainDiv , td{
 		border: 1px solid black;
 		text-align: center;
 		
 	}
 	#mainDiv {
 		margin: 100px;
 		clear:both;
 		width: 80%;
 		height: 500px;
 		border-spacing: 50px;
 	}
 	td {
 		margin : 50px;
 		width: 200px;
 		height: 100px;
 		
 	}
 	
</style>
</head>
<body>
<nav>
	<ul>
		<li><a id="menuOption1">HOME</a></li>
		<li><a id="menuOption2">MYSTUDY</a></li>
		<li><a id="menuOption3">STUDYGROUP</a></li>
		<li><a id="menuOption4">MANAGE</a></li>
		<li>
			<div><a id=click1>LOGIN</a></div>
			<div><a id=click2>JOIN</a></div>
		</li>
	</ul>
</nav>	

<table id="mainDiv">
	<tr>
		<td class="a">
			<div id= "login">
				<table>
                <tr>
                    <td bgcolor="white">���̵�</td>
                    <td><input type="text" name="id" maxlength="50"></td>
                </tr>
                <tr>
                    <td bgcolor="white">��й�ȣ</td>
                    <td><input type="password" name="password" maxlength="50"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="�α���"/>
            <input type="button" value="ȸ������"  />

		</div>
		</td>
		<td>
			<div id="notice">
				<h5>notice ���</h5>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div id="boards">
				<h5>studygroup board �Խ��� ���</h5>
			</div>
		</td>
	</tr>
</table>
</body>
</html>