require_relative '../../app/commonclass/html_selector.rb'
require_relative '../../app/commonclass/html_parser.rb'
require 'rails_helper'

RSpec.describe "html_selector" do
  before do
    url = "https://blueshipjapan.com/search/event/catalog?area=0&text_date=&date=1&text_keyword=&cancelled=0&cancelled=1&order='desc"
    parser = HtmlParser.new(url)
    xpaths_array = [
      ".//h2[@class='event_title']/a",
      ".//p[@class='event_introduction']",
      ".//p[@class='event_location']",
      ".//p[@class='crew_name']",
    ]
    @selector = HtmlSelector.new(parser.doc_obj, xpaths_array)
  end

  describe "html_elementメソッド" do

    context "存在するhtml要素のxpathを渡されたとき" do

      it "オブジェクトを返すこと" do
        expect(@selector.html_elements).to_not be_empty
      end

    end
  end

end