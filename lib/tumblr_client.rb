require 'tumblr_client'

class TumblrAPI
  def initialize(settings)
    @tumblr = settings["tumblr"]

    Tumblr.configure do |config|
      config.consumer_key = @tumblr["consumer_key"]
      config.consumer_secret = @tumblr["consumer_secret"]
      config.oauth_token = @tumblr["oauth_token"]
      config.oauth_token_secret = @tumblr["oauth_token_secret"]
    end
  end

  def get_image_url()
    client = Tumblr::Client.new
    posts_info = client.posts("#{@tumblr["user_name"]}", :type => "photo", :limit => 50)
    posts =  posts_info["posts"]

    #画像のURLだけを取り出してまとめる.サイズに関しては適当
    image_urls = Array.new
    posts.each{|post| image_urls << post["photos"].first["original_size"]["url"]}

    return image_urls
  end
end
