class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.integer :track_id
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
