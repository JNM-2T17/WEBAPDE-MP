<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="tmi.css" />
		<meta charset="ISO-8859-1">
		<script src="tmi.js"></script>
		<script src="jquery-2.1.1.js"></script>
		<title>Register</title>
		<script>
			$(document).ready(function() {
				randomizeLogo();
				
				<%  boolean fail = (Boolean)request.getSession().getAttribute("fail");
					if( fail ) { %>
				$("#fname").val('${sessionScope.fname}');
				$("#lname").val('${sessionScope.lname}');
				$("#email").val('${sessionScope.email}');
				$("#password").val('${sessionScope.password}');
				$("#description").text('${sessionScope.description}');
				alert( 'The username "${sessionScope.username}" is already taken.');
				<%}%>
				
				$("#homeLink").click(function() {
					setLoc("index.html");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
			});
			
			function checkPass() {
				if( $("#password").val() == $("#confirmpassword").val() ) {
					return true;
				} else {
					alert('Passwords don\'t match.');
					return false;
				}	
			}
			
			function checkDesc() {
				if( $("#desc").val().length > 255 ) {
					alert( 'Your description must be below 256 characters.');
					return false;
				}
				
				return true;
			}
		</script>
	</head>
	<body>
	<jsp:include page="header.html" />		
	<div id="mainContent">
			<form action='register' method='post' onSubmit='return checkDesc() && checkPass();'>
				<h1>User Registration</h1>
				<div class="orangeLine"></div><br /><br />
				<div class="proposeTop">
					<div><img src="Website Assets/Upload Photo.png" /></div>
				</div>	
				<div class="proposeDesc">
					
					<table id="proposeForm">
						<tr>
							<td class="info">Username:</td>
							<td><input class="formField" type="text" name="username" id="username" required /></td>
						</tr>
						<tr>
							<td class="info">First Name:</td>
							<td><input class="formField" type="text" name="fname" id="fname" required /></td>
						</tr>
						<tr>
							<td class="info">Last Name:</td>
							<td><input class="formField" type="text" name="lname" id="lname" required /></td>
						</tr>
						<tr>
							<td class="info">Email:</td>
							<td><input class="formField" type="email" name="email" id="email" required /></td>
						</tr>
						<tr>
							<td class="info">Password:</td>
							<td><input class="formField" type="password" name="password" id="password" required /></td>
						</tr>
						<tr>
							<td class="info">Confirm Password:</td>
							<td><input class="formField" type="password" name="confirmpassword" id="confirmpassword" required /></td>
						</tr>
						<tr>
							<td class="info">Gender:</td>
							<td>
								<label for="male">Male</label>
								<input class="formField" type="radio" id="male" name="gender" value ="m" 
									<%=fail && request.getSession().getAttribute("gender").equals("m") ? "checked" : "" %> required //>
								<label for="female">Female</label>
								<input class="formField" type="radio" id="female" name="gender" value ="f"  
									<%=fail && request.getSession().getAttribute("gender").equals("f") ? "checked" : "" %> //>
							</td>
						</tr>
						<tr>
							<td class="info">Description:</td>
							<td><textarea rows="6" cols="30" class="formField" id="desc" name = "description"></textarea></td>
						</tr>
					</table>
					<div id="formButtons">
						<input type="submit" class="orangeBox" />
						<button class="orangeBox" onClick="setLoc('login');">Cancel</button>
					</div>	
				</div>
			</form>
		</div><!-- end of mainContent -->
	</body>
</html>