function setLoc(a) {
	location = a;
}

function switchClass(a, b, c) {
	a.addClass(b);
	a.removeClass(c);
}

function setFilterCrit( a, b ){
	switchClass( a, b == true ? 'filterCritActive' : 'filterCritInactive',
				b == false ? 'filterCritActive' : 'filterCritInactive')
}