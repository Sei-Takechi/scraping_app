class Pager
  attr_reader :base_url, :selector, :parser, :page_num_xpath, :page_tag_xpath
  def initialize(base_url, selector, parser, page_num_xpath, page_tag_xpath)
    @base_url = base_url
    @selector = selector
    @parser = parser
    @page_num_xpath = page_num_xpath
    @page_tag_xpath = page_tag_xpath
  end

  def doc_obj
    parser.doc_obj
  end

  def parse_next_doc_obj
    parser.set_url(self.next_page_url)
  end

  def set_next_doc_obj
    self.parse_next_doc_obj
    selector.set_doc_obj(self.doc_obj)
  end

  def next_page_url
    next_page_url = "#{base_url}#{self.href}"
  end

  def href
    self.next_page_obj.attribute('href')
  end

  def next_page_obj
    selector.set_doc_obj(self.doc_obj)
    page_tags = selector.html_element(page_tag_xpath)
    page_tags.select { |tag| tag.text.to_i == next_page_num }.first
  end

  def next_page_num
    selector.element_txt(page_num_xpath).to_i + 1
  end

  def go_next_page
      sleep 1
      self.set_next_doc_obj
  end

  def is_end?
    self.next_page_obj.nil?
  end

end