function changeReadStatus () {
  $('#links-list').on('click', '#read', function() {
    var readStatus = $(this.parentElement.children[2]).text();
    status = determineReadStatus(readStatus);
    linkID = this.parentElement.id;
    updateStatus(linkID, status);
  });
}

function determineReadStatus (readStatus) {
  if (readStatus === "false") {
    return "true";
  } else if (readStatus === "true") {
    return "false";
  }
}

function updateStatus(linkID, status){
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkID,
    data: {
      link: {
        read: status
      }
    },
    dataType: "json",
    success: function(datum) {
      $("#links-list #" + datum.id).replaceWith(createLinkHTML(datum));
    }
  });
}
