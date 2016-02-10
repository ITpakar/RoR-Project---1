class PlayerDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :mailto, :player_path, :edit_player_path, :can?, :profile_player_path

  def sortable_columns
    @sortable_columns ||= ['Player.name', 'Country.name', 'Player.batting_style', 'Player.bowling_style', 'Player.role']
  end

  def searchable_columns
    @searchable_columns ||= ['Player.name', 'Country.name', 'Player.batting_style', 'Player.bowling_style', 'Player.role']
  end

  private
  def data
    records.map do |record|
      ops = ''
      ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_player_path(record), remote: true) if can? :edit, Player
      ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, player_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this player?' }) if can? :destroy, Player
      [		
        "#{link_to record.name, profile_player_path(record)}", record.try(:country).name, record.batting_style.to_s.titleize, record.bowling_style, record.role.to_s.titleize, record.dob.to_date.try{strftime('%d/%m/%Y')}, ops
      ]
    end
  end

  def get_raw_records
    Player.includes(:country).references(:country).where(deleted: '0')
  end

end
