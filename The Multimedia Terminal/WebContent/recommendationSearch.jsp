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
				
				$("#trendingBook").hide();
				$("#trendingGame").hide();
				$("#trendingAnime").hide();
				$("#trendingMovie").hide();
				
				var active = $("#trendingAll");
				var filter = $("li#all");
				
				$("#homeLink").click(function() {
					setLoc("#");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
				
				$("li#all").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "trendingAll" ) {
						active.hide();
						active = $("#trendingAll").show();
					}
				});
				
				$("li#vg").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "trendingGame" ) {
						active.hide();
						active = $("#trendingGame").show();
					}
				});
				
				$("li#book").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "trendingBook" ) {
						active.hide();
						active = $("#trendingBook").show();
					}
				});
				
				$("li#anime").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "trendingAnime" ) {
						active.hide();
						active = $("#trendingAnime").show();
					}
				});
				
				$("li#movie").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "trendingMovie" ) {
						active.hide();
						active = $("#trendingMovie").show();
					}
				});
			});
			
			
			<%
			
			String pageName;
			if(request.getParameter("isRec").equals("1"))
					{
					pageName ="Recommend";
					}
					else
					{
					pageName="Unrecommend";
					}
					%>
		</script>
		<%@page import="com.themmt.model.Work,java.util.Iterator,java.text.DecimalFormat" %>
	</head>
	<body>
		<%!
			DecimalFormat df = new DecimalFormat();
		%>
		<%
			df.setMaximumFractionDigits(2);
			df.setMinimumFractionDigits(2);
		%>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<%Iterator itr = (Iterator)request.getSession().getAttribute("home"); %>
			<h1><%=pageName%> a Work</h1>
			<div id="trendingAll" class="trendingContent">
				<% 
					while(itr.hasNext() ) {
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
					
						<a href="addRecommendation?workTo=<%=w.getTitle() %>&workToClass=<%=w.getClassification()%>&isRec=<%=request.getParameter("isRec")%>"><%=pageName%></a>
						
						
						
					</div> <!-- end of link -->
				</div> <!-- end of work -->
				<%
					}
				%>
			</div> <!-- end of trendingAll -->
		</div> <!-- end of mainContent -->
	</body>
</html>