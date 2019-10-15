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

class Fixpoint < ApplicationRecord
  has_many :votes
  has_many :fixpoint_attachments
  belongs_to :user

  accepts_nested_attributes_for :fixpoint_attachments

  enum category: [:aesthetics, :pollution, :accessibility, :hazard]

  geocoded_by :address # add geocode by IP
  reverse_geocoded_by :latitude, :longitude

  reverse_geocoded_by :latitude, :longitude do |fixp, results|
    if geo = results.first
      fixp.address = [geo.street, geo.house_number].join(', ')
    end
  end

  after_validation :geocode, :reverse_geocode

  validates :fixpoint_attachments, presence: true
  # validates :latitude, presence: true
  # validates :longitude, presence: true


  validates :category, :user, presence: true
  validates :address, presence: true, if: ->(fp) { !fp.latitude || !fp.longitude }

  # validate do |fixpoint|
  #   fixpoint.errors.add(:base, "Photo is missing!") if fixpoint.fixpoint_attachments.blank?
  # end
end
