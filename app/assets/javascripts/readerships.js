$(document).ready(function() {
	$("#readership-toggle").on("ajax:success", function() {
		$(this).hide();
	});
});
