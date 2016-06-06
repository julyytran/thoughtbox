function createLink() {
  $('#save').on('click', function() {
    $.ajax({
      type: "POST",
      url: "/api/v1/links",
      dataType: "json",
      data: {
        link: {
          title: $('#title').val(),
          url: $('#url').val()
        }
      },
      success: function(datum) {
        $('#links-list').prepend(createLinkHTML(datum));
        $('#title').val('');
        $('#url').val('');
      },
      error: function (xhr, status, errorThrown) {
        $(function() {
          $('#flash').delay(300).fadeIn('normal', function() {
            $(this).delay(2500).fadeOut();
          });
      });
    }
    });
  });
}
