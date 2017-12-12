
class Mapping < ActiveRecord::Base
  belongs_to :observation
  belongs_to :celestial_body
end

