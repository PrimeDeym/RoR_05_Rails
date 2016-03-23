class UserMailer < ApplicationMailer

  def not_review petition
    @petition = petition
    @user = @petition.user
    mail to: @user.email, subject: 'Ваша петиция не будет рассмотрена'
  end

  def will_review petition
    @petition = petition
    @user = @petition.user
    mail to: @user.email, subject: 'Ваша петиция будет расмотрена'
  end
end
