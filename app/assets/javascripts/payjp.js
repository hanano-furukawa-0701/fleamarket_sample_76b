
$(function(){
  if ($('#token_submit') != null){
    Payjp.setPublicKey('pk_test_360fd4bb979cfcc120875ec4');
    $('#token_submit').on('click',function(e){
      e.preventDefault();
      var card = {
        number: $('#card_number').val(),
        exp_month: $('#expiration_month').val(),
        exp_year: $('#expiration_year').val(),
        cvc: $('#security_cord').val()
      };

      Payjp.createToken(card, function(status, response){
        if (status === 200){
          $('#card_number').removeAttr('name');
          $('#expiration_month').removeAttr('name');
          $('#expiration_year').removeAttr('name');
          $('#security_cord').removeAttr('name');
          $('#card-new__form__add').append(
            $(`<input type="hidden" name="payjp-token">`).val(response.id)
          );
          document.inputForm.submit();
          alert("登録が完了しました");
        } else {
          alert("カード情報が正しくありません。");
        }
      });
    });
  }
  false
});