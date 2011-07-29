class AddColumnToTestcaseXref < ActiveRecord::Migration
  def self.up
    add_column :testcase_xrefs, :from_id, :integer
    add_column :testcase_xrefs, :to_id, :integer
  end

  def self.down
    remove_column :testcase_xrefs, :to_id
    remove_column :testcase_xrefs, :from_id
  end
end
