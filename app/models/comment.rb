class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :coach

   RATINGS = {
    'one star': '*',
    'two stars': '**',
    'three stars': '***',
    'four stars': '****',
    'five stars': '*****'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end
end
