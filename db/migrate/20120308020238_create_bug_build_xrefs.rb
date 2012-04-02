class CreateBugBuildXrefs < ActiveRecord::Migration
  def self.up
    create_table :bug_build_xrefs, :id=>false do |t|
      t.integer :bug_id
      t.integer :build_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bug_build_xrefs
  end
end
