<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<div id="mainContent">
			<form action='index.html'>
				<h1>Work Proposal</h1>
				<div class="orangeLine"></div><br /><br />
				<div class="proposeTop">
					<span><%=request.getParameter("title")%></span>
					<br /><br />
					<div><img src="Website Assets/Upload Photo.png" /></div>
				</div>	
				<div class="proposeDesc">
					<div class="info">Description:</div>
					<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A film about a sad tomato.
					</div>
					<table id="proposeForm">
						<tr>
							<td class="info">Director:</td>
							<td>Steven Potatoberg</td>
						</tr>
						<tr>
							<td class="info">Writer:</td>
							<td>Steven Potatoberg</td>
						</tr>
						<tr>
							<td class="info">Developer:</td>
							<td>Warner Bros.</td>
						</tr>
						<tr>
							<td class="info">Year:</td>
							<td>1994</td>
						</tr>
						<tr>
							<td class="info">Genre:</td>
							<td>Comedy, Horror, Drama</td>
						</tr>
						<tr>
							<td class="info">Specifications:</td>
							<td>2.35:1</td>
						</tr>
						<tr>
							<td class="info">Running time:</td>
							<td>10 sec</td>
						</tr>
					</table>
					<div id="formButtons">
						<input type="submit" class="orangeBox" value="Approve" />
						<button class="orangeBox">Cancel</button>
					</div>	
				</div>
			</form>
		</div><!-- end of mainContent -->
	</body>
</html>