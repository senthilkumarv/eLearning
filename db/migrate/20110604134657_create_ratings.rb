class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :value
      t.text :comment
      t.integer :topic_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
