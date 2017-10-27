# == Schema Information
#
# Table name: binoculars
#
#  id             :integer          not null, primary key
#  name           :string
#  brand          :string
#  description    :text
#  magnifications :integer
#  notes          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class BinocularTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
