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
#  user_id                :integer
#  celestial_body_id      :integer
#  observative_session_id :integer
#

#
# Classe modello per la tabella "observations".
#
class Observation < ApplicationRecord
   validates :celestial_body_name, presence: true
  
  
  def celestial_body_name
	CelestialBody.where(name: ' ')
  end
  def celestial_body_name= (name)
    celestyal_body_id = CelestialBody.where(name: celestial_body_name)
  end
  
  def binocular_name
	Binocular.where("binocular.name == binocular_name")
  end
  #def binocular_name= (b)
   # self.binocular_id = b.id 
  #end
  
  def telescope_name
	t = Telescope.where("telescope.name == telescope_name")
  end
  #def telescope_name= (t)
   # self.telescope_id = t.id 
  #end
  
  def eyepiece_name
	e = Eyepiece.where("eyepiece.name == eyepiece_name")
  end
  #def eyepiece_name= (e)
   # self.eyepiece_id = e.id 
  #end
  
  def filter_name
	f = Filter.where("filter.name == filter_name")
  end
  #def filter_name= (f)
   # self.filter_id = f.id
  #end
  
  # relazioni 
  belongs_to :observative_session
  belongs_to :user
  belongs_to :celestial_body
  belongs_to :telescope
  belongs_to :binocular
  belongs_to :eyepiece
  belongs_to :filter

end
