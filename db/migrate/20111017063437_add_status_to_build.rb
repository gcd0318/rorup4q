class AddStatusToBuild < ActiveRecord::Migration
  def self.up
    add_column :builds, :status, :string
  end

  def self.down
    remove_column :builds, :status
  end
end
