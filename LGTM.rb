require 'RMagick'

class LGTM
  def initialize(image_name)
    @image = Magick::ImageList.new(image_name)
    @draw= Magick::Draw.new
  end

  def draw_text(comment)
    @draw.annotate(@image, 0, 0, 0, 0, comment) do
      self.fill = "white"
      self.pointsize = 100
      self.gravity = Magick::CenterGravity
    end
  end

  end
end

LGTM.new("eru.jpg").draw_text("LGTM")
