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
#  notes            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

#
# Classe modello per la tabella "locations".
#
class Location < ApplicationRecord

  # relazioni
  has_many :observations, dependent: :destroy
  has_many :outings, dependent: :destroy
  
  def gps
   "#{latitude} #{longitude}"
  end

end