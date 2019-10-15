class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :fixpoints
  has_many :votes

  validates :name, presence: true

  def initials
    names = name.split(' ')

    if names.size == 1
      names[0].first
    else
      "#{names[0].first}#{names.last.first}"
    end
  end
end
