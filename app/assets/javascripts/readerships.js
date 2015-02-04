$(document).on("ajax:success", ".new_read_book", function(e) {
	e.preventDefault();
	$(this).hide();
});

$(document).ready(function() {
	$("#readership-toggle").on("ajax:success", function() {
		$(this).hide();
	});
});
