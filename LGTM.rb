require 'RMagick'

class LGTM
  def initialize(image_name)
    @image = Magick::ImageList.new(image_name)
    @draw= Magick::Draw.new
  end

  def draw_text(comment)
    @comment = comment
  end
end

LGTM.new("eru.jpg").draw_text("LGTM")
