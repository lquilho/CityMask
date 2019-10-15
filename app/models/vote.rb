# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :fixpoint
  
  validates :user, uniqueness: { scope: :fixpoint }
end
