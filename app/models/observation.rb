# == Schema Information
#
# Table name: observations
#
#  id                     :integer          not null, primary key
#  start_time             :datetime
#  tool_tipology          :string
#  tool_id                :integer
#  eyepiece_id            :integer
#  filter_id			  :integer
#  rating                 :integer
#  description            :string
#  image                  :integer
#  notes                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#  celestial_body_id      :integer
#  observative_session_id :integer
#

#
# Classe modello per la tabella "observations".
#
class Observation < ApplicationRecord

  # relazioni 
  belongs_to :observative_session
  belongs_to :user
  belongs_to :celestial_body
  belongs_to :telescope
  belongs_to :binocular
  belongs_to :eyepiece
  belongs_to :filter

end
