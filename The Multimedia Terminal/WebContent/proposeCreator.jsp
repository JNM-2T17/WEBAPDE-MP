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
		<c:set var="success" value="${sessionScope.proposalSuccess}" />
		<c:set var="np" value="${sessionScope.noProposal}" />
		<script>
			$(document).ready(function() {				
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
		<div id="mainContent">
			<form action='proposeCreator' method='post'>
				<h1>Creator Proposal</h1>
				<div class="orangeLine"></div><br /><br />
				<div class="proposeTop">
					<span class="info">Name:&nbsp;</span>
					<input class="formField" type="text" name="name" id="name" required />
					<br /><br />
					<div><img src="Website Assets/Upload Photo.png" /></div>
				</div>	
				<div class="proposeDesc">
					<div class="info">Biography: <br />
						<textarea id="descBox" class="formField" name="bio">${sessionScope.bio}</textarea>
					</div>
					<table id="proposeForm">
						<tr>
							<td class="info">Trivia:</td>
							<td><input class="formField" type="text" name="trivia" 
										id="trivia" 
										required /></td>
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