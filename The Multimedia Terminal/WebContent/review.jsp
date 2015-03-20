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
					setLoc("index.html");
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
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.html" />
		<div id="mainContent">
			<h1>Write a Review</h1>
			<div class="orangeLine"></div>
			<h1><%=request.getParameter("title")%></h1>
			<div id="reviewSpace">
				<form action="index.html" id="reviewForm">
					<span id="reviewTitle">Title:&nbsp;</span>
					<input type="text" id="reviewTitle" class="formField reviewField" name="t" /><br />
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
					<textarea name="reviewContent" class="reviewField" name="rev"></textarea>
					<div id="formButtons">
						<input type="submit" class="orangeBox" />
						<button class="orangeBox">Cancel</button>
					</div>
				</form>
			</div>
		</div><!-- end of mainContent -->
	</body>
</html>