class TeamDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :h, :mailto, :team_path, :edit_team_path
  
  
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Team.game']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Team.game']
  end

  private

  def data
    records.map do |record|
	
	  ops = ''
    ops = link_to('<i class="fa fa-eye"> </i>'.html_safe, team_path(record))	        
	  ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_team_path(record), remote: true) 
    ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, team_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this team?' }) 

      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,		
		    record.game, ops
      ]
    end
  end

  def get_raw_records
    # insert query here
	Team.where(deleted: '0')
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
