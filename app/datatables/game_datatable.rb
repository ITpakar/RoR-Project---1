class GameDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :h, :mailto, :game_path, :edit_game_path

  def sortable_columns
    @sortable_columns ||= ['Game.match_date', 'Game.name']
  end

  def searchable_columns
    @searchable_columns ||= ['Game.match_date', 'Game.name']
  end

  private

  def data
    records.map do |record|
	    ops = ''
      ops = link_to('<i class="fa fa-eye"> </i>'.html_safe, game_path(record))	        
	    # ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_game_path(record), remote: true) 
      # ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, game_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this game?' }) 
      [
		    record.match_date.strftime('%d/%m/%Y'), record.name, record.location.name, record.squad_1.country.name, record.squad_2.country.name, ops
      ]
    end
  end

  def get_raw_records
	 Game.includes(:squad_1, :squad_2, :location).references(:squad_1, :squad_2, :location).where(deleted: '0')
  end
  
end
