class ModelDataFormatter
  attr_reader :selector, :model_data_xpath
  def initialize(selector, model_data_xpath)
    @selector = selector
    @model_data_xpath = model_data_xpath
  end

  def model_data_objs
    selector.html_element(model_data_xpath)
  end

  def model_data_array
    selector.elements_txt_from_some_objects(self.model_data_objs)
  end

end