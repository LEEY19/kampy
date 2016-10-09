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

  def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          type: "most_fields",
          fuzziness: 3,
          fields: ['title^10', 'text', 'location^8', 'text','event_type^9', 'text']
        }
      }
    }
  )
end

settings index: { number_of_shards: 1 } do
  mappings dynamic: 'false' do
    indexes :title, analyzer: 'english'
    indexes :text, analyzer: 'english'
    indexes :location, analyzer: 'english'
    indexes :text, analyzer: 'english'
    indexes :event_type, analyzer: 'english'
    indexes :text, analyzer: 'english'
  end
end


end

# Delete the previous events index in Elasticsearch
Event.__elasticsearch__.client.indices.delete index: Event.index_name rescue nil

# Create the new index with the new mapping
Event.__elasticsearch__.client.indices.create \
  index: Event.index_name,
  body: { settings: Event.settings.to_hash, mappings: Event.mappings.to_hash }


Event.import
