class PlayerDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :h, :mailto, :player_path, :edit_player_path
  
  
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Player.name', 'Country.name', 'Player.batting_style', 'Player.bowling_style', 'Player.role']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Player.name', 'Country.name', 'Player.batting_style', 'Player.bowling_style', 'Player.role']
  end

  private

  def data
    records.map do |record|
	
	  ops = ''    	        
	  ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_player_path(record), remote: true) 
    ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, player_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this player?' }) 

      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,		
		    record.name, record.country.name, record.batting_style.titleize, record.bowling_style, record.role.titleize, ops
      ]
    end
  end

  def get_raw_records
    # insert query here
	Player.includes(:country).references(:country).where(deleted: '0')
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
