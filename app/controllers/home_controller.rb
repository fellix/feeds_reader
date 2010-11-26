class HomeController < ApplicationController
  def index
    @feeds = Feed.all
  end
  def twitter
    search = Twitter::Search.new
    @twitter_results = search.hashtag(params[:twitter][:search]).fetch
  end
  def new_feed
    @feed = Feed.new(params[:feed])
    @feed.save
    redirect_to feed_list_path
  end
  def feed_list
    @feeds = Feed.all    
  end
end
