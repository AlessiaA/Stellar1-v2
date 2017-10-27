# == Schema Information
#
# Table name: telescopes
#
#  id                 :integer          not null, primary key
#  brand              :string
#  name               :string
#  description        :text
#  notes              :text
#  angular_resolution :float
#  magnitude          :float
#  focal_ratio        :float
#  finderscope        :integer
#  focal_length       :integer
#  mount              :integer
#  aperture           :integer
#  typology           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class TelescopeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
