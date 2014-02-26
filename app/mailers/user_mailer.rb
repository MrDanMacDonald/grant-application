class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def thankyou_email(user)
    @user = user  
    mail(to: user.email, subject: 'Thank You for Your Application')
  end
  
end
