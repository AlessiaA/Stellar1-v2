# == Schema Information
#
# Table name: observative_sessions
#
#  id               :integer          not null, primary key
#  name             :string
#  category         :integer
#  start            :datetime
#  end              :datetime
#  antoniadi        :integer
#  pickering        :integer
#  sky_transparency :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#

require 'test_helper'

class ObservativeSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
