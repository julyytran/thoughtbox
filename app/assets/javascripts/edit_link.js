function editTitle() {
  $('#links-list').on('click', '.title', function() {
    $(this).attr('contentEditable', 'true');
    $(this).on('blur keydown', function(event) {
      if (event.type === "blur" || event.keyCode === 13) {
        editContent(this, {title: $(this).text()});
      }
    });
  });
}

function editUrl() {
  $('#links-list').on('click', '.url', function() {
    $(this).attr('contentEditable', 'true');
    $(this).on('blur keydown', function(event) {
      if (event.type === "blur" || event.keyCode === 13) {
        editContent(this, {url: $(this).text()});
      }
    });
  });
}

function editContent (link, newContent) {
  $.ajax({
   type: "PATCH",
   url: "/api/v1/links/" + link.parentElement.id,
   data: {
     link: {
       title: newContent.title,
       url: newContent.url
     }
   },
   dataType: "json",
   success: function(datum) {
     if (datum.error) {
      $("#links-list #" + datum.link.id).replaceWith(createLinkHTML(datum.link));
      flashInvalidUrl();
    } else {
      $("#links-list #" + datum.id).replaceWith(createLinkHTML(datum));
    }
   }
  });
}

function flashInvalidUrl() {
  $(function() {
    $('#flash').delay(300).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
    });
  });
}
