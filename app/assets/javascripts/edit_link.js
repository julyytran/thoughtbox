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
     $("#links-list #" + datum.id).replaceWith(createLinkHTML(datum));
   },
   error: function (xhr, status, errorThrown) {
     debugger
      $(function() {
        $('#flash').delay(300).fadeIn('normal', function() {
          $(this).delay(2500).fadeOut();
        });
      });
    }
  });
}
