$(document).on('turbolinks:load', function () {
  $('#hiring-time').on("change", function() {
    var total = parseInt($('#vehicle-price').html())*parseInt($('#hiring-time').val());
    $('#total').html(total)
  });

  $('#btn-submit').on("click", function() {
    $(this).prop('disabled', true);
  });
  
  $('#vehicles-table').dataTable( {
    language: {
      search: I18n.t("admin.vehicles.index.input"),
      searchPlaceholder: I18n.t("admin.vehicles.index.search")
    }
  });

  $('.page').on('click', function() {
    $('.page.active').attr('class', 'page');
    $(this).closest('li').attr('class', 'page active');
  });
})
