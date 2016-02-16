# Datatables
$ ->
  table = $('#manage-games-table').dataTable
    dom: 'C<"clear">lfrtip'
    processing: true
    serverSide: true
    ajax: $('#manage-games-table').data('source')    
    pagingType: 'full_numbers'
    columnDefs: [{ "orderable": false, "targets": 1 }]
