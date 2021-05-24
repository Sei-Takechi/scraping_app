class HtmlParser
  attr_accessor :url
  def initialize(url)
    @url = url
    require 'open-uri'
    require 'nokogiri'
  end

  def load_charset
    URI.open(url) do |f|
      charset = f.charset
    end
  end

  def load_html
    html = URI.open(url) do |f|
      f.read
    end
  end

  def doc_obj
    Nokogiri::HTML.parse(load_html, nil, load_charset)
  end

  def set_url(url)
    self.url = url
    return self
  end

end

