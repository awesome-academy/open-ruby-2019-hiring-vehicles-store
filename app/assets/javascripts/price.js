$(document).on('turbolinks:load', function () {
  $('#hiring-time').on("change", function() {
    var total = parseInt($('#vehicle-price').html())*parseInt($('#hiring-time').val());
    $('#total').html(total)
  });

  $('#btn-submit').on("click", function() {
    $(this).prop('disabled', true);
  });
})
