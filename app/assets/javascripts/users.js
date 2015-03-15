var ready = function() {
	$("#signup-toggle").on("click", function(e) {
		e.preventDefault();
		$("#login-xs").hide();
		$("#signup-xs").show();
	})

	var colors = [
		"#64C08C",
		"#6CC392",
		"#74C698",
		"#7BC99D",
		"#83CDA3",
		"#8BD0A9",
		"#92D3AE",
		"#9AD6B4",
		"#A2D9BA",
		"#AADCC0",
		"#B2E0C6",
		"#B9E3CB",
		"#C1E6D1",
		"#C9E9D7",
		"#D0ECDC",
		"#D8EFE2",
		"#E0F2E8",
		"#E8F6EE",
		"#F0F9F4",
		"#F7FCF9",
		"#ffffff"
	]

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
