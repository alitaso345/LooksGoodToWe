require 'RMagick'

class LGTM
  def initialize(image_name)
    @image_list = Magick::ImageList.new(image_name)
    @draw= Magick::Draw.new
  end

  def draw_text(comment)
    fontsize = @image_list.rows * 0.5 #0.5掛けだといいかんじになる
    @image_list.each do |image|
      @draw.annotate(image, 0, 0, 0, 0, comment) do
        self.fill = "white"
        self.pointsize = fontsize
        self.gravity = Magick::CenterGravity
      end
    end

    save_image(@image_list)
  end

  def save_image(image)
    image.write("output.png") if @image_list.size == 1
    image.write("output.gif") if @image_list.size > 1
  end
end
