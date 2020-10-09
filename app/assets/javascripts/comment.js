$(function(){
  function buildHTML(comment){
    var HTML_comment = 
    `
    <div class="item-details__contents__comment-list__content">
      <div class="item-details__contents__comment-list__content__details">
        ${comment.user_name}
          <strpng>
            :
          </strong>
        ${comment.comment}
      </div>
    </div>
    `
    var HTML_delete =
    `
    <div class="item-details__contents__comment-list__content__destroy">
      <a rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.id}">
        <i class="fas fa-trash">
        </i>
      </a>
    </div>
    `
    if (comment.item_id.user){
      var html = HTML_comment + HTML_delete
    } else {
      var html = HTML_comment
    };
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    console.log
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.item-details__contents__comment-list').append(html)
      $('.textbox').val("");
      $('.item-details__contents__comment-box__form__submit').prop('disabled', false);
      $('.item-details__contents__comment-list__content__details').animate({ scrollTop: $('.item-details__contents__comment-list__content')[0].scrollHeight});
    })
  })
})