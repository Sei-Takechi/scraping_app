class PostsController < ApplicationController

  include YahooScrapesConcern

  def new
    @post_title = set_yahoo_posts_title
  end

end
