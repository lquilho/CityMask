# == Schema Information
#
# Table name: fixpoints
#
#  id         :bigint           not null, primary key
#  fixed      :boolean
#  fix_date   :date
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :integer
#  user_id    :bigint
#

require 'test_helper'

class FixpointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
