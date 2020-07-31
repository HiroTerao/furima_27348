$(function(){  
  $('.price-input').on('keyup', function(){
    var data = $(this).val();
    var profit = Math.round(data * 0.9)
    var fee = (data - profit)
    $('#add-tax-price').html(fee)
    $('#add-tax-price').prepend('¥')
    $('#profit').html(profit)
    $('#profit').prepend('¥')
    if(profit == '') {
    $('#add-tax-price').html('');
    $('#profit').html('');
    }
  })
 })