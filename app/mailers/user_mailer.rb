class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user_username = user.username
    @user_reset_digest = user.reset_digest
    mail to: user.email, subject: "Knowledge Quest Password Reset"
    # mail(to: <ADMIN_EMAIL>, subject: "You got a new order!")
  end
end

