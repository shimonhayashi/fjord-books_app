class WelcomeMailer < ApplicationMailer
  default from: ENV["SEND_MAILER_ADDRESS"]

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'welcome to my family!')
  end
end
