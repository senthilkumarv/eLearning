class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.string :poster
      t.text :detail
      t.text :url
      t.integer :hitcount
      t.integer :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
