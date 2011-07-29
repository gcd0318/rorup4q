class CreateBuilds < ActiveRecord::Migration
  def self.up
    create_table :builds do |t|
      t.string :name
      t.time :build_date, :default=>Time.now
      t.integer :track_id

      t.timestamps
    end
  end

  def self.down
    drop_table :builds
  end
end
