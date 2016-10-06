class Event < ActiveRecord::Base

  has_many :users, through: :requests, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :requests, :dependent => :destroy
  has_many :categories, through: :events_categories, :dependent => :destroy
  has_many :events_categories, :dependent => :destroy


end
