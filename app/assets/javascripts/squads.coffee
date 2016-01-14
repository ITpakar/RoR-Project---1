$ ->
  table = $('#squads-table').dataTable
    dom: 'C<"clear">lfrtip'
    processing: true
    serverSide: true
    ajax: $('#squads-table').data('source')    
    pagingType: 'full_numbers'
    columnDefs: [{ "orderable": false, "targets": 1 }]
  $('#global-modal').on 'shown.bs.modal', ->
    $('#display-selected-table tbody').sortable()   
    $('#display_template_add').on 'click', ->
      v = $('#squad_available_players').val()
      t = $('#squad_available_players :selected').text()
      if $('#display-selected-table tbody .rows').length == 0
        $('#display-selected-table tbody').empty()
      if v == null
        alert "Player List Empty"
      else  
        $('#display-selected-table tbody').append '<tr id="' + v + '" class="rows"><td>' + t + '</td><td><i rel="' + v + '" class="del-btn fa fa-times-circle">&nbsp;</i></td></tr>'
        $('#squad_available_players option[value=\'' + v + '\']').remove()
      return
     $('#display-selected-table tbody tr td .del-btn').on 'click', ->
      key = $(this).attr 'rel'   
      id = $(this).parent().parent().attr 'id'
      value= $(this).parent().parent().text().trim()
      $('#squad_available_players').append('<option value="' + key + '">' + value + '</option>')
      $(this).parent().parent().remove()
      return
    return