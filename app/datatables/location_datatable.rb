class LocationDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :h, :mailto, :location_path, :edit_location_path
  
  
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Location.name', 'Location.city', 'Country.name']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Location.name', 'Location.city', 'Country.name']
  end

  private

  def data
    records.map do |record|
	
	  ops = ''    	        
	  ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_location_path(record), remote: true) 
    ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, location_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this location?' }) 

      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,		
		    record.name, record.city, record.country.name, ops
      ]
    end
  end

  def get_raw_records
    # insert query here
	Location.includes(:country).references(:country).where(deleted: '0')
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
