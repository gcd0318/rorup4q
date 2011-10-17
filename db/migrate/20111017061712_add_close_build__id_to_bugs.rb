class AddCloseBuildIdToBugs < ActiveRecord::Migration
  def self.up
    add_column :bugs, :close_build_id, :integer
  end

  def self.down
    remove_column :bugs, :close_build_id
  end
end
