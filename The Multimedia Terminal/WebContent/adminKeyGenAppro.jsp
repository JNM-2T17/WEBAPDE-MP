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
		<%@ page import="java.util.Iterator,com.themmt.model.Keyword"%>
		<%@ page import="java.util.Iterator,com.themmt.model.Genre"%>
	</head>
	<body>
		<%Iterator itr = (Iterator)request.getSession().getAttribute("proposal3"); %>
		<%Iterator itrs = (Iterator)request.getSession().getAttribute("proposal4"); %>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<h1 class="info">Keyword / Genre Proposals</h1>
			<h2>Keyword</h2>
			<div id="approveType" class="approveContent">
				<%
					while( itrs.hasNext() ) {
						Keyword k = (Keyword)itrs.next();
				%>
				<div class="apprWork">
					<span class="info"><%=k.getKeyword()%></span>
					<div class="apprDesc">
						<span><%=k.getTitle()%></span>
					</div> <!-- end of description -->
					<div class="wideLink">
						<form action = "keywordApprove" method = "post">
							<button class="orangeBox">Approve</button>
							<input type="hidden" value = "verified" name="title" />
						</form>
					</div>
				</div> 
				<% } %>
			</div>
			
			<div class="orangeLine"></div>
			<h2>Genre</h2>
			<div id="approveType" class="approveContent">
				<%
					while( itr.hasNext() ) {
						Genre g = (Genre)itr.next();
				%>
				<% if (!g.isVerified()) %>
				<div class="apprWork">
					<span class="info"><%=g.getGenre()%></span>
					<div class="apprDesc">
						<span><%=g.getTitle()%></span>
					</div> <!-- end of description -->
					<div class="wideLink">
						<form action = "keywordApprove" method = "post">
							<button class="orangeBox">Approve</button>
							<input type="hidden" value = "verified" name="title" />
						</form>
					</div>
				</div> 
				<% } %>
			</div>
			
		</div>
	</body>
</html>