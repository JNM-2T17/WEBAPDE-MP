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
			var results;
			var recs = [
				<c:forEach var="r" items="${recs}" varStatus="i">
					{
						'title' : '${r.workTo}',
						'classif' : '${r.workToClass}'
					}
					<c:if test="${!i.last}">
					,
					</c:if>
				</c:forEach>
			];
					
			var unrecs = [
				<c:forEach var="r" items="${unrecs}" varStatus="i">
					{
						'title' : '${r.workTo}',
						'classif' : '${r.workToClass}'
					}
					<c:if test="${!i.last}">
					,
					</c:if>
				</c:forEach>
			];
					
			function addListeners() {
				$("button[id^='work']").click(function() {
					var id = $(this).attr('id');
					console.log(id);
					var reco = $(this).text() == 'Add';
					var workTo = $("div#" + id).attr("data-title");
					var workToClass = $("div#" + id).attr("data-class");
					$.ajax({
						url : 'recommend',
						method : 'POST',
						data : {
							'add' : reco,
							'isRec' : '${isRec}',
							'workFrom' : '${t}',
							'workFromClass' : '${c}',
							'workTo' : workTo,
							'workToClass' : workToClass
						},
						success : function(a) {
							$("button#" + id).text( reco ? altText : 'Add' );
							if( reco ) {
								switchClass( $("button#" + id), 'approvedLink', 'wideLink' );
							} else {
								switchClass( $("button#" + id), 'wideLink', 'approvedLink' );
							}
							if( reco ) {
								recs.push({
									'title' : workTo,
									'classif' : workToClass
								});
							} else {
								for( i in recs ) {
									if( workTo == recs[i].title && workToClass == recs[i].classif ) {
										recs.splice(i,1);
										break;
									}
								}
							}
						}
					});
				});
			}
			
			var altText = '${isRec}' ? 'Recommended' : 'Unrecommended';
			
			function setResults(res) {
				results = [];
				var htmlStr = '';
				var i = 0;
				
				for( w in res ) {
					w = res[w];
					var found = false;
					for( temp in unrecs ) {
						if( w.title == unrecs[temp].title && w.classification == unrecs[temp].classif ) {
							found = true;
							break;
						}
					}
					if( !found && ( w.title != '${t}' || w.classification!='${c}' ) ) {
						results.push(w);
						htmlStr += '<div class="work" id="work' + i + '" data-title="' + w.title + '" data-class="' + w.classification + '">' +
						'<div class="img"><img src="' + (w.cover == null ? 'Website Assets/blank.png' : w.cover) + '" /></div>\n';
						found = false;
						for( w2 in recs ) {
							if( w.title == recs[w2].title && w.classification == recs[w2].classif ) {
								htmlStr += '<button class="approvedLink" id="work' + i + '">' + altText + '</button> <!-- end of link -->';
								found = true;
								break;
							} 
						}
						
						if( !found ) {
							htmlStr += '<button class="wideLink" id="work' + i + '">Add</button> <!-- end of link -->';
						}
						
						htmlStr += '<span>' + w.title + ' (' + w.releaseYear + ' ' + w.classification + ')</span>\n' +
						'<div class="rating">\n';
						for( var j = 0; j < 5; j++ ) {
							if( j < w.rating ) {
								htmlStr += '<img src="Website Assets/Filled Star.png" class="star" />\n';
							} else {
								htmlStr += '<img src="Website Assets/Empty Star.png" class="star" />\n';
							}
						}
						htmlStr += '<br />' + (w.rating == 0 ? 'No Rating' : Number(w.rating).toFixed(1)) + '\n' + 
							'</div> <!-- end of rating -->\n' +
							'<div class="description">\n' + 
								'<p>' + (w.description == null ? '' : w.description) + '</p>\n' +
							'</div> <!-- end of description -->\n' + 
						'</div> <!-- end of work -->\n';
						i++;
					}
				}
				$("#searchContent").html(htmlStr);
				addListeners();
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
				
				$("#recSearchForm").submit(function() {
					
					search($("input#search").val(),filter.attr('id'));
					return false;
				});
				
				$("input#recSearch").on('input', function() {
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
			<ul id="filterMenu">
				<li id="filterLabel">Filter By: </li>
				<li id="media" class="filterCritActive">Media</li>
				<li id="genre" class="filterCritInactive">Genre</li>
				<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
				<li id="rating" class="filterCritInactive">Rating</li>
				<li id="date" class="filterCritInactive">Date</li>
			</ul> <!--  end of filterMenu -->
			<div class = "recoHead" align = "center">
				<h2><a class="recoBack" href="work?t=${t}&c=${c}">
					<c:choose>
						<c:when test="${isRec}">
							Recommend
						</c:when>
						<c:otherwise>
							Unrecommend
						</c:otherwise>
					</c:choose>
					For: ${t} (${c})</a>
				</h2>
				<form id="recSearchForm">
					<input type="text" id="recSearch" placeholder="Search For Recommendations" />
				</form>
			</div><!-- end of recoHead -->
			<div id="searchContent" class="searchContent"></div> <!-- end of searchContent -->
		</div> <!-- end of mainContent -->
	</body>
</html>