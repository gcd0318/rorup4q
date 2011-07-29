class CreateUserFeatureXrefs < ActiveRecord::Migration
  def self.up
    create_table :user_feature_xrefs, :id=>false do |t|
      t.integer :user_id, :null=>false
      t.integer :feature_id, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :user_feature_xrefs
  end
end
