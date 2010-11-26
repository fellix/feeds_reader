class Feed < ActiveRecord::Base
  validates :url, :presence => true
  attr_accessor :title, :entries
  
  def parser
    parsed = Feedzirra::Feed.fetch_and_parse(self.url)
    self.title = parsed.title
    self.entries = parsed.entries    
  end
end
