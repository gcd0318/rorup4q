class AddAssignToIdToTestcase < ActiveRecord::Migration
  def self.up
    add_column :testcases, :assign_to_id, :integer
  end

  def self.down
    remove_column :testcases, :assign_to_id
  end
end
