function renderLinks() {
  $.getJSON("/api/v1/links", function (data) {
    appendLinks(data);
  });
}

function appendLinks(data) {
  for (var i = 0; i < data.length; i++) {
    $('#links-list').append(createIdeaHTML(data[i]));
  }
}

function createIdeaHTML (datum) {
  return "<li id='"
  + datum.id + "' >"
  + "<h4 class='title'>" + datum.title + "</h4>"
  + "<p class='url'>"
  + datum.url
  + "</br></p>"
  + "<p class=read>" + datum.read + "</p>"
  + readButton(datum)
  + "<button type='button' name='button' class='btn btn-danger' id='delete'>Delete!</button>"
  + "</li>"
}

function readButton(datum) {
  if (datum.read === "false") {
    return "<button type='button' name='button' class='btn btn-info unread' id='read'>Mark as read!</button>"
  } else if (datum.read === "true") {
    return "<button type='button' name='button' class='btn btn-warning read' id='read'>Mark as unread!</button>"
  }
}
