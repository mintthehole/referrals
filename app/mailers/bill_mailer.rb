class BillMailer < ActionMailer::Base
  helper :application

  default :from => "example@strata.co.in"
  

  def send_mail(email, product, items, quantities)
  	@product = product
  	@items = items
  	@quantities = quantities
    mail(:to => email, :subject => "#{product.name} Bill - Dated #{Time.zone.today.strftime("%d %b %y")}")
  end
end