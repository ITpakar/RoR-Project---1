module SeriesHelper
  def get_selected_countries series
    if series.countries
      countries = series.countries.pluck(:id)
    end
  end
end
