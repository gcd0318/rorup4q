class AddAssignToIdToBugs < ActiveRecord::Migration
  def self.up
    add_column :bugs, :assign_to_id, :integer
  end

  def self.down
    remove_column :bugs, :assign_to_id
  end
end
