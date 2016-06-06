function filterByUnread () {
  $('#filter-read').on('click', function() {
    $.getJSON("/api/v1/links", function (data) {
      for (var i = 0; i < data.length; i++) {
        if (data[i].read === "false") {
          document.getElementById(data[i].id).style.display = "none";
        } else {
          document.getElementById(data[i].id).style.display = "normal";
        }
      }
    });
  });
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
