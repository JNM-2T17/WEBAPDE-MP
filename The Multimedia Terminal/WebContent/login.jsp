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
				<% if( (Boolean)request.getSession().getAttribute("fail") ) { %>
				$("#username").val('<%=request.getSession().getAttribute("username")%>');
				alert( 'Incorrect Username/Password Combo');
				<% } else if( (Boolean)request.getSession().getAttribute("registered") ){ %>
				$("#username").val('<%=request.getSession().getAttribute("username")%>');
				
				<%
					request.getSession().setAttribute("registered",false);
				}
				%>
				randomizeLogo();
				
				$("#homeLink").click(function() {
					setLoc("index.jsp");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainLogin">
			<form action="login" method="post" >
				<h1 id="loginLabel">User Login</h1>
				<input type="text" id="username" placeholder="Username" name="username" required /><br />
				<input type="password" id="password" placeholder="Password" name="password" required /><br />
				<div id="login"> 
					<a href="register" id="register">Create an Account</a>
					<input type="submit" value="Login" id="loginButton"/>
				</div>
			</form>
		</div> <!-- end of mainLogin -->
	</body>
</html>