class Category < ActiveRecord::Base
	has_many :events_categories, :dependent => :destroy
	has_many :events, through: :events_categories, :dependent => :destroy
end
