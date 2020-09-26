document.addEventListener('turbolinks:load', function () {
// $(function(){
  $('#item_price').on('input', function(){
    var data = $('#item_price').val(); 
    var profit = Math.round(data * 0.9) 
    var fee = (data - profit) 
    $('.contents_body_shipping_price_fee_right_bar').html(fee) 
    $('.contents_body_shipping_price_fee_right_bar').prepend('¥') 
    $('.contents_body_shipping_profit_right_bar2').html(profit)
    $('.contents_body_shipping_profit_right_bar2').prepend('¥')
    $('#price').val(profit) 
    if(profit == '') {
    $('.contents_body_shipping_profit_right_bar2').html('');
    $('.contents_body_shipping_price_fee_right_bar').html('');
    }
  })
})