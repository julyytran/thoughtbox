function searchLinks() {
  $('#search-box').on('keyup', function() {
    query = $('#search-box').val();
    if (query === "") {
      $('#links-list').empty();
      renderLinks();
    } else {
      $.getJSON('/api/v1/links', function(data) {
        $.each(data, function(key, link) {
          searchFilter(link);
        });
      });
    }
  });
}

function searchFilter(link) {
  if (!link.url.toLowerCase().includes(query.toLowerCase()) && !link.title.toLowerCase().includes(query.toLowerCase())) {
    document.getElementById(link.id).style.display = "none";
  } else {
    document.getElementById(link.id).style.display = "normal";
  }
}
