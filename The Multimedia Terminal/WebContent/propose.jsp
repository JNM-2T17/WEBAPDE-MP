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
			<div class = "adminBox">
				<div class="adminLink">
					<a href="proposeMedia.jsp">Go</a>
				</div> <!-- end of link -->
				Propose Media
			</div>
			<div class = "adminBox">
				<div class="adminLink">
					<a href="proposeCreator.jsp">Go</a>
				</div> <!-- end of link -->
				Propose Creator
			</div>
		</div><!-- end of mainContent -->
	</body>
</html>