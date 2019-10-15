class Photo < ApplicationRecord
  belongs_to :fixpoint

  validates :url, presence: true
end
