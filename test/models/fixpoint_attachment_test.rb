# == Schema Information
#
# Table name: fixpoint_attachments
#
#  id          :bigint           not null, primary key
#  photo       :string
#  fixpoint_id :bigint
#  fixed       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class FixpointAttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
