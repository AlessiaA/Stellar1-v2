# == Schema Information
#
# Table name: binoculars
#
#  id             :integer          not null, primary key
#  name           :string
#  brand          :string
#  description    :text
#  magnifications :integer
#  notes          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

#
# Classe modello per la tabella "binoculars".
#
class Binocular < ApplicationRecord
  # verifica la correttezza dei dati inseriti per i campi specificati
  validates :name, :brand, :magnifications, presence: true
end
