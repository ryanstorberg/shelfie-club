$(document).ready ->
	$("#nav-toggler").on "click", (e) ->
		e.preventDefault()
		$("#toggled").toggle()