# == Schema Information
#
# Table name: filters
#
#  id          :integer          not null, primary key
#  name        :string
#  brand       :string
#  description :text
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#
# Classe modello per la tabella "filters".
#
class Filter < ApplicationRecord
  # verifica la correttezza dei dati inseriti per i campi specificati.
  validates :name, :description, :brand, presence: true
end
