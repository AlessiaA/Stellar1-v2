# == Schema Information
#
# Table name: outings
#
#  id                 :integer          not null, primary key
#  day				  :date				
#  location  		  :string				
#  time				  :time				
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  location_id        :integer         not null
#

#
# Classe modello per la tabella "telescopes".
#
class Outing < ApplicationRecord
  # verifica la correttezza dei dati inseriti per i campi specificati.
  validates :day, :location_id, :time, presence: true
  
  belongs_to :location
  
end
