<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<script>
			$(document).ready(function() {
				<c:set var="user" value="${sessionScope.username}" />
				<c:choose>
					<c:when test="${sessionScope.fail}">
						$("#username").val('${user}');
						alert( 'Incorrect Username/Password Combo');
					</c:when>
					<c:when test="${sessionScope.registered}">
						$("#username").val('${user}');
						<c:set target="sessionScope" value="false" />
					</c:when>
				</c:choose>
				var reg = ${sessionScope.registered};
				randomizeLogo();
				
				$("#homeLink").click(function() {
					setLoc("start");
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