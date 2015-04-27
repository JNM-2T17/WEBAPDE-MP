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
		<script>
			var results;
			
			function setResults(res) {
				results = [];
				var htmlStr = '';
				
				for( w in res ) {
					w = res[w];
					results.push(w);
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
				$("#searchContent").html(htmlStr);
			}
			
			function search(crit,sort) {
				$.ajax({
					url : 'search',
					method : 'POST',
					data : {"s" : crit},
					dataType : "json",
					success : function(a) {
						switch( sort ) {
							case 'media':
								a.sort(function(a,b) {
									if( a.classification.localeCompare(b.classification) != 0 ) {
										return a.classification.localeCompare(b.classification);
									} else if( a.title.localeCompare( b.title ) != 0 ) {
										return a.title.localeCompare( b.title );
									} else if( a.releaseYear != b.releaseYear ) {
										return ( b.releaseYear - a.releaseYear );
									} else return ( b.rating - a.rating );
								});
								break;
							case 'alphabetical':
								a.sort(function(a,b) {
									if( a.title.localeCompare( b.title ) != 0 ) {
										return a.title.localeCompare( b.title );
									} else if( a.classification.localeCompare(b.classification) != 0 ) {
										return a.classification.localeCompare(b.classification);
									} else if( a.releaseYear != b.releaseYear ) {
										return ( b.releaseYear - a.releaseYear );
									} else return ( b.rating - a.rating );
								});
								break;
							case 'rating':
								a.sort(function(a,b) {
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
								break;
							case 'date':
								a.sort(function(a,b) {
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
								break;
							default:
						}
						setResults(a);
					}
				});
			}
			
			search( '${crit}', 'media' );
			
			$(document).ready(function() {
				randomizeLogo();
				
				$("#searchAlphabetical").hide();
				$("#searchRating").hide();
				$("#searchDate").hide();
				
				var filter = $("li#media");
				
				$("#homeLink").click(function() {
					setLoc("start");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
				
				$("#searchForm").submit(function() {
					
					search($("input#search").val(),filter.attr('id'));
					return false;
				});
				
				$("input#search").on('input', function() {
					search($(this).val(),filter.attr('id'));
				});
				
				$("li#media").click(function() {
					if( filter.attr("id") != "media" ) {
						results.sort(function(a,b) {
							if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.releaseYear != b.releaseYear ) {
								return ( b.releaseYear - a.releaseYear );
							} else return ( b.rating - a.rating );
						});
						setResults(results);
					}
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
				});
				
				$("li#alphabetical").click(function() {
					if( filter.attr("id") != "alphabetical" ) {
						results.sort(function(a,b) {
							if( a.title.localeCompare( b.title ) != 0 ) {
								return a.title.localeCompare( b.title );
							} else if( a.classification.localeCompare(b.classification) != 0 ) {
								return a.classification.localeCompare(b.classification);
							} else if( a.releaseYear != b.releaseYear ) {
								return ( b.releaseYear - a.releaseYear );
							} else return ( b.rating - a.rating );
						});
						setResults(results);
					}
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
				});
				
				$("li#rating").click(function() {
					if( filter.attr("id") != "rating" ) {
						results.sort(function(a,b) {
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
						setResults(results);
					}
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
				});
				
				$("li#date").click(function() {
					if( filter.attr("id") != "date" ) {
						results.sort(function(a,b) {
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
						setResults(results);
					}
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<h1>Search</h1>
			<ul id="filterMenu">
				<li id="filterLabel">Filter By: </li>
				<li id="media" class="filterCritActive">Media</li>
				<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
				<li id="rating" class="filterCritInactive">Rating</li>
				<li id="date" class="filterCritInactive">Date</li>
			</ul> <!--  end of filterMenu -->
			<div id="searchContent"></div> <!-- end of searchContent -->
		</div> <!-- end of mainContent -->
	</body>
</html>