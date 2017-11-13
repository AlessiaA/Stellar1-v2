# == Schema Information
#
# Table name: observations
#
#  id                     :integer          not null, primary key
#  start_time             :datetime
#  telescope_name           :integer
#  binocular_name           :integer
#  eyepiece_name            :integer
#  filter_id			  :integer
#  rating                 :integer
#  description            :string
#  image                  :integer
#  notes                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#  celestial_body_name      :integer
#  observative_session_id :integer
#

#
# Classe modello per la tabella "observations".
#
class Observation < ApplicationRecord
  validates :celestial_body_name, presence: true
  
  # relazioni 
  belongs_to :observative_session
  belongs_to :user

end
