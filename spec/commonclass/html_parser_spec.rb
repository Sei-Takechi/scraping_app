require_relative '../../app/commonclass/html_parser.rb'
require 'rails_helper'

RSpec.describe "html_parser" do
  before do
    url = "https://blueshipjapan.com/search/event/catalog?area=0&text_date=&date=1&text_keyword=&cancelled=0&cancelled=1&order='desc"
    @parser = HtmlParser.new(url)
  end

  context "正しいURLのとき" do
    it "ドキュメントのオブジェクトを返すこと" do
      expect(@parser.doc_obj).to_not be_empty
    end
  end
end