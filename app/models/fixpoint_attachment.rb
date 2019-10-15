class FixpointAttachment < ApplicationRecord
  belongs_to :fixpoint
  mount_uploader :photo, PhotoUploader

  validates :photo, presence: true
end
