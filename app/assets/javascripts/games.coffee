$ ->
  table = $("#games-table").dataTable(
    dom: "C<\"clear\">lfrtip"
    processing: true
    serverSide: true
    ajax: $("#games-table").data("source")
    pagingType: "full_numbers"
    columnDefs: [
      orderable: false
      targets: 1
     ]
  )
  $(document).on "click", "#umpire_1_id", ->
    select2()    

