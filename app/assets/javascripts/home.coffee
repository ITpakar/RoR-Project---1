# Datatables
$ ->
  table = $('#homes-table').dataTable
    dom: 'C<"clear">lfrtip'
    processing: true
    serverSide: true
    ajax: $('#homes-table').data('source')    
    pagingType: 'full_numbers'
    columnDefs: [{ "orderable": false, "targets": 1 }]
