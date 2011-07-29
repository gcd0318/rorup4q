class RemoveColumnFromTestcaseXref < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE testcase_xrefs DROP COLUMN from_case_id"
    execute "ALTER TABLE testcase_xrefs DROP COLUMN to_case_id"
  end

  def self.down
  end
end
