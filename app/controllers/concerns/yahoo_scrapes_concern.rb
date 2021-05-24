
module YahooScrapesConcern
  # URLにアクセスするためのライブラリの読み込み
  require 'open-uri'
  # Nokogiriライブラリの読み込み
  require 'nokogiri'

  def set_yahoo_posts_title
    # スクレイピング先のURL
    url = 'http://www.yahoo.co.jp/'
  
    charset = nil
    html = URI.open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
  
    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)
  
    # タイトルを表示
    p doc.title
  end
end