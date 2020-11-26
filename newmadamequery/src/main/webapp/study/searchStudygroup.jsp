<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script>
	
</script>
<meta charset="EUC-KR">
<title>Л┼╓М└╟К■■Й╥╦Кё╧ Й╡─Л┐┴</title>
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
				<li><a href="#">Л┼╓М└╟К■■ К⌠╠К║²</a></li>
				<li><a href="#">Л┼╓М└╟К■■ Й╡─Л┐┴</a></li>
				<li><a href="#">Л┼╓М└╟К■■ Й╥╦Кё╧ КЁ╢Й╦╟</a></li>
			</ul>
		</li>
		<li><a href="#">MANAGE</a></li>
		<li><a href="#"> LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li><a href="#">К║°Й╥╦Л²╦</a></li>
				<li><a href="#">М ▄Л⌡░Й╟─Л·┘</a></li>
			</ul>
		</li>
		
	</ul>
</nav>

<div id="intro">
	<pre>
	StudyGroup
	Л⌡░М∙≤К┼■ Л┼╓М└╟К■■ К╙╗Л·└Л²└ Й╡─Л┐┴М∙╢КЁ╢Л└╦Л ■.
	Л┼╓М└╟К■■ К╙╗Л·└ Й╡─Л┐┴Л²└ Л°└М∙° Л║╟Й╠╢Л²└ Л·┘К═╔ К╟▐ Л└═М┐²М∙≤Л└╦Л ■.
	</pre>		
</div>


<div id="search">
	<h2 style="text-align: center;">Л┼╓М└╟К■■ К⌠╠К║²</h2>
	
	<!-- К╙╗К⌠═ К█╟Л²╢М└╟К╔╪ Л·┘К═╔М∙≤К▐└К║²  : Л┐┬К║°Л ╢ К█╟Л²╢М└╟К╔╪ М├╣М∙╢ Л┐┬К║°Л ╢ Л┼╓М└╟К■■К╔╪ Л╤■Й╟─М∙°К▀╓. (К╖┬Л╧≤ М ▄Л⌡░Й╟─Л·┘ЙЁ╪ К╧└Л┼╥)-->
	<form name="form" method="POST" action="<c:url value='/studyGroup/search' />">
		<table id= "searchGroup">
			<tr>
				<td>ЙЁ╪К╙╘</td>
				<td> 
					<select id="subject"></select>
				</td>
				
				<!-- numberOfUsers, groupName, description, term,  
				meetingType,genderType,gradeType, subjectId -->
				<td>Л²╦Л⌡░ Л┬≤ </td>
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
						<option>10К╙┘ Л²╢Л┐│</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Л┼╓М└╟К■■ Й╥╦Кё╧ К╙┘</td>
				<td><input type="text" name="groupName" value="ex)Л∙▄ЙЁ═К╕╛Л╕≤" onFocus="this.value='' " /></td>
				<td>Й╦╟Й╟└</td>
				<td><select name="term">
					<option>1Й╟°Л⌡■</option>
					<option>3Й╟°Л⌡■</option>
					<option>6Й╟°Л⌡■</option>
					<option>6Й╟°Л⌡■ Л²╢Л┐│</option>
				</select>
				
				</td>
			</tr>
			<tr>
				<td>Л├▄Й╟°</td>
				<td colspan="3"><textarea name="description" cols="70" rows="2" onFocus="this.value='' ">Й╟└К▀╗М∙° Л├▄Й╟°Й╦─Л²└ Л·┘К═╔М∙≤Л└╦Л ■</textarea> </td>
			</tr>
			<tr>
				<td>Л┼╓М└╟К■■ К╟╘Л▀²</td>
				<td><select name="meetingType">
					<option>online</option>
					<option>offline</option>
					<option>КЁ▒М√┴</option>
				</select></td>
				<td>Л└╠КЁ└</td>
				<td>
					<select name="genderType">
						<option>0(Л┐│Й╢─Л≈├Л²▄)</option>
						<option>1(К┌╗Л└╠)</option>
						<option>2(Л≈╛Л└╠)</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>М∙≥К┘└</td>
				<td>
					<select name="gradeType">
						<option>0(Л┐│Й╢─Л≈├Л²▄)</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</td>
				<td>М▄─Л·╔</td>
				<td>userId (Л·░Л▀═Л²≤  userId Й╟─Л═╦Л≤╓Й╦╟)</td>
			</tr>
		</table>
		<br><br>
		<input type="button" id="createB" value="Й╡─Л┐┴М∙≤Й╦╟" onClick="<c:url value= '/studyGroup/search '>
			<c:param name="studyName" value="${studyGroup.groupName }" />
			<c:param name="memberNumber" value="${studyGroup.numberOfUser }" />
			<c:param name="span" value="${studyGroup.term}" />
			</c:url>" />
		
		<br><br>
	</form>
</div>

</body>
=======
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
<title>╫╨ем╣П╠в╥Л ╟к╩Ж</title>
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
				<li><a href="#">╫╨ем╣П ╣Н╥о</a></li>
				<li><a href="#">╫╨ем╣П ╟к╩Ж</a></li>
				<li><a href="#">╫╨ем╣П ╠в╥Л ╨╦╠Б</a></li>
			</ul>
		</li>
		<li><a href="#">MANAGE</a></li>
		<li><a href="#"> LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li><a href="#">╥н╠вюн</a></li>
				<li><a href="#">х╦©Ь╟║ют</a></li>
			</ul>
		</li>
		
	</ul>
</nav>

<div id="intro">
	<pre>
	StudyGroup
	©Ьго╢б ╫╨ем╣П ╦Пюсю╩ ╟к╩Жгь╨╦╪╪©Д.
	╫╨ем╣П ╦Пюс ╟к╩Жю╩ ю╖гя а╤╟гю╩ ют╥б ╧в ╪╠ецго╪╪©Д.
	</pre>		
</div>


<div id="search">
	<h2 style="text-align: center;">╫╨ем╣П ╟к╩Ж</h2>
	
	<!-- ╦П╣Г ╣╔юлем╦╕ ют╥бго╣╣╥о  : ╩У╥н©Н ╣╔юлем╦╕ еКгь ╩У╥н©Н ╫╨ем╣П╦╕ цъ╟║гя╢ы. (╦╤д║ х╦©Ь╟║ют╟З ╨Я╫а)-->
	<form name="form" method="POST" >
		<table>
			<tr>
				<td>╫╨ем╣П ╧Ф╫д</td>
				<td>
					<select name="meetingType">
						<option value="-1" selected>╪╠ец╬хгт</option>
						<option value="0">╨Я╢К╦И</option>
						<option value="1">╢К╦И</option>
						<option value="2">х╔гу</option>
						<option value="3">╠Бе╦</option>
						
					</select>
					
				</td>
			</tr>
			<tr>
				<td>╠Б╟ё</td>
				<td>
					<select name="term">
						<option value="-1" selected>╪╠ец╬хгт</option>
						<option value="1">1╟Ё©Ы</option>
						<option value="2">3╟Ё©Ы</option>
						<option value="3">6╟Ё©Ы</option>
						<option value="4">6╟Ё©Ы юл╩С</option>
						<option value="">╠Бе╦</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>╪╨╨╟</td>
				<td>
					<select name="genderType">
						<option value="-1" selected>╪╠ец╬хгт </option>
						<option value="1">Ё╡╪╨</option>
						<option value="2">©╘╪╨</option>
						<option value="3">╩С╟Э╬Ью╫</option>
						<option value="">╠Бе╦</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>гпЁБ</td>
				<td>
					<select name="gradeType">
						<option value="-1">╪╠ец╬хгт</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option value= "5">4гпЁБ юл╩С</option>
						<option value="-1"></option>
						<option value="">╠Бе╦</option>
					</select>
				</td>
			</tr>
		</table>
	</form>
	
	
</div>

</body>
>>>>>>> branch 'dev' of https://github.com/jaeim/newMadameQuery.git
</html>