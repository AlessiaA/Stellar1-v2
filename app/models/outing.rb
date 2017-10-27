# == Schema Information
#
# Table name: outings
#
#  id                 :integer          not null, primary key
#  day				  :date
#  location			  :text
#  time				  :time
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

#
# Classe modello per la tabella "telescopes".
#
class Outing < ApplicationRecord
  # verifica la correttezza dei dati inseriti per i campi specificati.
  validates :day, :location, :time, presence: true
end
