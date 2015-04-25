<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<h1>Trending</h1>
			<div id="trendingAll" class="trendingContent">
				<c:forEach var="w" items="${sessionScope.home}">
					<div class="work">
						<div class="img">
							<c:choose>
								<c:when test="${empty w.cover}">
									<img src="Website Assets/blank.png" />
								</c:when>
								<c:otherwise>
									<img src="${w.cover}" />
								</c:otherwise>
							</c:choose>
						</div>		
						<div class="rating">
							<c:forEach varStatus="i" begin="1" end="5">
								<c:choose>
									<c:when test="${i.index <= w.rating}">
										<img src="Website Assets/Filled Star.png" class="star" />
									</c:when>
									<c:otherwise>
										<img src="Website Assets/Empty Star.png" class="star" />
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<br />
							<c:choose>
								<c:when test="${w.rating == 0}">
									No Rating
								</c:when>
								<c:otherwise>
									<fmt:formatNumber value="${w.rating}" maxFractionDigits="1" minFractionDigits="1" />
								</c:otherwise>
							</c:choose>
						</div> <!-- end of rating -->
						<span>${w.title} (${w.releaseYear} ${w.classification})</span>
						<div class="description">
							<p><c:if test="${not empty w.description}">${w.description}</c:if></p>
						</div> <!-- end of description -->
						<div class="link">
							<a href="work?t=${w.title}&c=${w.classification}">Tell Me More</a>
						</div> <!-- end of link -->
					</div> <!-- end of work -->
				</c:forEach>
			</div> <!-- end of trendingAll -->
		</div> <!-- end of mainContent -->
	</body>
</html>