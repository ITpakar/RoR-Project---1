class UserMailer < ApplicationMailer
  def password_reset_notification(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: "Your password is changed by the Admin!")
  end
end
