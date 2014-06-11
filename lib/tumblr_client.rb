require 'tumblr_client'

class TumblrAPI
  def initialize(settings)
    tumblr = settings["tumblr"]

    Tumblr.configure do |config|
      config.consumer_key = tumblr["consumer_key"]
      config.consumer_secret = tumblr["consumer_secret"]
      config.oauth_token = tumblr["oauth_token"]
      config.oauth_token_secret = tumblr["oauth_token_secret"]
    end
  end

  def get_image()
    hoge = Tumblr::Client.new
    posts_info = hoge.posts("alitaso345.tumblr.com", :type => "photo", :limit => 2)
    p posts_info.size
    posts_info.each do |post|
      p post
      post_detail = post["posts"][0]
      p post_detail["post_url"]
    end
  end
end
