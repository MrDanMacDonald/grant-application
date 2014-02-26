class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def admin_notification_email(admins, grant_application)
    @grant_application = grant_application
    @admins = admins
    # @url = "http://0.0.0.0:3000/admin/grant_applications/#{grant_application.id}/"
    
    admins.each do |admin|
      mail(to: admin.email, subject: 'You Have Received a New Grant Application')
    end
  end
end
