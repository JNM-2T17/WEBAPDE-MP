<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="tmi.css" />
<meta charset="ISO-8859-1">
<script src="tmi.js"></script>
<title>Insert title here</title>
</head>
<body>

			<img id="logo" src="Website Assets/logo2.png" /><br />
			<div id="homeLink"><a href="index.html">Home</a></div>
			<div id="menubar">
				<form name="search" action="search">
					<ul id="menu">
						<li class="menuitem"><a href="login.html">Login</a></li>
						<li class="menuitem"><a href="favorites.html">Favorites</a></li>
						<li class="menuitem"><a href="admin.html">Admin</a></li>
						<li class="menuitem"><a href="propose.html">Propose Media</a></li>
					</ul> <!-- end of menu -->
					<span id="searchBar">
						<img src="Website Assets/search.png" />
						<input type="text" id="search" placeholder="Search..." name="s" />
					</span> <!-- end of searchBar -->
				</form>
			</div> <!--  End of menubar -->
		
	<div id="mainContent">
	

	
			<form action='RegisterServlet' method='post'>
				<h1>User Registration</h1>
				<div class="orangeLine"></div><br /><br />
				<div class="proposeTop">
					<div><img src="Website Assets/Upload Photo.png" /></div>
				</div>	
				<div class="proposeDesc">
					
					<table id="proposeForm">
						<tr>
							<td class="info">Username:</td>
							<td><input class="formField" type="text" name="username" id="username"/></td>
						</tr>
						<tr>
							<td class="info">First Name:</td>
							<td><input class="formField" type="text" name="fname" id="fname"/></td>
						</tr>
						<tr>
							<td class="info">Last Name:</td>
							<td><input class="formField" type="text" name="lname" id="lname" /></td>
						</tr>
						<tr>
							<td class="info">Email:</td>
							<td><input class="formField" type="email" name="email" id="email"/></td>
						</tr>
						<tr>
							<td class="info">Password:</td>
							<td><input class="formField" type="password" name="password" id="password" /></td>
						</tr>
						<tr>
							<td class="info">Confirm Password:</td>
							<td><input class="formField" type="password" name="confirmpassword" id="confirmpassword" /></td>
						</tr>
						<tr>
							<td class="info">Gender:</td>
							<td>Male<input class="formField" type="radio" name="gender" value ="m"/>
							Female<input class="formField" type="radio" name="gender" value ="f" /></td>
						</tr>
						<tr>
							<td class="info">Description:</td>
							<td><textarea rows="6" cols="30" class="formField" name = "description"></textarea></td>
							
						</tr>

									
					</table>
					<div id="formButtons">
						<input type="submit" class="orangeBox" />
						<button class="orangeBox">Cancel</button>
					</div>	
				</div>
			</form>
		</div><!-- end of mainContent -->
</body>
</html>