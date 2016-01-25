# Datatables
$ ->
  table = $('#umpires-table').dataTable
    dom: 'C<"clear">lfrtip'
    processing: true
    serverSide: true
    ajax: $('#umpires-table').data('source')    
    pagingType: 'full_numbers'
    columnDefs: [{ "orderable": false, "targets": 1 }]
