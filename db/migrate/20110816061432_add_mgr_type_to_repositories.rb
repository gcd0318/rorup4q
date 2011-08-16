class AddMgrTypeToRepositories < ActiveRecord::Migration
  def self.up
    add_column :repositories, :mgr_type, :string
  end

  def self.down
    remove_column :repositories, :mgr_type
  end
end
