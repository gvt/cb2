class CreateThreeDObjects < ActiveRecord::Migration
  def self.up
    create_table :three_d_objects do |t|
      t.string :object_file_name
      t.string :object_content_type
      t.integer :object_file_size
      t.datetime :object_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :three_d_objects
  end
end