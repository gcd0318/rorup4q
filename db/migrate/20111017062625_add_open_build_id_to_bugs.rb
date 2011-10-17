class AddOpenBuildIdToBugs < ActiveRecord::Migration
  def self.up
    add_column :bugs, :open_build_id, :integer
  end

  def self.down
    remove_column :bugs, :open_build_id
  end
end
