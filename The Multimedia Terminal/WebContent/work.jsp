<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.themmt.model.Work,java.text.DecimalFormat" %>
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
				
				$("div.workSmall").mousedown(function(e) {
					//console.log(this.attr("data-link"));
					if( e.which == 1 ) {
						setLoc($(this).attr("data-link"));
					}
				});
				
				$("div.content").hide();
				
				$("div[id$=\"Form\"]").hide();
				
				$("div.workSection").click(function() {
					var type = $(this).attr("id");
					type = type.substring(4,type.length-1).toLowerCase();
					console.log(type);
					if($(this).attr("data-visible") == "true") {
						$("#" + $(this).attr("id") + "Cont").slideUp(700);
						$(this).attr("data-visible", "false" );
						$("#" + $(this).attr("id") + " div.arrow img").attr("src","Website Assets/Down Arrow.png");
					} else {
						$("#" + $(this).attr("id") + "Cont").slideDown(700);
						$(this).attr("data-visible", "true" );
						$("#" + $(this).attr("id") + " div.arrow img").attr("src","Website Assets/Up Arrow.png");
					}
				});
				
				$("div[id^=\"add\"]").click(function() {
					$(this).hide();
					var str = $(this).attr("id");
					var type = str.substring(3,str.length).toLowerCase();
					str = "div#" + type + "Form";
					console.log( str );
					$(str).show();
					flags[type] = true;
				});
				
				$("button[id^=\"cancel\"]").click(function() {
					var str = $(this).attr("id");
					var type = str.substring(6,str.length).toLowerCase();
					var divId = "div#" + type + "Form";
					console.log("divId = " + divId);
					$(divId).hide();
					str = "div#add" + type.charAt(0).toUpperCase() + type.slice(1);
					console.log( str );
					$(str).show();
					flags[type] = true;
				});
				
				<% 
					Work w = (Work)request.getSession().getAttribute("work");
					int rateCtr = ((Integer)request.getSession().getAttribute("rateCtr")).intValue();
					DecimalFormat df = new DecimalFormat();
					df.setMinimumFractionDigits(2);
					df.setMaximumFractionDigits(2);
				%>
				
				$("img[id $= \"recommend\"]").click(function() {
					setLoc($(this).attr("id") + "?t=<%=w.getTitle() %>&c=<%=w.getClassification() %>" );
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.html" />
		<div id="mainContent">
			<%if( w != null ) {%>
			<h1><%=w.getTitle() + "(" + w.getReleaseYear() + " " + w.getClassification() + ")" %></h1>
			<span class="rating">
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
			</span> <!-- end of rating --><br />
			<h4 id="ratingCtr"><%=rateCtr %> ratings</h4><br /><br />
			<div id="screenshots"><img src="<%=w.getCover()==null?"Website Assets/Screenshots.png":w.getCover() %>" /></div><br />
			<!--  div class="workSection" id="workGenres" data-visible="false">
				<span>Genres</span>
				<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
				<div class="orangeLine"></div>
			</div> <!-- end of workGenres --> <!-- <br />
			<div class="content" id="workGenresCont">
				<div id="addGenre">
					<img src="Website Assets/Plus Sign.png" id="addGenre" />&nbsp;Add Genre
				</div>
				<div class="addList">
					Action<span class="info">|</span>
					Adventure<span class="info">|</span>
					Thriller
				</div>
				<div id="genreForm">
					<form name="genre" class="workAdd" id="genre" action="anime.html">
						<input type="text" name="g" id="genre" />
						<input type="submit" value="Add Genre" class="orangeBox">
					</form>
					<button id="cancelGenre" class="orangeBox">Cancel</button>
				</div>
			</div> <!-- end of workGenresCont --> <!-- 
			<div class="workSection" id="workKeys" data-visible="false">
				<span>Keywords</span>
				<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
				<div class="orangeLine"></div>
			</div> <!-- end of workKeys --> <br /><!-- 
			<div class="content" id="workKeysCont">
				<div id="addKey">
					<img src="Website Assets/Plus Sign.png" id="addKey" />&nbsp;Add Keyword
				</div>
				<div class="addList">
					Potatopher's Stone<span class="info">|</span>
					Tomato Kaiju<span class="info">|</span>
					Death
				</div>
				<div id="keyForm">
					<form name="key" class="workAdd" id="key" action="anime.html">
						<input type="text" name="k" id="key" />
						<input type="submit" value="Add Keyword" class="orangeBox">
					</form>
					<button id="cancelKey" class="orangeBox">Cancel</button>
				</div>
			</div> <!-- end of workKeysCont --> 
			<div class="workSection" id="workDesc" data-visible="false">
				<span>Description</span>
				<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
				<div class="orangeLine"></div>
			</div> <!-- end of workDesc --> <br />
			<div class="content" id="workDescCont">
				<p><%=w.getDescription() %></p>
			</div> <!-- end of workDescCont -->
			<div class="workSection" id="workReview" data-visible="false">
				<span>Reviews</span>
				<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
				<div class="orangeLine"></div>
			</div> <!-- end of workReview --> <br />
			
			<form action="WorkToReviewServlet" id="reviewForm">
				<input type="hidden" value = "<%=w.getClassification()%>" name="titleclass" />
				<input type="hidden" value = "<%=w.getTitle()%>" name="title" />
				<div class="content" id="workReviewCont"><br />
					<a href="review?t=<%=w.getTitle() %>&c=<%=w.getClassification() %>" id="writeRev">Write a Review</a><br />
					<!-- <div class="review">
						<span class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
					</span> <!-- end of rating --><!-- 
						<b>Best Show Ever</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;April 3, 2012
						<p>By Hamburger (USA)</p>
						<p>Absolutely flawless. This anime is one of the greats.</p>
				</div> <!-- end of review -->
			</div> <!-- end of workReviewCont -->
			</form>
			
			<div class="workSection" id="workRec" data-visible="false">
				<span>Recommendations</span>
				<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
				<div class="orangeLine"></div>
			</div> <!-- end of workRec -->
			<div class="content" id="workRecCont">
				<div id="reco">
					<h3>Recommended</h3>
					<img src="Website Assets/Plus Sign.png" id="recommend"/> Make a Recommendation<br /><br />
				</div> <!-- end of reco -->
				<div id="unreco">
					<h3>Unrecommended</h3>
					<img src="Website Assets/Plus Sign.png" id="unrecommend"/> Make an Unrecommendation<br /><br />
				</div> <!-- end of unreco -->
			</div> <!-- end of workRecContent -->
			<%} else { %>
			<h1>Work does not exist</h1>
			<% }; %>
		</div><!-- end of mainContent -->
	</body>
</html>