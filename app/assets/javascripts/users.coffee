# Datatables
$ ->
  table = $('#manage-users-table').dataTable
    dom: 'C<"clear">lfrtip'
    processing: true
    serverSide: true
    ajax: $('#manage-users-table').data('source')
    pagingType: 'full_numbers'
    columnDefs: [{ "orderable": false, "targets": 5 }]
