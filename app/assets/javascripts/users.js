var ready = function() {
	$("#signup-toggle").on("click", function(e) {
		e.preventDefault();
		$("#login-xs").hide();
		$("#signup-xs").show();
	})

  $(".progress-bar").each(function(i) {
		$(this).css("background-color", colors[i]);
	})

	$(".progress-bar").last().css("border-right", "none");

	$('#myModal').on('shown.bs.modal', function () {
    $('#search-books-input').focus();

    $("#books-adder").on("click", function() {
			$("#search-results").html('');
			$("#search-books-input").val('');
		})

		$(document).on("ajax:success", ".new_read_book", function(e) {
			e.preventDefault();

			$("#alert-add-books").hide();

			$(".progress-bar").each(function(i) {
				$(this).css("background-color", colors[i]);
			})

			$(".progress-bar").last().css("border-right", "none");

			$(this).hide();
		});
	})
};

$(document).ready(ready);
$(document).on('page:load', ready);
