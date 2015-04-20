$(document).on('ready', function() {
  var timeout = null;
  var searchValue = null;

  $('#universal-search input').on('keyup', function() {
    if(this.value != searchValue) {
      $('#searchbar-dropdown').show();
    }
    if(this.value.length == 0) {
      $('#searchbar-dropdown').hide();
    }
    searchValue = this.value;
    clearTimeout(timeout);
    timeout = setTimeout(function() {
      $.get(
        $("#universal-search").attr("action"),
        $("#universal-search").serialize(),
        function(data) {
          if($('#books-tab').hasClass('active')) {
            $('#small-book-results').show();
            $('#small-user-results').hide();
          } else {
            $('#small-book-results').hide();
            $('#small-user-results').show();
          }
        },
        "script");
    }, 500);
  })

  $('#books-tab').on('click', function() {
  	$(this).addClass('active');
  	$('#people-tab').removeClass('active');
  	$('#small-book-results').show();
  	$('#small-user-results').hide();
  })

  $('#people-tab').on('click', function() {
  	$(this).addClass('active');
  	$('#books-tab').removeClass('active');
  	$('#small-book-results').hide();
  	$('#small-user-results').show();
  })

  $('#universal-search input').on('focus', function() {
    if(this.value.length > 0) {
      $('#searchbar-dropdown').show();
    }
  })

  $('html').on('click', function(e) {
    if($(e.target).closest('#universal-search-container').length === 0) {
      $('#searchbar-dropdown').hide();
    }
  })
})
