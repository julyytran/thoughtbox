function filterByUnread () {
  $('#filter-read').on('click', function() {
    $.getJSON('/api/v1/links', function(data) {
      $.each(data, function(key, link) {
        unreadFilter(link);
      });
    });
  });
}

function unreadFilter(link) {
  if (link.read === "false") {
    document.getElementById(link.id).style.display = "none";
  } else {
    document.getElementById(link.id).style.display = "normal";
  }
}

function filterByRead () {
  $('#filter-unread').on('click', function() {
    $.getJSON("/api/v1/links", function (data) {
      for (var i = 0; i < data.length; i++) {
        if (data[i].read === "true") {
          document.getElementById(data[i].id).style.display = "none";
        } else {
          document.getElementById(data[i].id).style.display = "normal";
        }
      }
    });
  });
}
