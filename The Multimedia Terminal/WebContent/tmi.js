function setLoc(a) {
	location = a;
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