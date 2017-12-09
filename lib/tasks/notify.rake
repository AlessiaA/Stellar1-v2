
# Il codice imposta un task che controlla l'attibuto subscription_expiration della tabella Users
# e lo confronta con la data odierna per verificare se la scadenza della tessera è tra 15 giorni.
# In caso affermativo chiama il metodo per inviare la mail di notifica all'utente.

# E' possibile eseguire il task da terminale con l'istruzione "bundle exec rake notify:expiration"

namespace :notify do

  desc "Rake task to notify"
  task :expiration => :environment do

    User.find_each do |user|
      if ((user.subscription_expiration - DateTime.now).to_i == 15)
        UserMailer.Notification_Mailer(user).deliver
      end
    end

  end

end
