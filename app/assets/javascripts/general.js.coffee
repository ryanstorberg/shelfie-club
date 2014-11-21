$(document).ready ->
	$("#nav-toggler a").on "click", (e) ->
		e.preventDefault()
		$("#toggled").toggle()
		
	$(".portal-form a").on "click", (e) ->
		e.preventDefault()
		$("#user-menu-options").toggle()