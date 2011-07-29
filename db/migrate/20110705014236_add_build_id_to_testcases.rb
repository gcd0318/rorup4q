class AddBuildIdToTestcases < ActiveRecord::Migration
  def self.up
    add_column :testcases, :build_id, :integer
  end

  def self.down
    remove_column :testcases, :build_id
  end
end
