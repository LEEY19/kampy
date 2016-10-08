require 'elasticsearch/model'

class Event < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  after_validation :geocode
  # before_create :full_address
  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude, :address => :full_address
  has_many :users, through: :requests, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :requests, :dependent => :destroy
  has_many :categories, through: :events_categories, :dependent => :destroy
  has_many :events_categories, :dependent => :destroy
  belongs_to :user


end

Event.import
