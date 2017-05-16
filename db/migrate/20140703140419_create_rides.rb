class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.belongs_to :attraction
      t.belongs_to :user
    end
  end
end
