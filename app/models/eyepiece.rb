# == Schema Information
#
# Table name: eyepieces
#
#  id           :integer          not null, primary key
#  name         :string
#  focal_length :decimal(, )
#  ocular       :decimal(, )
#  apparent_fov :decimal(, )
#  size         :decimal(, )
#  description  :text
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  brand        :string
#

#
# Classe modello per la tabella "eyepieces".
#
class Eyepiece < ApplicationRecord
  # verifica la correttezza dei dati inseriti per i campi specificati.
  validates :name, :brand, :focal_length, :ocular, :apparent_fov, :size, presence: true

  before_save :trim_data

  private

  # Funzione che arrotonda i valori dei campi "focal_length" e "apparent_fov"
  # a tre cifre decimali.
  def trim_data
    self.focal_length = self.focal_length.round(3)
    self.apparent_fov = self.apparent_fov.round(3)
  end

end
