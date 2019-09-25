class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurent

  validates :review, :presence => true
  validates :ratings, :presence => true
end
