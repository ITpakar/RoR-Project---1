class <%= singular_table_name.camelize %>Datatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :h, :mailto, :<%= singular_table_name.downcase %>_path, :edit_<%= singular_table_name.downcase %>_path
  <%
    headers = []
    attributes.reject{ |a| a.name == "deleted" }.reject(&:password_digest?).each do |attribute| 
      headers.push("'#{singular_table_name.camelize}.#{attribute.human_name.downcase}'")
    end
  
    cols = []
    attributes.reject{ |a| a.name == "deleted"}.reject(&:password_digest?).each do |attribute| 
      cols.push("record.#{attribute.name.underscore}")
    end   
  %>
  
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= [<%= headers.join(', ') %>]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= [<%= headers.join(', ') %>]
  end

  private

  def data
    records.map do |record|
	
	  ops = ''
    ops = link_to('<i class="fa fa-eye"> </i>'.html_safe, <%= singular_table_name.downcase %>_path(record))	        
	  ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_<%= singular_table_name.downcase %>_path(record), remote: true) 
    ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, <%= singular_table_name.downcase %>_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this <%= singular_table_name.downcase %>?' }) 

      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,		
		    <%= cols.join(', ') %>, ops
      ]
    end
  end

  def get_raw_records
    # insert query here
	<%= singular_table_name.camelize %>.where(deleted: '0')
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
