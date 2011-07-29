class AddSeverityToBugs < ActiveRecord::Migration
  def self.up
    add_column :bugs, :severity, :string, :default=>'MID'
  end

  def self.down
    remove_column :bugs, :severity
  end
end
