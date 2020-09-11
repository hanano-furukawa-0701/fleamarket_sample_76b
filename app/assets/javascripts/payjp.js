$(function(){
  if ($('#token_submit') != null){
    Payjp.setPublicKey('pk_test_360fd4bb979cfcc120875ec4');
    $('#token_submit').on('click',function(e){
      e.preventDefault();
      var card = {
        card_number: $('#card_number').val();
        expiration_month: $('#expiration_month').val();
        expiration_year: $('#expiration_year').val();
        security_cord: $('#security_cord').val();
      };

      Payjp.createToken(card, function(status, response){
        if (status === 200){
          $('#card_number').removeAttr('name');
          $('#expiration_month').removeAttr('name');
          $('#expiration_year').removeAttr('name');
          $('#security_cord').removeAttr('name');
          var  token = response.id;
          $('#credit-card__form__add').append(
            $(`<input type="hidden" name="payjp-token" value=${token}>`)
          );
          $('inputForm').get(0).submit();
          arert("登録が完了しました");
        } else {
          alert("カード情報が正しくありません。");
        }
      });
    });
  },
  false
});