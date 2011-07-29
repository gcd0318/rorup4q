class CreateUserBugXrefs < ActiveRecord::Migration
  def self.up
    create_table :user_bug_xrefs, :id=>false do |t|
      t.integer :user_id
      t.integer :bug_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_bug_xrefs
  end
end
