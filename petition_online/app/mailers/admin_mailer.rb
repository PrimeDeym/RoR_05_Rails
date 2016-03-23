class AdminMailer < ApplicationMailer
  def review_user_petition petition
    @petition = petition
    mail to: 'admin@petition-online.com.ua', subject: 'Петиция для рассмотрения'
  end
end
