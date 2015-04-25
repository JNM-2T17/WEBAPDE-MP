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
			<div class="info"><h1>Administator</h1></div>
			
			<div class = "adminBox">
				<div class="adminLink">
					<a href="adminApproval">View</a>
				</div> <!-- end of link -->
				Work Proposals <span class="info">(${propCount})</span>
			</div>
			<div class = "adminBox">
				<div class="adminLink">
					<a href="adminPageModify.html">View</a>
				</div> <!-- end of link -->
				Page Modifications <span class="info">(3)</span>
			</div>
			<div class = "adminBox">
				<div class="adminLink">
					<a href="adminKeyGenAppro">View</a>
				</div> <!-- end of link -->
				Keyword / Genre Proposals <span class="info">(${KeyGenCount})</span>
			</div>
			<div class = "orangeLine"></div><br />
			<div class = "adminBox">
				<div class="adminLink">
					<a href="adminReviewUser.html">View</a>
				</div> <!-- end of link -->
				User Complaints <span class="info">(2)</span>
			</div>
			<div class = "adminBox">
				<div class="adminLink">
					<a href="adminCheckReview.html">View</a>
				</div> <!-- end of link -->
				Review Complaints <span class="info">(1)</span>
			</div>
		</div><!-- end of mainContent -->
	</body>
</html>