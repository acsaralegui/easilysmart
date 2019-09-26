class Coach < ApplicationRecord

  belongs_to :user
  has_many :comments

  validates :name, presence: true
  validates :bio, presence: true
  validates :System_type, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

 
end
