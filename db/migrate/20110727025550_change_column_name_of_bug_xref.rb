class ChangeColumnNameOfBugXref < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE bug_xrefs DROP COLUMN from_id"
    execute "ALTER TABLE bug_xrefs DROP COLUMN to_id"
    add_column :bug_xrefs, :from_bug_id, :integer
    add_column :bug_xrefs, :to_bug_id, :integer
  end

  def self.down
  end
end
