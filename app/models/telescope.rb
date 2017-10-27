# == Schema Information
#
# Table name: telescopes
#
#  id                 :integer          not null, primary key
#  brand              :string
#  name               :string
#  description        :text
#  notes              :text
#  angular_resolution :float
#  magnitude          :float
#  focal_ratio        :float
#  finderscope        :integer
#  focal_length       :integer
#  mount              :integer
#  aperture           :integer
#  typology           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

#
# Classe modello per la tabella "telescopes".
#
class Telescope < ApplicationRecord
  # verifica la correttezza dei dati inseriti per i campi specificati.
  validates :brand, :name, :description, :angular_resolution,
            :magnitude, :focal_ratio, :finderscope, :focal_length, :mount,
            :aperture, :typology, presence: true

  before_save :trim_data


  private

  # Funzione che arrotonda i valori dei campi "angular_resolution" e
  # "magnitude" a tre cifre decimali.
  def trim_data
    self.angular_resolution = self.angular_resolution.round(3)
    self.magnitude = self.magnitude.round(3)
  end

end
