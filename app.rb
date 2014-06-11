require "yaml"
require_relative 'lib/LGTM'
require_relative 'lib/tumblr_client'

path = File.join(__dir__, "settings.yml")
settings = YAML.load(open(path))

images = TumblrAPI.new(settings).get_image_url

LGTM.new(images).draw_text("LGTM")
