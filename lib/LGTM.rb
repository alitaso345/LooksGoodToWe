require 'RMagick'

class LGTM
  def initialize(images)
    @image_list = Magick::ImageList.new(images.sample)
    @draw= Magick::Draw.new
  end

  def draw_text(comment)
    smaller = @image_list.rows < @image_list.columns ? @image_list.rows : @image_list.columns
    fontsize = smaller * 0.3 #縦あるいは横幅の小さい方の0.3掛けだと大体いいかんじになる
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
