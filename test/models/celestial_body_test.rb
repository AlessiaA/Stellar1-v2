# == Schema Information
#
# Table name: celestial_bodies
#
#  id               :integer          not null, primary key
#  name             :string
#  typology         :string
#  ascension        :time
#  declination      :integer
#  magnitudo        :float
#  separation       :integer
#  size             :float
#  constellation    :string
#  map_chart_number :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CelestialBodyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
