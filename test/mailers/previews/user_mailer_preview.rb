# Action Mailer preview fornisce un modo per mostrare l'aspetto delle mail visitando l'URL speciale che le renderizza
# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    UserMailer.Notification_Mailer(User.first)
  end
end
