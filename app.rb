require_relative 'lib/LGTM'
require_relative 'lib/tumblr_client'

image_name = ARGV[0]
LGTM.new(image_name).draw_text("LGTM")
