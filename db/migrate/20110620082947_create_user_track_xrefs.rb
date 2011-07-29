class CreateUserTrackXrefs < ActiveRecord::Migration
  def self.up
    create_table :user_track_xrefs, :id=>false do |t|
      t.integer :user_id
      t.integer :track_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_track_xrefs
  end
end
