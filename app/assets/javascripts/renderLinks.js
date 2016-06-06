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
  + "<button type='button' name='button' class='btn btn-info unread' id='read'>Mark as read!</button>"
  + "<button type='button' name='button' class='btn btn-danger' id='delete'>Delete!</button>"
  + "</li>"
}
