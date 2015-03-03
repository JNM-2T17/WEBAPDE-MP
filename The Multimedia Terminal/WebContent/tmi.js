function setLoc(a) {
	location = a;
}

function randomizeLogo() {
	$("img#logo").attr("src","Website Assets/logo" + Math.floor(Math.random() * 11 + 1) + ".png");
	$("img#logo").click(function() {
		setLoc("index.html")
	});
}

function switchClass(a, b, c) {
	a.addClass(b);
	a.removeClass(c);
}

function toggleRec( a, b ) {
	switchClass( a, b == true ? 'recoWork' : 'addWork',
				b == false ? 'recoWork' : 'addWork');
	console.log( a.attr('class'));
	return a;
}

function setFilterCrit( a, b ) {
	switchClass( a, b == true ? 'filterCritActive' : 'filterCritInactive',
				b == false ? 'filterCritActive' : 'filterCritInactive');
	return a;
}