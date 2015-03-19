<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The MultiType Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<script>
			$(document).ready(function() {
				randomizeLogo();
				
				$("#approveAlphabetical").hide();
				$("#approveDate").hide();
				
				var active = $("#approveType");
				var filter = $("li#type");
				
				$("#homeLink").click(function() {
					setLoc("#");
				});
				
				$("span#approveBar img").click(function() {
					document.search.submit();
				});
				
				$("li#type").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "approveType" ) {
						active.hide();
						active = $("#approveType").show();
					}
				});
				
				$("li#alphabetical").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "approveAlphabetical" ) {
						active.hide();
						active = $("#approveAlphabetical").show();
					}
				});
				
				$("li#date").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "approveDate" ) {
						active.hide();
						active = $("#approveDate").show();
					}
				});
			});
		</script>
		<%@ page import="java.util.Iterator,com.themmt.model.Work"%>
	</head>
	<body>
		<%Iterator itr = (Iterator)request.getSession().getAttribute("proposal0"); %>
		<header>
			<img id="logo" /><br />
			<div id="homeLink"><a href="index.html">Home</a></div>
			<div id="menubar">
				<form name="search" action="search">
					<ul id="menu">
						<li class="menuitem"><a href="login.html">Login</a></li>
						<li class="menuitem"><a href="favorites.html">Favorites</a></li>
						<li class="menuitem"><a href="admin">Admin</a></li>
						<li class="menuitem"><a href="propose">Propose Media</a></li>
					</ul> <!-- end of menu -->
					<span id="searchBar">
						<img src="Website Assets/search.png" />
							<input type="text" id="search" placeholder="Search..." name="s" />
					</span> <!-- end of searchBar -->
				</form>
			</div> <!--  end of menubar -->
		</header>
		<div id="mainContent">
			<h1 class="info">Work Proposals</h1>
			<ul id="filterMenu">
				<li id="filterLabel">Filter By: </li>
				<li id="type" class="filterCritActive">Type</li>
				<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
				<li id="date" class="filterCritInactive">Date</li>
			</ul> <!--  end of filterMenu -->
			<div id="approveType" class="approveContent">
				<%
					while( itr.hasNext() ) {
						Work w = (Work)itr.next();
				%>
				<div class="apprWork">
					<div class="img">
						<img src="<%= w.getCover() == null ? "Website Assets/blank.png":w.getCover()%>" />
					</div>
					<span class="info"><%=w.getClassification()%> Proposal</span>
					<div class="apprDesc">
						<p><%=w.getTitle()%> (<%=w.getReleaseYear() %>)</p>
						<p><%=w.getDescription()==null?"":w.getDescription()%></p>
					</div> <!-- end of description -->
					<div class="wideLink">
						<a href="workApprove?t=<%=w.getTitle()%>">View</a>
					</div> <!-- end of link -->
				</div> <!-- end of work -->
				<%
					}
				%>
			</div> <!-- end of approveType -->
			<%itr = (Iterator)request.getSession().getAttribute("proposal1"); %>
			<div id="approveAlphabetical" class="approveContent">
				<%
					while( itr.hasNext() ) {
						Work w = (Work)itr.next();
				%>
				<div class="apprWork">
					<div class="img">
						<img src="<%= w.getCover() == null ? "Website Assets/blank.png":w.getCover()%>" />
					</div>
					<span class="info"><%=w.getClassification()%> Proposal</span>
					<div class="apprDesc">
						<p><%=w.getTitle()%> (<%=w.getReleaseYear() %>)</p>
						<p><%=w.getDescription()==null?"":w.getDescription()%></p>
					</div> <!-- end of description -->
					<div class="wideLink">
						<a href="workApprove?t=<%=w.getTitle()%>">View</a>
					</div> <!-- end of link -->
				</div> <!-- end of work -->
				<%
					}
				%>
			</div> <!-- end of approveAlphabetical -->
			<%itr = (Iterator)request.getSession().getAttribute("proposal2"); %>
			<div id="approveDate" class="approveContent">
				<%
					while( itr.hasNext() ) {
						Work w = (Work)itr.next();
				%>
				<div class="apprWork">
					<div class="img">
						<img src="<%= w.getCover() == null ? "Website Assets/blank.png":w.getCover()%>" />
					</div>
					<span class="info"><%=w.getClassification()%> Proposal</span>
					<div class="apprDesc">
						<p><%=w.getTitle()%> (<%=w.getReleaseYear() %>)</p>
						<p><%=w.getDescription()==null?"":w.getDescription()%></p>
					</div> <!-- end of description -->
					<div class="wideLink">
						<a href="workApprove?t=<%=w.getTitle()%>">View</a>
					</div> <!-- end of link -->
				</div> <!-- end of work -->
				<%
					}
				%>
			</div> <!-- end of approveDate -->
		</div> <!-- end of mainContent -->
	</body>
</html>