require 'test_helper'

# Nel test viene spedito la mail e memorizzato l'oggetto di ritorno nella variabile email.
# Poi ci si assicura che è stata spedita con i parametri richiesti.
# Le informazioni degli utenti sono quelle contenute nelle fixture.

class UserMailerTest < ActionMailer::TestCase

  setup do
    # Elimina eventuali dati dall'array dei deliveries
    ActionMailer::Base.deliveries.clear

    #Viene scelto un utente contenuto nelle fixure e viene creata una mail.
    #Una volta creata la mail la si memorizzata le compiere le asserzioni
    @user = User.first
    @email = UserMailer.Notification_Mailer(@user)
  end

  # Controlla che l'array deliveries sia vuoto
  test "should be deliveries empty" do
    assert ActionMailer::Base.deliveries.empty?
  end

  # Controlla che la mail di test sia stata inviata e impilata nell'array
  test "should be email sent and queued" do
    assert_emails 1 do
      @email.deliver_now
    end
  end

  # Controlla che i parametri della mail siano corretti
  test "should the parameters be corrected" do
   assert_equal ['stellar1.udine@gmail.com'], @email.from
   assert_equal ['mail@example.com'], @email.to
   assert_equal 'Avviso di scadenza tessera', @email.subject
 end

end
