# == Schema Information
#
# Table name: observative_sessions
#
#  id               :integer          not null, primary key
#  datetime			:datetime
#  name             :string
#  latitude         :decimal
#  longitude        :decimal
#  altitude         :integer
#  bortle           :integer
#  sqm              :integer
#  completed        :boolean
#  antoniadi        :integer
#  pickering        :integer
#  sky_transparency :integer
#  user_id          :integer         not null
#  start            :time
#  end              :time
#  notes            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ObservativeSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
