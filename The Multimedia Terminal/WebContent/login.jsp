<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<script>
			$(document).ready(function() {
				randomizeLogo();
				
				$("#homeLink").click(function() {
					setLoc("index.html");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.html" />
		<div id="mainLogin">
			<form action="LoginServlet" method="post" >
				<h1 id="loginLabel">User Login</h1>
				<input type="text" placeholder="Username" name="username" required /><br />
				<input type="password" placeholder="Password" name="password" required /><br />
				<div id="login"> <a href="register.jsp" >Create an Account</a><input type="submit" value="Login" id="loginButton"/></div>

			</form>
			
		</div> <!-- end of mainLogin -->
	</body>
</html>