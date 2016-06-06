function editLink() {
  $('#links-list').on('click', '#edit', function() {
    id = this.parentElement.id;
    link = '#links-list #' + id;
    title = link + ' .title';
    url = link + ' .url';
    $(title).attr('contentEditable', 'true');
    $(url).attr('contentEditable', 'true');
    $(link).on('blur keydown', function(event) {
      if (event.keyCode === 13) {
        editContent(this, {title: $(title).text(), url: $(url).text()});
      }
    });
  });
}

function editContent (link, newContent) {
  $.ajax({
   type: "PATCH",
   url: "/api/v1/links/" + link.id,
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
