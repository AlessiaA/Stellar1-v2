# == Schema Information
#
# Table name: celestial_bodies
#
#  id               :integer          not null, primary key
#  name             :string
#  typology         :string
#  ascension        :time
#  declination      :integer
#  magnitudo        :float
#  separation       :integer
#  size             :float
#  constellation    :string
#  map_chart_number :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

#
# Classe modello per la tabella "celestial_bodies".
#
class CelestialBody < ApplicationRecord
  # verifica la correttezza dei dati inseriti per i campi specificati
  validates :name, :typology, :ascension, :declination, :magnitudo, :size, :constellation, :map_chart_number, presence: true
  # relazioni
  has_many :observations, dependent: :destroy
  
end
