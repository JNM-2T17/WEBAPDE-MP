<!DOCTYPE html>
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
				
				var ratingSet = false;
				
				$("img[id^=\"star\"]").mouseover(function() {
					if( !ratingSet ) {
						var n = $(this).attr("id").substring(4,5);
						var i;
						for( i = 1; i <= n; i++ ) {
							$("img#star" + i).attr("src","Website Assets/Filled Star.png");
						}
						for( ; i <= 5; i++ ) {
							$("img#star" + i).attr("src","Website Assets/Empty Star.png");
						}
					}
				});
				
				$("img[id^=\"star\"]").mouseover(function() {
					if( !ratingSet ) {
						var n = $(this).attr("id").substring(4,5);
						var i;
						for( i = 1; i <= n; i++ ) {
							$("img#star" + i).attr("src","Website Assets/Filled Star.png");
						}
						for( ; i <= 5; i++ ) {
							$("img#star" + i).attr("src","Website Assets/Empty Star.png");
						}
					}
				});
				
				$("span#reviewRating").mouseout(function() {
					if( !ratingSet ) {
						for( var i = 1; i <= 5; i++ ) {
							$("img#star" + i).attr("src","Website Assets/Empty Star.png");
						}
					}
				});
				
				$("img[id^=\"star\"]").click(function() {
					var n = $(this).attr("id").substring(4,5);
					var i;
					for( i = 1; i <= n; i++ ) {
						$("img#star" + i).attr("src","Website Assets/Filled Star.png");
					}
					for( ; i <= 5; i++ ) {
						$("img#star" + i).attr("src","Website Assets/Empty Star.png");
					}
					$("input#ratingVal").val("" + n);
					ratingSet = true;
				});
				
				$("#reviewForm").submit(function() {
					$.ajax({
						'url' : 'review',
						'method' : 'POST',
						'data' : {
							'title' : '${t}',
							'titleclass' : '${c}',
							'reviewContent' : $("textarea.reviewField").val(),
							'r' : $("input#ratingVal").val()
						},
						'success' : function(a) {
							setLoc(a);
						}
					});
					return false;
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<h1>Write a Review</h1>
			<div class="orangeLine"></div>
			<h1>${t} (${c})</h1>
			<div id="reviewSpace">
				<form action="review" id="reviewForm" method = "post">
					<div id="reviewRating">
						<p>Select Rating:&nbsp;</p>
						<span id="reviewRating">
							<img id="star1" src="Website Assets/Empty Star.png" />
							<img id="star2" src="Website Assets/Empty Star.png" />
							<img id="star3" src="Website Assets/Empty Star.png" />
							<img id="star4" src="Website Assets/Empty Star.png" />
							<img id="star5" src="Website Assets/Empty Star.png" />
						</span>
					</div>
					<input type="hidden" id="ratingVal" name="r" />
					<input type="hidden" value = "${t}" name="title" />
					<input type="hidden" value = "${c}" name="titleclass" />
					<textarea name="reviewContent" class="reviewField" name="rev"></textarea>
					<div id="formButtons">
						<input type="submit" class="orangeBox" />
						<form action = "review.jsp">
						<button class="orangeBox">Cancel</button>
						</form>
					</div>
				</form>
			</div>
		</div><!-- end of mainContent -->
	</body>
</html>