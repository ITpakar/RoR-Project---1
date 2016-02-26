# Datatables
$ ->
  table = $('#locations-table').dataTable
    dom: 'C<"clear">lfrtip'
    processing: true
    serverSide: true
    ajax: $('#locations-table').data('source')    
    pagingType: 'full_numbers'
    columnDefs: [{ "orderable": false, "targets": 3 }]
