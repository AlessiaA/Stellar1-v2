# == Schema Information
#
# Table name: locations
#
#  id               :integer          not null, primary key
#  name 			:text
#  latitude         :string
#  longitude        :string
#  altitude         :integer
#  bortle           :integer
#  sqm              :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

#
# Classe modello per la tabella "locations".
#
class Location < ApplicationRecord
  # verifica la correttezza dei dati inseriti per i campi specificati
  validates :name, presence: true

  # relazioni
  has_many :observative_sessions, dependent: :destroy
  has_many :outings, dependent: :destroy


end