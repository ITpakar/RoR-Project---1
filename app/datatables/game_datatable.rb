class GameDatatable < AjaxDatatablesRails::Base

  def_delegators :@view, :link_to, :h, :mailto, :game_path, :edit_game_path, :toggle_state_game_path, :lock_out_game_path

  def sortable_columns
    @sortable_columns ||= ['Game.match_date', 'Game.name', 'Location.name', 'Country.name', 'countries_squads.name']
  end

  def searchable_columns
    @searchable_columns ||= ['Game.match_date', 'Game.name']
  end

  def called_by
    @called_by ||= options[:called_by]
  end

  private

  def data
    records.map do |record|
	    ops = ''
      ops = link_to('<i class="fa fa-eye"> </i>'.html_safe, game_path(record))
      calledBy = called_by
      if calledBy.eql? :index
        if record.completed?
          ops = ops + " " + link_to('<i class="fa fa-plus"> </i>'.html_safe, toggle_state_game_path(record), method: :put, remote: true)
        else
          ops = ops + " " + link_to('<i class="fa fa-check"> </i>'.html_safe, toggle_state_game_path(record), method: :put, remote: true)
        end
      else
        unless record.locked_out?
          ops = ops + " " + link_to('<i class="fa fa-lock"> </i>'.html_safe, lock_out_game_path(record), method: :put, remote: true, data: { confirm: 'Are you sure you want to lock out this game?' })
        end
      end

	    # ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_game_path(record), remote: true) 
      # ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, game_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this game?' }) 
      [
		    record.match_date.strftime('%d/%m/%Y'), record.name, record.location.name, record.squad_1.country.name, record.squad_2.country.name, ops
      ]
    end
  end

  def get_raw_records
   calledBy = called_by
   if calledBy.eql? :index
     Game.includes(:squad_1 => :country).includes(:squad_2 => :country).includes(:location).where(deleted: '0')
   else
     Game.includes(:squad_1 => :country).includes(:squad_2 => :country).includes(:location).where(deleted: '0').where(state: '0')
   end

  end
  
end
