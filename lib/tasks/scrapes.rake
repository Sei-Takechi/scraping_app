namespace :scrapes do
  desc "スクレイピングをするタスク"
  task scrapes: :environment do
    require './app/commonclass/scraping.rb'
    require './app/commonclass/html_parser.rb'
    require './app/commonclass/html_selector.rb'
    require './app/commonclass/pager.rb'
    require './app/commonclass/job_offer_saving_service.rb'

    # 1つ目のサイト
    parser = HtmlParser.new("https://blueshipjapan.com/search/event/catalog?area=0&text_date=&date=1&text_keyword=&cancelled=0&cancelled=1&order='desc")
    job_offer_columns_xpath = [
      ".//h2[@class='event_title']/a",
      ".//p[@class='event_introduction']",
      ".//p[@class='event_location']",
      ".//p[@class='crew_name']",
    ]
    job_offers_xpath = "//div[@class='search_data']/ul/li[@class='event_item gallery_item']"
    selector = HtmlSelector.new(parser.doc_obj, job_offer_columns_xpath)
    formatter = ModelDataFormatter.new(selector, job_offers_xpath)
    pager = Pager.new(
      "https://blueshipjapan.com/",
      selector,
      parser,
      ".//div[@class='pager']/span",
      ".//div[@class='pager']/a",
    )
    scraping = Scraping.new(pager, formatter)
    job_offer_columns_array = scraping.repeat_scraping
    JobOfferSavingService.new(job_offer_columns_array).save_with_company_association

    # # # 2つ目のサイト
    # parser = HtmlParser.new(
    #   "https://moshicom.com/search/?s=3&amp;keyword=&amp;event_start_date=&amp;event_end_date=&amp;entry_status=yes&amp;except_eventup=no&amp;scale=0&amp;disciplines%5B%5D=11&amp;day_entry=no&amp;measurement=no&amp;user_id=0&amp;search_type=0&amp;recommend_event=true&amp;recommend_course=true&amp;recommend_facility=true&amp;mode=1&amp;l=20&amp;o=0&amp;m=1"
    # )
    # job_offer_columns_xpath = [
    #   ".//h3[@class='card-title']/a",
    #   ".//p[@class='vue-line-clamp']",
    #   ".//p[@class='card-text icn icon-pin']",
    #   ".//h4[@class='user']/a",
    # ]
    # job_offers_xpath = ".//div[@class='card card-main']"
    # selector = HtmlSelector.new(parser.doc_obj, job_offer_columns_xpath)
    # formatter = ModelDataFormatter.new(selector, job_offers_xpath)
    # pager = Pager.new(
    #   "https://moshicom.com/",
    #   selector,
    #   parser,
    #   ".//li[@class='page-item active']/a",
    #   ".//li[@class='page-item']/a",
    # )
    # # p pager.page_tag_xpath
    # # p pager.next_page_url
    # # p pager.is_end?
    # scraping = Scraping.new(pager, formatter)
    # # job_offer_columns_array = scraping.repeat_scraping
    # p scraping.scraping
    # # JobOfferSavingService.new(job_offer_columns_array).save_with_company_association
  end
end
