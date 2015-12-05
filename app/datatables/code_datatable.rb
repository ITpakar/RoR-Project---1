class CodeDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :h, :mailto, :code_path, :edit_code_path
  
  
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Code.name']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Code.name']
  end

  private

  def data
    records.map do |record|
	
	  ops = ''
	  ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_code_path(record), remote: true) 
    ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, code_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this code?' }) 

      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,		
		    record.name, ops
      ]
    end
  end

  def get_raw_records
    # insert query here
	Code.where(deleted: '0')
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
