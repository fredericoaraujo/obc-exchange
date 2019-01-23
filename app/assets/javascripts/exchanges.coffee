$(document).ready ->

  $('#amount').keyup ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').text(data.value)
            $('#target_currency_selected').text($("#target_currency").val())
        return false;


  $('#change_currency').click ->
    source_currency = $("#source_currency option:selected").val()
    target_currency = $("#target_currency option:selected").val()
    $("#target_currency").val(source_currency)
    $("#source_currency").val(target_currency)
    $('#amount').val(0)

    return false;