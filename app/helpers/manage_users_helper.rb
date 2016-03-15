module ManageUsersHelper
  def send_reset_password_notification(user, password)
    UserMailer.password_reset_notification(user, password).deliver_now
  end
end
