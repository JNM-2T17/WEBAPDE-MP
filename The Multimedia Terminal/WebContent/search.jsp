<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<script>
			$(document).ready(function() {
				randomizeLogo();
				
				$("#searchAlphabetical").hide();
				$("#searchRating").hide();
				$("#searchDate").hide();
				
				var active = $("#searchMedia");
				var filter = $("li#media");
				
				$("#homeLink").click(function() {
					setLoc("index.html");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
				
				$("li#media").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchMedia" ) {
						active.hide();
						active = $("#searchMedia").show();
					}
				});
				
				$("li#alphabetical").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchAlphabetical" ) {
						active.hide();
						active = $("#searchAlphabetical").show();
					}
				});
				
				$("li#rating").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchRating" ) {
						active.hide();
						active = $("#searchRating").show();
					}
				});
				
				$("li#date").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchDate" ) {
						active.hide();
						active = $("#searchDate").show();
					}
				});
			});
		</script>
		<%@page import="java.util.Iterator,java.text.DecimalFormat,com.themmt.model.Work" %>
	</head>
	<body>
		<%!
			DecimalFormat df = new DecimalFormat();
		%>
		<%
			df.setMaximumFractionDigits(2);
			df.setMinimumFractionDigits(2);
		%>
		<jsp:include page="header.html" />
		<div id="mainContent">
			<h1>Search</h1>
			<ul id="filterMenu">
				<li id="filterLabel">Filter By: </li>
				<li id="media" class="filterCritActive">Media</li>
				<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
				<li id="rating" class="filterCritInactive">Rating</li>
				<li id="date" class="filterCritInactive">Date</li>
			</ul> <!--  end of filterMenu -->
			<div id="searchMedia" class="searchContent">
			<% 
				Iterator itr = (Iterator)request.getSession().getAttribute("search0");
				if( itr.hasNext() ) {
					while( itr.hasNext() ) {
						Work w = (Work)itr.next();
			%>
				<div class="work">
					<div class="img"><img src="<%=w.getCover() == null?"Website Assets/blank.png":w.getCover()%>" /></div>
					<div class="rating">
						<%
							int n = (int)Math.round(w.getRating());
							int i = 0;
							for( ; i < n; i++ ) { 
						%>
						<img src="Website Assets/Filled Star.png" class="star" />
						<%
							}
							for( ; i < 5; i++ ) {
						%>
						<img src="Website Assets/Empty Star.png" class="star" />
						<%
							}
						%>
						<br /><%=w.getRating() == 0 ? "No Rating" : df.format(w.getRating())%>
					</div> <!-- end of rating -->
					<span><%=w.getTitle() %> (<%=w.getReleaseYear() + " " + w.getClassification()%>)</span>
					<div class="description">
						<p><%=w.getDescription() == null ? "" : w.getDescription()%></p>
					</div> <!-- end of description -->
					<div class="link">
						<a href="work?t=<%=w.getTitle()%>&c=<%=w.getClassification()%>">Tell Me More</a>
					</div> <!-- end of link -->
				</div> <!-- end of work -->
			<%
					}
				} else {
			%>	
				<div>No Results to Show</div>
			<% } %>
			</div> <!-- end of searchMedia -->
			<div id="searchAlphabetical" class="searchContent">
			<% 
				itr = (Iterator)request.getSession().getAttribute("search1");
				if( itr.hasNext() ) {
					while( itr.hasNext() ) {
						Work w = (Work)itr.next();
			%>
				<div class="work">
					<div class="img"><img src="<%=w.getCover() == null?"Website Assets/blank.png":w.getCover()%>" /></div>
					<div class="rating">
						<%
							int n = (int)Math.round(w.getRating());
							int i = 0;
							for( ; i < n; i++ ) { 
						%>
						<img src="Website Assets/Filled Star.png" class="star" />
						<%
							}
							for( ; i < 5; i++ ) {
						%>
						<img src="Website Assets/Empty Star.png" class="star" />
						<%
							}
						%>
						<br /><%=w.getRating() == 0 ? "No Rating" : df.format(w.getRating())%>
					</div> <!-- end of rating -->
					<span><%=w.getTitle() %> (<%=w.getReleaseYear() + " " + w.getClassification()%>)</span>
					<div class="description">
						<p><%=w.getDescription() == null ? "" : w.getDescription()%></p>
					</div> <!-- end of description -->
					<div class="link">
						<a href="work?t=<%=w.getTitle()%>&c=<%=w.getClassification()%>">Tell Me More</a>
					</div> <!-- end of link -->
				</div> <!-- end of work -->
			<%
					}
				} else {
			%>	
				<div>No Results to Show</div>
			<% } %>
			</div> <!-- end of searchAlphabetical -->
			<div id="searchRating" class="searchContent">
			<% 
				itr = (Iterator)request.getSession().getAttribute("search2");
				if( itr.hasNext() ) {
					while( itr.hasNext() ) {
						Work w = (Work)itr.next();
			%>
				<div class="work">
					<div class="img"><img src="<%=w.getCover() == null?"Website Assets/blank.png":w.getCover()%>" /></div>
					<div class="rating">
						<%
							int n = (int)Math.round(w.getRating());
							int i = 0;
							for( ; i < n; i++ ) { 
						%>
						<img src="Website Assets/Filled Star.png" class="star" />
						<%
							}
							for( ; i < 5; i++ ) {
						%>
						<img src="Website Assets/Empty Star.png" class="star" />
						<%
							}
						%>
						<br /><%=w.getRating() == 0 ? "No Rating" : df.format(w.getRating())%>
					</div> <!-- end of rating -->
					<span><%=w.getTitle() %> (<%=w.getReleaseYear() + " " + w.getClassification()%>)</span>
					<div class="description">
						<p><%=w.getDescription() == null ? "" : w.getDescription()%></p>
					</div> <!-- end of description -->
					<div class="link">
						<a href="work?t=<%=w.getTitle()%>&c=<%=w.getClassification()%>">Tell Me More</a>
					</div> <!-- end of link -->
				</div> <!-- end of work -->
			<%
					}
				} else {
			%>	
				<div>No Results to Show</div>
			<% } %>
			</div> <!-- end of searchRating -->
			<div id="searchDate" class="searchContent">
			<% 
				itr = (Iterator)request.getSession().getAttribute("search3");
				if( itr.hasNext() ) {
					while( itr.hasNext() ) {
						Work w = (Work)itr.next();
			%>
				<div class="work">
					<div class="img"><img src="<%=w.getCover() == null?"Website Assets/blank.png":w.getCover()%>" /></div>
					<div class="rating">
						<%
							int n = (int)Math.round(w.getRating());
							int i = 0;
							for( ; i < n; i++ ) { 
						%>
						<img src="Website Assets/Filled Star.png" class="star" />
						<%
							}
							for( ; i < 5; i++ ) {
						%>
						<img src="Website Assets/Empty Star.png" class="star" />
						<%
							}
						%>
						<br /><%=w.getRating() == 0 ? "No Rating" : df.format(w.getRating())%>
					</div> <!-- end of rating -->
					<span><%=w.getTitle() %> (<%=w.getReleaseYear() + " " + w.getClassification()%>)</span>
					<div class="description">
						<p><%=w.getDescription() == null ? "" : w.getDescription()%></p>
					</div> <!-- end of description -->
					<div class="link">
						<a href="work?t=<%=w.getTitle()%>&c=<%=w.getClassification()%>">Tell Me More</a>
					</div> <!-- end of link -->
				</div> <!-- end of work -->
			<%
					}
				} else {
			%>	
				<div>No Results to Show</div>
			<% } %>
			</div> <!-- end of searchDate -->
		</div> <!-- end of mainContent -->
	</body>
</html>