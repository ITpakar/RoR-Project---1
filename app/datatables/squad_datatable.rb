class SquadDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :mailto, :squad_path, :edit_squad_path
  
  def sortable_columns
    @sortable_columns ||= ['Code.name', 'Country.Name']
  end

  def searchable_columns
    @searchable_columns ||= ['Code.name', 'Country.Name']
  end

  private
  def data
    records.map do |record|
      ops = ''
      ops = link_to('<i class="fa fa-eye"> </i>'.html_safe, squad_path(record))	        
      ops = ops + " " + link_to('<i class="fa fa-pencil"> </i>'.html_safe, edit_squad_path(record), remote: true) 
      ops = ops + " " + link_to('<i class="fa fa-times-circle"> </i>'.html_safe, squad_path(record), method: :delete, remote: true, data: { confirm: 'Are you sure you want to delete this squad?' }) 
      [	
        record.try(:country).try(:name),record.try(:code).try(:name),record.description,ops
      ]
    end
  end

  def get_raw_records
    Squad.includes(:country, :code).references(:country, :code).where(deleted: '0')
  end

end
