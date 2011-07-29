class CreateBugXrefs < ActiveRecord::Migration
  def self.up
    create_table :bug_xrefs, :id=>false do |t|
      t.integer :from_id
      t.integer :to_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bug_xrefs
  end
end
