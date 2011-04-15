class ContactMailer < ActionMailer::Base
  default :from => "julien.ramel@gmail.com", :to=>"julien.ramel@gmail.com"
  def contact_message(name,email,message)
    @name=name
    @email=email
    @message=message
    mail(:subject=>"Contact from #{name} jujudellago.com",:from=>email)
    
  end
end
