# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Questo file è creato con l'istruzione "wheneverize ." da riga di comando.

# Usare questo file per definire i cron job SOLO in fase di sviluppo e test!!
# In fase di produzione viene usato lo scheduler della piattaforma Heroku!

# L'istruzione da terminale "whenever" mostra questo file convertito nella sintassi cron, ma non legge ne scrive il file crontab.
# Al fine di creare il job bisogna eseguire il comando "whenever --update-crontab".

# Imposta un task da eseguire ogni giorno al fine di inviare la notifica di scadenza via mail
if @environment == "production"
  every :day, :at => '04:00 am' do
    rake "notify:expiration"
  end
end
