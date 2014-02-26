class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def admin_notification_email(admins, grant_application)
    @grant_application = grant_application
    @admins = admins

    admins.each do |admin|
      mail(to: admin.email, subject: 'You Have Received a New Grant Application')
    end
  end
end
