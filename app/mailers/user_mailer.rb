# La classe crea un messaggio per essere spedito via mail.

class UserMailer < ApplicationMailer
 default from: 'stellar1.udine@gmail.com'

 def Notification_Mailer(user)

   @user = user

   if @user != nil
     mail(to: @user.email, subject:'Avviso di scadenza tessera')
   end

 end

end
