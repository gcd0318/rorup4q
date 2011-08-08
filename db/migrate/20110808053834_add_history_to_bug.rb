class AddHistoryToBug < ActiveRecord::Migration
  def self.up
    add_column :bugs, :history, :string
  end

  def self.down
    remove_column :bugs, :history
  end
end
