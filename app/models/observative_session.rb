# == Schema Information
#
# Table name: observative_sessions
#
#  id               :integer          not null, primary key
#  name             :string
#  category         :integer
#  start            :datetime
#  end              :datetime
#  antoniadi        :integer
#  pickering        :integer
#  sky_transparency :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#

#
# Classe modello per la tabella "observative_sessions".
#
class ObservativeSession < ApplicationRecord

  # relazioni
  belongs_to :user
  has_many :observations, dependent: :destroy

end
