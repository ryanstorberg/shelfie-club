$(document).ready ->
	$(".new_read_book").on("ajax:success", (e, data, status, xhr) ->
		$(this).parent().hide())
	