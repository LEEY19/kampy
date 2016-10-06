class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :status
      t.references :user
      t.references :event
      t.timestamps null: false
    end
  end
end
