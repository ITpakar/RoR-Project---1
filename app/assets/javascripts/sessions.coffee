# Datatables
$ ->
  table = $('#sessions-table').dataTable
    dom: 'C<"clear">lfrtip'
    processing: true
    serverSide: true
    ajax: $('#sessions-table').data('source')    
    pagingType: 'full_numbers'
    columnDefs: [{ "orderable": false, "targets": 1 }]
