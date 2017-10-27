# == Schema Information
#
# Table name: celestial_bodies
#
#  id               :integer          not null, primary key
#  name             :string
#  typology         :string
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

  # relazioni
  has_many :observations, dependent: :destroy

end
