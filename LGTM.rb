require 'RMagick'

class LGTM
  def initialize(image_name, comment)
    @image = Magick::ImageList.new(image_name)
    @comment = comment
    @draw= Magick::Draw.new
  end
end

LGTM.new("eru.jpg", "LGTM")
