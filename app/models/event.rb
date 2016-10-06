class Event < ActiveRecord::Base

  has_many :users, through: :requests
  has_many :reviews
  has_many :requests
  has_many :categories, through: :events_categories
  has_many :events_categories


end
