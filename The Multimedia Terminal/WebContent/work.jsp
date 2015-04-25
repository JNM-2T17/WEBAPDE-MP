<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.themmt.model.Work,com.themmt.model.Review,java.util.Iterator,java.text.DecimalFormat" %>
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
					setLoc("recommend" + "?t=${sessionScope.work.title}&c=${sessionScope.work.classification}&isRec=1" );
				});
				
				$("img[id $= \"unrecommend\"]").click(function() {
					setLoc("recommend" + "?t=${sessionScope.work.title}&c=${sessionScope.work.classification}&isRec=0" );
				});
				
				
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<c:choose>
				<c:when test="${ not empty sessionScope.work}">
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
					
					<form action="review" id="reviewForm">
						<input type="hidden" value = "<%=w.getClassification()%>" name="titleclass" />
						<input type="hidden" value = "<%=w.getTitle()%>" name="title" />
						<div class="content" id="workReviewCont"><br />
						<a href="review?t=<%=w.getTitle() %>&c=<%=w.getClassification() %>" id="writeRev">Write a Review</a><br />
							<%Iterator revItr = (Iterator)request.getSession().getAttribute("reviews"); %>
						
						
						<% 
							while(revItr.hasNext() ) {
								Review rev= (Review)revItr.next();
						%>
								<div class="review">
									<span class="rating">
										<%
											for( i = 0; i < (int)rev.getRating(); i++) { %>	
										<img src="Website Assets/Filled Star.png" class="star" />
										<%} 
											for( ; i < 5; i++ ) { %>
										<img src="Website Assets/Empty Star.png" class="star" />
										<%}%>
									</span> <!-- end of rating --> 
										<b><%=rev.getUsername()%></b>
										<p><%=rev.getReview() %></p>
								</div> <!-- end of review -->
						<%}%>
						<br>
										
						
						
					</div> <!-- end of workReviewCont -->
					</form>
					
					<div class="workSection" id="workRec" data-visible="false">
						<span>Recommendations</span>
						<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
						<div class="orangeLine"></div>
					</div> <!-- end of workRec -->
					<div class="content" id="workRecCont">
						<div id="reco" >
							<h3>Recommended</h3>
						<%Iterator itr = (Iterator)request.getSession().getAttribute("recommendations"); %>
						
						<% 
							while(itr.hasNext() ) {
								Work rw= (Work)itr.next();
								System.out.println("Summoned: "+rw.getTitle());
						%>
						
								<div class="work">
								<%=rw.getTitle()%>
								<div class="img"><img src="<%=rw.getCover() == null?"Website Assets/blank.png":rw.getCover()%>" /></div>
								
								
								<div class="rating">
								
								<%
									int nx = (int)Math.round(rw.getRating());
									int ix = 0;
									for( ; ix < nx; ix++ ) { 
								%>
								<img src="Website Assets/Filled Star.png" class="star" />
								<%
									}
									for( ; ix < 5; ix++ ) {
								%>
								<img src="Website Assets/Empty Star.png" class="star" />
								<%
									}
								%>
								<br /><%=rw.getRating() == 0 ? "No Rating" : df.format(rw.getRating())%>
							</div> <!-- end of rating -->
								</br>
								<%=rw.getDescription()%>
								<div class="link">
								<a href="work?t=<%=rw.getTitle()%>&c=<%=rw.getClassification()%>">Tell Me More</a>
							</div> <!-- end of link -->
								</div>	
							<%} %>	
							
							<%if(session.getAttribute("username")!=null){%>
							
							<img src="Website Assets/Plus Sign.png" id="recommend"/> Make a Recommendation<br /><br />
							<%}else{ %>
							Login first to recommend a work
							<%} %>
						</div> <!-- end of reco -->
						<div id="unreco">
							<h3>Unrecommended</h3>
							
							
							
							<%itr = (Iterator)request.getSession().getAttribute("unrecommendations"); %>
						
						<% 
							while(itr.hasNext() ) {
								Work rw= (Work)itr.next();
								System.out.println("Summoned: "+rw.getTitle());
						%>
						
								<div class="work">
								<%=rw.getTitle()%>
								<div class="img"><img src="<%=rw.getCover() == null?"Website Assets/blank.png":rw.getCover()%>" /></div>
								
								
								<div class="rating">
								<%
									int nx = (int)Math.round(rw.getRating());
									int ix = 0;
									for( ; ix < nx; ix++ ) { 
								%>
								<img src="Website Assets/Filled Star.png" class="star" />
								<%
									}
									for( ; ix < 5; ix++ ) {
								%>
								<img src="Website Assets/Empty Star.png" class="star" />
								<%
									}
								%>
								<br /><%=rw.getRating() == 0 ? "No Rating" : df.format(rw.getRating())%>
							</div> <!-- end of rating -->
								</br>
								<%=rw.getDescription()%>
								<div class="link">
								<a href="work?t=<%=rw.getTitle()%>&c=<%=rw.getClassification()%>">Tell Me More</a>
							</div> <!-- end of link -->
								</div>	
							<%} %>	
							
							
							<%if(session.getAttribute("username")!=null){%>
							
							<img src="Website Assets/Plus Sign.png" id="unrecommend"/> Make an Unrecommendation<br /><br />
							<%}else{ %>
							Login first to unrecommend a work
							<%} %>
						</div> <!-- end of unreco -->
					</div> <!-- end of workRecContent -->
				</c:when>
				<c:otherwise>
					<h1>Work does not exist</h1>
				</c:otherwise>
			</c:choose>
		</div><!-- end of mainContent -->

		
	</body>
</html>