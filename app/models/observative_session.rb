# == Schema Information
#
# Table name: observative_sessions
#
#  id               :integer          not null, primary key
#  date 			:datetime
#  name             :string
#  latitude         :decimal
#  longitude        :decimal
#  altitude         :integer
#  bortle           :integer
#  sqm              :integer
#  completed        :boolean
#  antoniadi        :integer
#  pickering        :integer
#  sky_transparency :integer
#  user_id          :integer         not null
#  start            :time
#  end              :time
#  notes            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

#
# Classe modello per la tabella "observative_sessions".
#
class ObservativeSession < ApplicationRecord
  
  # relazioni
  belongs_to :user
  has_many :observations, dependent: :destroy

end
