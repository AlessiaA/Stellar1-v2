# == Schema Information
#
# Table name: observations
#
#  id                     :integer          not null, primary key
#  start_time             :datetime
#  telescope_id           :integer
#  binocular_id           :integer
#  eyepiece_id            :integer
#  filter_id			  :integer
#  rating                 :integer
#  description            :string
#  image                  :integer
#  notes                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer          not null
#  celestial_body_id      :integer
#  observative_session_id :integer          not null
#

#
# Classe modello per la tabella "observations".
#
class Observation < ApplicationRecord
  validates :celestial_body_id, presence: true
  
  # relazioni 
  belongs_to :observative_session
  belongs_to :user
  belongs_to :celestial_body
  belongs_to :binocular, optional: true
  belongs_to :telescope, optional: true
  belongs_to :eyepiece, optional: true
  belongs_to :filter, optional: true

end
