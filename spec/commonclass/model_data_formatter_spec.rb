require_relative '../../app/commonclass/model_data_formatter.rb'
require_relative '../../app/commonclass/html_selector.rb'
require_relative '../../app/commonclass/html_parser.rb'
require 'rails_helpers'

RSpec.describe "model_data_formatter" do

  context "正しいデータのとき" do
    before do
      url = "https://blueshipjapan.com/search/event/catalog?area=0&text_date=&date=1&text_keyword=&cancelled=0&cancelled=1&order='desc"
      xpaths_array = [
        ".//h2[@class='event_title']/a",
        ".//p[@class='event_introduction']",
        ".//p[@class='event_location']",
        ".//p[@class='crew_name']",
      ]
      model_data_xpath = "//div[@class='search_data']/ul/li[@class='event_item gallery_item']"
      parser = HtmlParser.new(url)
      selector = HtmlSelector.new(parser.doc_obj, xpaths_array)
      @formatter = ModelDataFormatter.new(selector, model_data_xpath)
    end

    it "モデルデータを配列で返すこと" do
      expect(@formatter.model_data_array).
    end
  end

end