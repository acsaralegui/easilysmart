class Section < ApplicationRecord
  belongs_to :tutorial
  has_many :chapters
end
