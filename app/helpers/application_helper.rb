module ApplicationHelper
  def render_image(url, size)
      image_tag(url, size: size, :onerror => "this.src=#{url};")
  end
  def build_product_options
  	options = {'-- Please Select  --' => ''}
    Product.all.each {|pdt| options = options.merge({pdt.name => pdt.id}) }
    options
  end
end
