class Scraping
  attr_reader :pager, :formatter
  def initialize(pager, formatter)
    @pager = pager
    @formatter = formatter
  end

  def scraping
    formatter.model_data_array
  end

  def repeat_scraping
    model_data_array = self.scraping
    until pager.is_end? do
      pager.go_next_page
      model_data_array.concat(self.scraping)
    end
    return model_data_array
  end

end