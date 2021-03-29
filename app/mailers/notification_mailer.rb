class NotificationMailer < ApplicationMailer
  def complete_mail(user)
    @user = user
    mail(subject: "登録完了メール", from: Anquiz, to: @user.email)
  end
end
