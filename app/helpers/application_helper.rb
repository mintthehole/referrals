module ApplicationHelper
  def render_image(url, size)
      image_tag(url, size: size, :onerror => "this.src=#{url};")
  end
end
