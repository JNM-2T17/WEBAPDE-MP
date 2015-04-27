<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<c:set var="res" value="${sessionScope.search}" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<c:set var="user" value="${sessionScope.username}" />
		<script>
			var favorites;
			var tastes;
			
			function setFavs(fav) {
				favorites = [];
				var htmlStr = '';
				
				for( w in fav ) {
					w = fav[w];
					favorites.push(w);
					htmlStr += '<div class="work">' +
					'<div class="img"><img src="' + (w.cover == null ? 'Website Assets/blank.png' : w.cover) + '" /></div>\n' + 
					'<div class="rating">\n';
					for( var i = 0; i < 5; i++ ) {
						if( i < w.rating ) {
							htmlStr += '<img src="Website Assets/Filled Star.png" class="star" />\n';
						} else {
							htmlStr += '<img src="Website Assets/Empty Star.png" class="star" />\n';
						}
					}
					htmlStr += '<br />' + (w.rating == 0 ? 'No Rating' : Number(w.rating).toFixed(1)) + '\n' + 
						'</div> <!-- end of rating -->\n' +
						'<span>' + w.title + ' (' + w.releaseYear + ' ' + w.classification + ')</span>\n' +
						'<div class="description">\n' + 
							'<p>' + (w.description == null ? '' : w.description) + '</p>\n' +
						'</div> <!-- end of description -->\n' + 
						'<div class="link">\n' +
							'<a href="work?t=' + w.title + '&c=' + w.classification + '">Tell Me More</a>\n' +
						'</div> <!-- end of link -->\n' +
					'</div> <!-- end of work -->\n';
				}
				$("#favContent").html(htmlStr);
			}
			
			function setTastes(taste) {
				tastes = [];
				var htmlStr = '';
				
				for( w in taste ) {
					w = taste[w];
					tastes.push(w);
					htmlStr += '<div class="work">' +
					'<div class="img"><img src="' + (w.cover == null ? 'Website Assets/blank.png' : w.cover) + '" /></div>\n' + 
					'<div class="rating">\n';
					for( var i = 0; i < 5; i++ ) {
						if( i < w.rating ) {
							htmlStr += '<img src="Website Assets/Filled Star.png" class="star" />\n';
						} else {
							htmlStr += '<img src="Website Assets/Empty Star.png" class="star" />\n';
						}
					}
					htmlStr += '<br />' + (w.rating == 0 ? 'No Rating' : Number(w.rating).toFixed(1)) + '\n' + 
						'</div> <!-- end of rating -->\n' +
						'<span>' + w.title + ' (' + w.releaseYear + ' ' + w.classification + ')</span>\n' +
						'<div class="description">\n' + 
							'<p>' + (w.description == null ? '' : w.description) + '<br /><br />Because you favorited ';
					for( var i in w.keywords ) {
						if( w.keywords.length != 1 && i == w.keywords.length - 1 ) {
							htmlStr += "and ";
						}
						htmlStr += w.keywords[i];
						if( i < w.keywords.length - 1 ) {
							htmlStr += ", ";
						}
					}
					htmlStr += '.</p>\n' +
						'</div> <!-- end of description -->\n' + 
						'<div class="link">\n' +
							'<a href="work?t=' + w.title + '&c=' + w.classification + '">Tell Me More</a>\n' +
						'</div> <!-- end of link -->\n' +
					'</div> <!-- end of work -->\n';
				}
				console.log(tastes);
				$("#tasteContent").html(htmlStr);
			}
			
			function init(crit) {
				$.ajax({
					url : 'favorite',
					method : 'POST',
					data : {
						"init" : true,
						"user" : crit
					},
					dataType : "json",
					success : function(a) {
						setFavs(a)
					}
				});
				
				$.ajax({
					url : 'taste',
					method : 'POST',
					data : {
						"user" : crit
					},
					dataType : "json",
					success : function(a) {
						setTastes(a)
					}
				});
			}
			
			<c:if test="${not empty user}">
				init( '${user}' );
			</c:if>
			
			$(document).ready(function() {
				randomizeLogo();
				
				$("#searchAlphabetical").hide();
				$("#searchRating").hide();
				$("#searchDate").hide();
				
				var filter = $("li#media");
				var filter2 = $("li#media2");
				
				$("#homeLink").click(function() {
					setLoc("start");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
				
				$("li#media").click(function() {
					if( filter.attr("id") != "media" ) {
						favorites.sort(function(a,b) {
							if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.releaseYear != b.releaseYear ) {
								return ( b.releaseYear - a.releaseYear );
							} else return ( b.rating - a.rating );
						});
						setFavs(favorites);
					}
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
				});
				
				$("li#alphabetical").click(function() {
					if( filter.attr("id") != "alphabetical" ) {
						favorites.sort(function(a,b) {
							if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else if( a.releaseYear != b.releaseYear ) {
								return ( b.releaseYear - a.releaseYear );
							} else return ( b.rating - a.rating );
						});
						setFavs(favorites);
					}
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
				});
				
				$("li#rating").click(function() {
					if( filter.attr("id") != "rating" ) {
						favorites.sort(function(a,b) {
							if( a.rating != b.rating ) {
								return (b.rating - a.rating);
							} else if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else {
								return ( a.releaseYear - b.releaseYear );
							}
						});
						setFavs(favorites);
					}
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
				});
				
				$("li#date").click(function() {
					if( filter.attr("id") != "date" ) {
						favorites.sort(function(a,b) {
							if( a.releaseYear != b.releaseYear ) {
								return (b.releaseYear - a.releaseYear);
							} else if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else {
								return ( a.rating - b.rating );
							}
						});
						setFavs(favorites);
					}
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
				});
				
				$("li#media2").click(function() {
					if( filter2.attr("id") != "media2" ) {
						tastes.sort(function(a,b) {
							if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.releaseYear != b.releaseYear ) {
								return ( b.releaseYear - a.releaseYear );
							} else return ( b.rating - a.rating );
						});
						setTastes(tastes);
					}
					setFilterCrit(filter2, false);
					filter2 = setFilterCrit($(this),true);
				});
				
				$("li#alphabetical2").click(function() {
					if( filter2.attr("id") != "alphabetical2" ) {
						tastes.sort(function(a,b) {
							if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else if( a.releaseYear != b.releaseYear ) {
								return ( b.releaseYear - a.releaseYear );
							} else return ( b.rating - a.rating );
						});
						setTastes(tastes);
					}
					setFilterCrit(filter2, false);
					filter2 = setFilterCrit($(this),true);
				});
				
				$("li#rating2").click(function() {
					if( filter2.attr("id") != "rating2" ) {
						tastes.sort(function(a,b) {
							if( a.rating != b.rating ) {
								return (b.rating - a.rating);
							} else if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else {
								return ( a.releaseYear - b.releaseYear );
							}
						});
						setTastes(tastes);
					}
					setFilterCrit(filter2, false);
					filter2 = setFilterCrit($(this),true);
				});
				
				$("li#date2").click(function() {
					if( filter2.attr("id") != "date2" ) {
						tastes.sort(function(a,b) {
							if( a.releaseYear != b.releaseYear ) {
								return (b.releaseYear - a.releaseYear);
							} else if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else {
								return ( a.rating - b.rating );
							}
						});
						setTastes(tastes);
					}
					setFilterCrit(filter2, false);
					filter2 = setFilterCrit($(this),true);
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<c:choose>
				<c:when test="${empty user}">
					Please Log In First
				</c:when>
				<c:otherwise>
					<h1>${user}'s Favorites</h1>
					<ul id="filterMenu">
						<li id="filterLabel">Filter By: </li>
						<li id="media" class="filterCritActive">Media</li>
						<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
						<li id="rating" class="filterCritInactive">Rating</li>
						<li id="date" class="filterCritInactive">Date</li>
					</ul> <!--  end of filterMenu -->
					<div id="favContent"></div> <!-- end of searchContent -->
					<br /><div class = "orangeLine"></div><br />
					<h1>Recommendations for ${user}</h1>
					<ul id="filterMenu">
						<li id="filterLabel">Filter By: </li>
						<li id="media2" class="filterCritActive">Media</li>
						<li id="alphabetical2" class="filterCritInactive">Alphabetical</li>
						<li id="rating2" class="filterCritInactive">Rating</li>
						<li id="date2" class="filterCritInactive">Date</li>
					</ul> <!--  end of filterMenu -->
					<div id="tasteContent"></div> <!-- end of searchContent -->
				</c:otherwise>
			</c:choose>
		</div> <!-- end of mainContent -->
	</body>
</html>