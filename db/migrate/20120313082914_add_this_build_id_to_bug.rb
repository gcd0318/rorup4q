class AddThisBuildIdToBug < ActiveRecord::Migration
  def self.up
    add_column :bugs, :this_build_id, :integer
  end

  def self.down
    remove_column :bugs, :this_build_id
  end
end
