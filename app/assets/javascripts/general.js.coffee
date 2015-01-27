$(document).ready ->
	$("#nav-toggler").on "click", (e) ->
		e.preventDefault()
		$("#toggled").toggle()

$(document).ready ->
	$("#search-form input").keyup ->
    	$.get($("#search-form").attr("action"), $("#search-form").serialize(), null, "script")
    	return false;