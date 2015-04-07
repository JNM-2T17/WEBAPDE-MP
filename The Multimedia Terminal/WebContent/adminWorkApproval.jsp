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
			<form action='approvedWork'>
				<h1>Work Proposal</h1>
				<div class="orangeLine"></div><br /><br />
				<div class="proposeTop">
					<span><%=request.getParameter("title")%></span>
					<br /><br />
					<div><img src="Website Assets/Upload Photo.png" /></div>
				</div>	
				<div class="proposeDesc">
					<div class="info">Description:</div>
					<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("description")%>
					</div>
					<table id="proposeForm">
						<tr>
							<td class="info">Year:</td>
							<td><%=request.getParameter("releaseYear")%></td>
						</tr>
					</table>
					<div id="formButtons">
						<input type="submit" class="orangeBox" value="Approve" />
						<input type="hidden" value = "<%=request.getParameter("title")%>" name="title" />
						<form action = "index.jsp">
							<button class="orangeBox">Cancel</button>
						</form>
					</div>	
				</div>
			</form>
		</div><!-- end of mainContent -->
	</body>
</html>