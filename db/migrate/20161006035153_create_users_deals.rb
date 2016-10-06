class CreateUsersDeals < ActiveRecord::Migration
  def change
    create_table :users_deals, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :deal, index: true
    end
  end
end
