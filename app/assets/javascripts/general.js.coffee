$(document).ready ->
	$("#nav-toggler").on "click", (e) ->
		e.preventDefault()
		$("#toggled").toggle()

$(document).ready ->
	$("#search-form").submit ->
  	$.get($("#search-form").attr("action"), $("#search-form").serialize(), null, "script")
  	return false;

  $("#search-books-button").click ->
  	$.get($("#search-form").attr("action"), $("#search-form").serialize(), null, "script")
  	return false;

  $("#toggle-info").on "focus", ->
  	$("#form-info").show()

  $("#toggle-info").on "focusout", ->
  	$("#form-info").hide()
  	