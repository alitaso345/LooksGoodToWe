require "yaml"
require_relative 'lib/LGTM'
require_relative 'lib/tumblr_client'

path = File.join(__dir__, "settings.yml")
settings = YAML.load(open(path))

images_from_tumblr = TumblrAPI.new(settings).get_image_url

images = ARGV[0] || images_from_tumblr
LGTM.new(images).draw_text("LGTM")
