# == Schema Information
#
# Table name: filters
#
#  id          :integer          not null, primary key
#  name        :string
#  brand       :string
#  description :text
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class FilterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
