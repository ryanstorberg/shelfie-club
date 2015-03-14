$(document).on("change", function() {
	$("#post-form").on("ajax:success", function() {
		$("#post-form textarea").val("");
	});
});

$(document).on("click", ".post-reply-action", function(e) {
	e.preventDefault();
	$(".new-reply-form").hide();
	$(this).closest(".media-body").children(".new-reply-form").show();
});
