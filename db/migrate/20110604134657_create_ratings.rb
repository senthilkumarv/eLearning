class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :value
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
