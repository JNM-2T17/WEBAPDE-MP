<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<c:set var="w" value="${sessionScope.work}" />
		<c:set var="rateCtr" value="${sessionScope.rateCtr}" />
		<c:set var="username" value="${sessionScope.username}" />
		<c:set var="user" value="${not empty username}" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<script>
			$(document).ready(function() {
				var user = ${user};
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
					if( user ) {
						$(this).hide();
						var str = $(this).attr("id");
						var type = str.substring(3,str.length).toLowerCase();
						str = "div#" + type + "Form";
						console.log( str );
						$(str).show();
					}
				});
				
				$("button[id^=\"cancel\"]").click(function() {
					if(user) {
						var str = $(this).attr("id");
						var type = str.substring(6,str.length).toLowerCase();
						var divId = "div#" + type + "Form";
						console.log("divId = " + divId);
						$(divId).hide();
						str = "div#add" + type.charAt(0).toUpperCase() + type.slice(1);
						console.log( str );
						$(str).show();
					}
				});
				
				$("span[id $= \"flagUser\"]").click(function() {
					var id = $(this).attr("id");
					var username =$(this).attr("username");
					$.ajax({
					   url : "flag",
					   method : "post",
					   data : { "id" : id, "username": username},
					   success : function(a) {
					      $("#"+ a.id).text("Flagged");
					      $("#"+ a.id).addClass('flagged');
					       $("#"+ a.id).removeClass(/*whatever the class was*/);
					   }
					});
				});
				
				$("span[id $= \"flagReview\"]").click(function() {
					//var str = $(this).attr("id");

					console.log("It's supposed to flag reviews...");
					var id = $(this).attr("id");
					var username =$(this).attr("username");
					var title = $(this).attr("title");
					var titleClass =$(this).attr("titleClass");
					$.ajax({
					   url : "flag",
					   method : "post",
					   data : { "id" : id,"username":username, "title":title, "titleClass":titleClass},
					   success : function(a) {
					      $("#"+ a.id).text("Flagged");
					      $("#"+ a.id).addClass('flagged');
					       $("#"+ a.id).removeClass(/*whatever the class was*/);
					   }
					});
				});
				
				$("img[id = \"recommend\"]").click(function() {
					setLoc("recommend?t=${w.title}&c=${w.classification}&isRec=1" );
				});
				
				$("img[id = \"unrecommend\"]").click(function() {
					setLoc("recommend?t=${w.title}&c=${w.classification}&isRec=0" );
				});
				
				$("form#genre").submit(function addGenre() {
					var genre = $("input#genre").val();
					console.log(genre);
					if( genre.length == 0 ) {
						alert('No input');
					} else {
						$.ajax({
							url : 'addGenre',
							method : 'POST',
							data : {'title': '${w.title}',
									'class' : '${w.classification}',
									'genre' : genre },
							success : function(a) {
								if( a.length == 0 ) {
									$('input#genre').val('');
									$('#genreForm').hide();
									$('#addGenre').show();
								} else {
									alert( a );
								}
							}
						});
					}
					
					return false;
				});
				
				$("form#key").submit(function addKey() {
					var key = $("input#key").val();
					console.log(key);
					if( key.length == 0 ) {
						alert('No input');
					} else {
						$.ajax({
							url : 'addKey',
							method : 'POST',
							data : {'title': '${w.title}',
									'class' : '${w.classification}',
									'keyword' : key },
							success : function(a) {
								if( a.length == 0 ) {
									$('input#key').val('');
									$('#keyForm').hide();
									$('#addKey').show();
								} else {
									alert( a );
								}
							}
						});
					}
					
					return false;
				});
				
				$('#fav').mousedown(function() {
					console.log( $('#favLabel').text());
					console.log( $("#favLabel").text() == 'Favorite' );
					$.ajax({
						url : "favorite",
						method : "POST",
						data : { 
							'title': '${w.title}',
							'class' : '${w.classification}',
							'init' : 'false',
							'fav' : ($("#favLabel").text() == 'Favorite')
						},
						success : function(a) {
							$("#favLabel").text( $("#favLabel").text() == 'Favorite' ? "Unfavorite" : "Favorite" );
							console.log( '${w.title} ' + ($("#favLabel").text() == 'Favorite' ? 'unfavorited' : 'favorited') );
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<c:choose>
				<c:when test="${not empty w}">
					<h1>${w.title} (${w.releaseYear} ${w.classification})</h1>
					<span class="rating">
						<c:forEach varStatus="i" begin="1" end="5">
							<c:choose>
								<c:when test="${ i.index <= w.rating }" >
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
					</span> <!-- end of rating --><br />
					<h4 id="ratingCtr">${rateCtr} ratings</h4>
					<c:if test="${user}">
						<div id="fav">
							<a href="#">
								<img src="Website Assets/FavStar.png">&nbsp;&nbsp;
								<c:choose>
									<c:when test="${w.favorited}">
										<span id="favLabel">Unfavorite</span>
									</c:when>
									<c:otherwise>
										<span id="favLabel">Favorite</span>
									</c:otherwise>
								</c:choose>
							</a>
						</div>
					</c:if><br /><br />
					<div id="screenshots">
						<c:choose>
							<c:when test="${empty w.cover}">
								<img src="Website Assets/Screenshots.png" />
							</c:when>
							<c:otherwise>
								<img src="${w.cover}"/>
							</c:otherwise>
						</c:choose>
					</div><br />
					<div class="workSection" id="workGenres" data-visible="false">
					<span>Genres</span>
					<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
						<div class="orangeLine"></div>
					</div> <!-- end of workGenres --> 
					<div class="content" id="workGenresCont">
						<br />
						<div id="addGenre">
							<c:choose>
								<c:when test="${user}">
									<img src="Website Assets/Plus Sign.png" id="addGenre" />&nbsp;Propose Genre
								</c:when>
								<c:otherwise>
									Log in to propose genres.
								</c:otherwise>
							</c:choose>	
						</div>
						<div class="addList">
							<c:forEach var="g" items="${w.genres}" varStatus="i">
								${g}
								<c:if test="${!i.last}">
									<span class="info">|</span>
								</c:if>
							</c:forEach>
						</div>
						<div id="genreForm">
							<form name="genre" class="workAdd" id="genre" method="post">
								<input type="text" name="g" id="genre" />
								<input type="submit" value="Propose Genre" class="orangeBox">
							</form>
							<button id="cancelGenre" class="orangeBox">Cancel</button>
						</div>
					</div> <!-- end of workGenresCont --><br />
					<div class="workSection" id="workKeys" data-visible="false">
						<span>Keywords</span>
						<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
						<div class="orangeLine"></div>
					</div> <!-- end of workKeys --> 
					<div class="content" id="workKeysCont">
						<br />
						<div id="addKey">
							<c:choose>
								<c:when test="${user}">
									<img src="Website Assets/Plus Sign.png" id="addKey" />&nbsp;Propose Keyword
								</c:when>
								<c:otherwise>
									Log in to propose keywords.
								</c:otherwise>	
							</c:choose>
						</div>
						<div class="addList">
							<c:forEach var="k" items="${w.keywords}" varStatus="i">
								${k}
								<c:if test="${!i.last}">
									<span class="info">|</span>
								</c:if>
							</c:forEach>
						</div>
						<div id="keyForm">
							<form name="key" class="workAdd" id="key" method="post">
								<input type="text" name="k" id="key" />
								<input type="submit" value="Propose Keyword" class="orangeBox">
							</form>
							<button id="cancelKey" class="orangeBox">Cancel</button>
						</div>
					</div> <!-- end of workKeysCont --> <br /> 
					<div class="workSection" id="workDesc" data-visible="false">
						<span>Description</span>
						<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
						<div class="orangeLine"></div>
					</div> <!-- end of workDesc --> <br />
					<div class="content" id="workDescCont">
						<p>${w.description}</p></br>
					</div> <!-- end of workDescCont -->
					<div class="workSection" id="workReview" data-visible="false">
						<span>Reviews</span>
						<div class="arrow"><img src="Website Assets/Down Arrow.png" /></div>
						<div class="orangeLine"></div>
					</div> <!-- end of workReview --> <br />
					<form action="review" id="reviewForm">
						<input type="hidden" value = "${w.classification}" name="titleclass" />
						<input type="hidden" value = "${w.title}" name="title" />
						<div class="content" id="workReviewCont">
						<c:choose>
							<c:when test="${user}">
								<br /><a href="review?t=${w.title}&c=${w.classification}" id="writeRev">Write a Review</a><br />
							</c:when>
							<c:otherwise>
								Log in to write a review.
							</c:otherwise>
						</c:choose>
						<c:forEach var="rev" items="${sessionScope.reviews}" >
							<div class="review">
								<span class="rating">
									<c:forEach varStatus="i" begin="1" end="5">
										<c:choose>
											<c:when test="${i.index <= rev.rating}">
												<img src="Website Assets/Filled Star.png" class="star" />
											</c:when>
											<c:otherwise>
												<img src="Website Assets/Empty Star.png" class="star" />
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</span> <!-- end of rating --> 
								<b>${rev.username}</b>
								<p>${rev.review }</p>
									<c:choose>
										<c:when test="${user && username != rev.username}">
											<div class=flagPanel align="right">
												<img src="Website Assets/red_flag.png"/>
												<span id="flagUser" username ="${rev.username}" data-title ="${w.title}" data-class ="${w.classification}">Person </span>|
												<span id="flagReview" username ="${rev.username}" data-title ="${w.title}" data-class ="${w.classification}">Review</span>
											</div>
										</c:when>
										<c:when test="${!user}">
											Login first to write reviews and flag content
										</c:when>
									</c:choose>
							</div> <!-- end of review -->
							<br />
						</c:forEach>
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
							<c:choose>
								<c:when test="${not empty sessionScope.username}">
									<img src="Website Assets/Plus Sign.png" id="recommend"/> Make a Recommendation
								</c:when>
								<c:otherwise>
									Login first to recommend a work
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${fn:length(sessionScope.recommendations) gt 0}">
									<br /><br />	
									<c:forEach var="rw" items="${sessionScope.recommendations}">
										<div class="workSmall" data-link="work?t=${rw.title}&c=${rw.classification}">
											<div class="recImg">
												<c:choose>
													<c:when test="${empty rw.cover}">
														<img src="Website Assets/blank.png" />
													</c:when>
													<c:otherwise>
														<img src="${rw.cover}" />
													</c:otherwise>
												</c:choose>
											</div>
											<span>${rw.title} (${rw.releaseYear} ${rw.classification})</span>
											<div class="rating">
												<c:forEach varStatus="i" begin="1" end="5">
													<c:choose>
														<c:when test="${i.index <= rw.rating}">
															<img src="Website Assets/Filled Star.png" class="star" />
														</c:when>
														<c:otherwise>
															<img src="Website Assets/Empty Star.png" class="star" />
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<br />
												<c:choose>
													<c:when test="${rw.rating == 0}">
														No Rating
													</c:when> 
													<c:otherwise>
														<fmt:formatNumber value="${rw.rating}" maxFractionDigits="1" minFractionDigits="1" />
													</c:otherwise>
												</c:choose>
											</div> <!-- end of rating -->
											<div class="description">
												<p>${rw.description}</p>
											</div> <!-- end of description -->
										</div> <!-- end of work -->
									</c:forEach>
								</c:when>
								<c:otherwise>
									<h4>No Recommendations</h4>
								</c:otherwise>
							</c:choose>
						</div> <!-- end of reco -->
						<div id="unreco">
							<h3>Unrecommended</h3>
							<c:choose>
								<c:when test="${not empty sessionScope.username}">
									<img src="Website Assets/Plus Sign.png" id="unrecommend"/> Make an Unrecommendation
								</c:when>
								<c:otherwise>
									Login first to unrecommend a work
								</c:otherwise>
							</c:choose><br />
							<c:choose>
								<c:when test="${fn:length(sessionScope.unrecommendations) gt 0}">
									<br /><br />	
									<c:forEach var="rw" items="${sessionScope.unrecommendations}">
										<div class="workSmall" data-link="work?t=${rw.title}&c=${rw.classification}">
											<div class="recImg">
												<c:choose>
													<c:when test="${empty rw.cover}">
														<img src="Website Assets/blank.png" />
													</c:when>
													<c:otherwise>
														<img src="${rw.cover}" />
													</c:otherwise>
												</c:choose>
											</div>
											<span>${rw.title} (${rw.releaseYear} ${rw.classification})</span>
											<div class="rating">
												<c:forEach varStatus="i" begin="1" end="5">
													<c:choose>
														<c:when test="${i.index <= rw.rating}">
															<img src="Website Assets/Filled Star.png" class="star" />
														</c:when>
														<c:otherwise>
															<img src="Website Assets/Empty Star.png" class="star" />
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<br />	
												<c:choose>
													<c:when test="${rw.rating == 0}">
														No Rating
													</c:when> 
													<c:otherwise>
														<fmt:formatNumber value="${rw.rating}" maxFractionDigits="1" minFractionDigits="1" />
													</c:otherwise>
												</c:choose>
											</div> <!-- end of rating -->
											<div class="description">
												<p>${rw.description}</p>
											</div> <!-- end of description -->
										</div> <!-- end of work -->
									</c:forEach>
								</c:when>
								<c:otherwise>
									<h4>No Unrecommendations</h4>
								</c:otherwise>
							</c:choose>
						</div> <!-- end of unrecommended -->
					</div> <!--  end of workRecCont -->
				</c:when>
				<c:otherwise>
					<h1>Work does not exist</h1>
				</c:otherwise>
			</c:choose>
		</div><!-- end of mainContent -->
	</body>
</html>