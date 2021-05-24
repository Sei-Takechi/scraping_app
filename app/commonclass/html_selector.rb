class HtmlSelector
  attr_reader :xpaths_array
  attr_accessor :doc_obj
  def initialize(doc_obj, xpaths_array)
    @doc_obj = doc_obj
    @xpaths_array = xpaths_array
  end

  def html_elements
    xpaths_array.collect { |path| html_element(path) }
  end

  def html_element(xpath)
    doc_obj.xpath(xpath) 
  end

  def element_txt(xpath)
    doc_obj.xpath(xpath).text
  end

  def elements_txt
    xpaths_array.collect { |path| element_txt(path) }
  end

  def elements_txt_from_some_objects(doc_objs)
    doc_objs.collect { |obj| set_doc_obj(obj).elements_txt }
  end

  def set_doc_obj(doc_obj)
    self.doc_obj = doc_obj
    return self
  end

end