class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject} - #{message.cc}"
    message.to = ["john.pollo@strata.co.in"]
    message.cc = "akhilesh.kataria@example.com"
  end
end