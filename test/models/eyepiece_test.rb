# == Schema Information
#
# Table name: eyepieces
#
#  id           :integer          not null, primary key
#  name         :string
#  focal_length :decimal(, )
#  ocular       :decimal(, )
#  apparent_fov :decimal(, )
#  size         :decimal(, )
#  description  :text
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  brand        :string
#

require 'test_helper'

class EyepieceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
